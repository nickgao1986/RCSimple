//
//  RCUIReOrderTableView.m
//  RingCentralNewUX
//
//  Created by Kingle.Zhuang on 3/6/15.
//  Copyright (c) 2015 RingCentral. All rights reserved.
//

#import "RCUIReOrderTableView.h"
#import <RCUIKit/RCUITableViewCell.h>
#import <RCUIKit/RCUIGlobalCommon.h>

@interface RCUIReOrderTableView ()
@property (nonatomic, assign) CGPoint touchOffset;
@property (nonatomic, retain) UIView  *snapshotOfMovingCell;
@property (nonatomic, retain) UILongPressGestureRecognizer *movingGestureRecognizer;
@property (nonatomic, retain) NSTimer *autoscrollTimer;
@property (nonatomic, assign) NSInteger autoscrollDistance;
@property (nonatomic, assign) NSInteger autoscrollThreshold;
@end

@implementation RCUIReOrderTableView

- (id) initWithFrame: (CGRect)frame style: (UITableViewStyle)style;
{
    self = [super initWithFrame: frame style: style];
    if (self)
    {
        [self setupGestureRecognizer];
    }
    return self;
}

- (void) cancelIfNeeded;
{
    self.movingGestureRecognizer.enabled = NO;
    self.movingGestureRecognizer.enabled = YES;
}

- (void) setupGestureRecognizer;
{
    self.movingGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget: self action: @selector (handleGesture:)];
    self.movingGestureRecognizer.delegate = self;
    [self addGestureRecognizer: self.movingGestureRecognizer];
}

- (BOOL) gestureRecognizerShouldBegin: (UIGestureRecognizer *)gestureRecognizer;
{
    BOOL shouldBegin = YES;
    
    if ([gestureRecognizer isEqual: self.movingGestureRecognizer])
    {
        if (self.editing)
        {
            return NO;
        }
        
        CGPoint touchPoint = [gestureRecognizer locationInView: self];
        NSIndexPath *touchedIndexPath = [self indexPathForRowAtPoint: touchPoint];
        shouldBegin = [self isValidIndexPath: touchedIndexPath];
        
        if (shouldBegin && [self.dataSource respondsToSelector: @selector (tableView:canMoveRowAtIndexPath:)])
        {
            shouldBegin = [self.dataSource tableView: self canMoveRowAtIndexPath: touchedIndexPath];
        }
    }
    
    return shouldBegin;
}

- (void) handleGesture: (UILongPressGestureRecognizer *)gestureRecognizer;
{
    switch (gestureRecognizer.state)
    {
    case UIGestureRecognizerStateBegan:
        {
            CGPoint touchPoint = [gestureRecognizer locationInView: self];
            [self prepareForMovingRowAtTouchPoint: touchPoint];
        }
        break;
            
    case UIGestureRecognizerStateChanged:
        {
            CGPoint touchPoint = [gestureRecognizer locationInView: self];
            [self moveSnapshotToLocation: touchPoint];
            [self maybeAutoscroll];
            
            if (![self isAutoscrolling])
            {
                [self moveRowToLocation: touchPoint];
            }
        }
        break;
            
    case UIGestureRecognizerStateEnded:
        {
            [self finishMovingRow];
        }
        break;
            
    default:
        {
            [self cancelMovingRowIfNeeded];
        }
        break;
    }
}

- (void) prepareForMovingRowAtTouchPoint: (CGPoint)touchPoint;
{
    NSIndexPath *touchedIndexPath = [self indexPathForRowAtPoint: touchPoint];
    self.initialIndexPathForMovingRow = touchedIndexPath;
    self.movingIndexPath = touchedIndexPath;
    
    self.snapshotOfMovingCell = [self snapshotFromRowAtMovingIndexPath];
    [self addSubview: self.snapshotOfMovingCell];
    
    self.touchOffset = CGPointMake (self.snapshotOfMovingCell.center.x - touchPoint.x, self.snapshotOfMovingCell.center.y - touchPoint.y);
    [self prepareAutoscrollForSnapshot];
}

- (void) finishMovingRow;
{
    [self stopAutoscrolling];
    
    CGRect finalFrame = [self rectForRowAtIndexPath: self.movingIndexPath];
    if (CGRectEqualToRect (finalFrame, CGRectZero))
    {
        return;
    }
    
    finalFrame = CGRectMake (finalFrame.origin.x, finalFrame.origin.y, finalFrame.size.width, self.snapshotOfMovingCell.frame.size.height);
    
    [UIView animateWithDuration: 0.2
                     animations: ^{
                         self.snapshotOfMovingCell.frame = finalFrame;
                         self.snapshotOfMovingCell.alpha = 0.95;
                     }
                     completion: ^(BOOL finished) {
                         if (finished)
                         {
                             [self resetSnapshot];
                             if ([self.initialIndexPathForMovingRow compare: self.movingIndexPath] != NSOrderedSame)
                             {
                                 if ([self.dataSource respondsToSelector: @selector (tableView:moveRowAtIndexPath:toIndexPath:)])
                                 {
                                     [self.dataSource tableView: self moveRowAtIndexPath: self.initialIndexPathForMovingRow toIndexPath: self.movingIndexPath];
                                 }
                             }
                             [self resetMovingRow];
                         }
                     }];
}

- (void) cancelMovingRowIfNeeded;
{
    if (self.movingIndexPath != nil)
    {
        [self stopAutoscrolling];
        [self resetSnapshot];
        [self resetMovingRow];
    }
}

- (void) resetMovingRow;
{
    NSIndexPath *movingIndexPath = [[self.movingIndexPath copy] autorelease];
    self.movingIndexPath = nil;
    self.initialIndexPathForMovingRow = nil;
    if (movingIndexPath)
    {
       [self reloadRowsAtIndexPaths: @[movingIndexPath] withRowAnimation: UITableViewRowAnimationNone];
    }
}

- (void) moveRowToLocation: (CGPoint)location;
{
    NSIndexPath *newIndexPath = [self indexPathForRowAtPoint: location];
    if (![self canMoveToIndexPath: newIndexPath] || !self.movingIndexPath)
    {
        return;
    }
    
    [self beginUpdates];
    [self deleteRowsAtIndexPaths: @[self.movingIndexPath] withRowAnimation: UITableViewRowAnimationFade];
    [self insertRowsAtIndexPaths: @[newIndexPath] withRowAnimation: UITableViewRowAnimationFade];
    self.movingIndexPath = newIndexPath;
    [self endUpdates];
}

- (BOOL) canMoveToIndexPath: (NSIndexPath *)indexPath
{
    if (![self isValidIndexPath: indexPath])
    {
        return NO;
    }
    
    if ([indexPath compare: self.movingIndexPath] == NSOrderedSame)
    {
        return NO;
    }
    
    if ([self.delegate respondsToSelector: @selector (tableView:targetIndexPathForMoveFromRowAtIndexPath:toProposedIndexPath:)])
    {
        NSIndexPath *proposedDestinationIndexPath = [self.delegate tableView: self targetIndexPathForMoveFromRowAtIndexPath: self.movingIndexPath toProposedIndexPath: indexPath];
        return ([indexPath compare: proposedDestinationIndexPath] == NSOrderedSame);
    }
    
    return YES;
}

- (UIView *) snapshotFromRowAtMovingIndexPath;
{
    RCUITableViewCell *cell = (RCUITableViewCell *)[self cellForRowAtIndexPath: self.movingIndexPath];
    cell.selected    = NO;
    cell.highlighted = NO;

    [cell prepareForMoveSnapshot];
    
    UIGraphicsBeginImageContextWithOptions (cell.frame.size, NO, 0);
    [cell.layer renderInContext: UIGraphicsGetCurrentContext ()];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    UIView *snapshot = [[[UIImageView alloc] initWithImage: theImage] autorelease];
    
    snapshot.frame                = cell.frame;
    snapshot.alpha                = 0.95;
    snapshot.layer.shadowOpacity  = 0.7;
    snapshot.layer.shadowRadius   = 3.0;
    snapshot.layer.shadowOffset   = CGSizeZero;
    snapshot.layer.shadowPath     = [[UIBezierPath bezierPathWithRect: snapshot.layer.bounds] CGPath];
    
    [cell prepareForMove];
    
    return snapshot;
}

- (void) moveSnapshotToLocation: (CGPoint)touchPoint;
{
    CGPoint currentCenter = self.snapshotOfMovingCell.center;
    self.snapshotOfMovingCell.center = CGPointMake (currentCenter.x, touchPoint.y + self.touchOffset.y);
}

- (void) resetSnapshot;
{
    [self.snapshotOfMovingCell removeFromSuperview];
    self.snapshotOfMovingCell = nil;
}

- (void) prepareAutoscrollForSnapshot;
{
    self.autoscrollThreshold = CGRectGetHeight (self.snapshotOfMovingCell.frame) * 0.6;
    self.autoscrollDistance = 0;
}

- (void) maybeAutoscroll;
{
    [self determineAutoscrollDistanceForSnapShot];
    
    if (self.autoscrollDistance == 0)
    {
        [self stopAutoscrolling];
    }
    else if (!self.autoscrollTimer)
    {
        self.autoscrollTimer = [NSTimer scheduledTimerWithTimeInterval: (1.0 / 60.0)
                                                                target: self
                                                              selector: @selector (autoscrollTimerFired:)
                                                              userInfo: nil
                                                               repeats: YES];
    }
}

- (void) determineAutoscrollDistanceForSnapShot;
{
    self.autoscrollDistance = 0;
    
    if ([self canScroll] && CGRectIntersectsRect (self.snapshotOfMovingCell.frame, self.bounds))
    {
        CGPoint touchLocation = [self.movingGestureRecognizer locationInView: self];
        touchLocation.y += self.touchOffset.y;
        
        CGFloat distanceToTopEdge = touchLocation.y - CGRectGetMinY (self.bounds);
        CGFloat distanceToBottomEdge = CGRectGetMaxY (self.bounds) - touchLocation.y;
        
        if (distanceToTopEdge < self.autoscrollThreshold)
        {
            self.autoscrollDistance = [self autoscrollDistanceForProximityToEdge: distanceToTopEdge] * -1;
        }
        else if (distanceToBottomEdge < self.autoscrollThreshold)
        {
            self.autoscrollDistance = [self autoscrollDistanceForProximityToEdge: distanceToBottomEdge];
        }
    }
}

- (CGFloat) autoscrollDistanceForProximityToEdge: (CGFloat)proximity;
{
    return ceil ((self.autoscrollThreshold - proximity) / 5.0);
}

- (void) autoscrollTimerFired: (NSTimer *)timer;
{
    [self legalizeAutoscrollDistance];
    
    CGPoint contentOffset = self.contentOffset;
    contentOffset.y += self.autoscrollDistance;
    self.contentOffset = contentOffset;
    
    CGRect frame = self.snapshotOfMovingCell.frame;
    frame.origin.y += self.autoscrollDistance;
    self.snapshotOfMovingCell.frame = frame;
    
    CGPoint touchLocation = [self.movingGestureRecognizer locationInView: self];
    [self moveRowToLocation: touchLocation];
}

- (void) legalizeAutoscrollDistance;
{
    CGFloat minimumLegalDistance = self.contentOffset.y * -1.0;
    CGFloat maximumLegalDistance = self.contentSize.height - (CGRectGetHeight (self.frame) + self.contentOffset.y);
    self.autoscrollDistance = MAX (self.autoscrollDistance, minimumLegalDistance);
    self.autoscrollDistance = MIN (self.autoscrollDistance, maximumLegalDistance);
}

- (BOOL) canScroll;
{
    return (CGRectGetHeight (self.frame) < self.contentSize.height);
}

- (BOOL) isAutoscrolling;
{
    return (self.autoscrollDistance != 0);
}

- (void) stopAutoscrolling;
{
    self.autoscrollDistance = 0.0;
    if ([self.autoscrollTimer isValid])
    {
        [self.autoscrollTimer invalidate];
    }
    self.autoscrollTimer = nil;
}

- (BOOL) isValidIndexPath: (NSIndexPath *)indexPath;
{
    return (indexPath != nil && indexPath.section != NSNotFound && indexPath.row != NSNotFound);
}

- (BOOL) indexPathIsMovingIndexPath: (NSIndexPath *)indexPath;
{
    return ([indexPath compare: self.movingIndexPath] == NSOrderedSame);
}

- (NSIndexPath *) adaptedIndexPathForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    if (self.movingIndexPath == nil)
    {
        return indexPath;
    }
    
    NSInteger adaptedRow = NSNotFound;
    NSInteger movingRowOffset = 1;
    
    if ([indexPath compare: self.movingIndexPath] == NSOrderedSame)
    {
        indexPath = self.initialIndexPathForMovingRow;
    }
    else if (self.movingIndexPath.section == self.initialIndexPathForMovingRow.section)
    {
        if (indexPath.row >= self.initialIndexPathForMovingRow.row && indexPath.row < self.movingIndexPath.row)
        {
            adaptedRow = indexPath.row + movingRowOffset;
        }
        else if (indexPath.row <= self.initialIndexPathForMovingRow.row && indexPath.row > self.movingIndexPath.row)
        {
            adaptedRow = indexPath.row - movingRowOffset;
        }
    }
    else if (self.movingIndexPath.section != self.initialIndexPathForMovingRow.section)
    {
        if (indexPath.section == self.initialIndexPathForMovingRow.section && indexPath.row >= self.initialIndexPathForMovingRow.row)
        {
            adaptedRow = indexPath.row + movingRowOffset;
        }
        else if (indexPath.section == self.movingIndexPath.section && indexPath.row > self.movingIndexPath.row)
        {
            adaptedRow = indexPath.row - movingRowOffset;
        }
    }

    if (adaptedRow != NSNotFound)
    {
        indexPath = [NSIndexPath indexPathForRow: adaptedRow inSection: indexPath.section];
    }
    
    return indexPath;
}

- (void) dealloc;
{
    [self removeGestureRecognizer: self.movingGestureRecognizer];

    if (self.autoscrollTimer && [self.autoscrollTimer isValid])
    {
        [self.autoscrollTimer invalidate];
    }
    
    self.autoscrollTimer                = nil;
    self.movingGestureRecognizer        = nil;
    self.movingIndexPath                = nil;
    self.initialIndexPathForMovingRow   = nil;
    self.snapshotOfMovingCell           = nil;
    
    [super dealloc];
}

@end
