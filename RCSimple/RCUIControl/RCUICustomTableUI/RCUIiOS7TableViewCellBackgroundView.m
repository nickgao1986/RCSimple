//
//  RCUIiOS7TableViewCellBackgroundView.m
//  RCUIKit
//
//  Created by Jackie Karira on 9/23/14.
//
//

#import "RCUIiOS7TableViewCellBackgroundView.h"
#import "RCUIGlobalStyle.h"

#define kDefaultBorderWidth     1.
#define kDefaultLineHLMargin    16.

@implementation RCUIiOS7TableViewCellBackgroundView

- (id) initWithFrame: (CGRect)frame;
{
    self = [super initWithFrame: frame];
    if (self)
    {
        self.separatorInset  = kDefaultLineHLMargin;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (UIBezierPath *) bezierPathWithBorderRect: (CGRect)rect borderWidth: (CGFloat)borderWidth;
{
    UIBezierPath *bezierPath = nil;
    
    if (self.position == RCUITableViewGroupCellPositionTop)
    {
        bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake (rect.origin.x, rect.origin.y)];
        [bezierPath addLineToPoint: CGPointMake (rect.size.width, rect.origin.y)];
    }
    else if (self.position == RCUITableViewGroupCellPositionMiddle)
    {
        bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake (rect.origin.x + self.separatorInset, rect.origin.y)];
        [bezierPath addLineToPoint: CGPointMake (rect.size.width, rect.origin.y)];
    }
    else if (self.position == RCUITableViewGroupCellPositionBottom)
    {
        bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake (rect.origin.x + self.separatorInset, rect.origin.y)];
        [bezierPath addLineToPoint: CGPointMake (rect.size.width, rect.origin.y)];
        [bezierPath moveToPoint: CGPointMake (rect.origin.x, rect.origin.y + rect.size.height)];
        [bezierPath addLineToPoint: CGPointMake (rect.size.width, rect.origin.y + rect.size.height)];
    }
    else if (self.position == RCUITableViewGroupCellPositionSingle)
    {
        bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake (rect.origin.x, rect.origin.y)];
        [bezierPath addLineToPoint: CGPointMake (rect.size.width, rect.origin.y)];
        [bezierPath moveToPoint: CGPointMake (rect.origin.x, rect.origin.y + rect.size.height)];
        [bezierPath addLineToPoint: CGPointMake (rect.size.width, rect.origin.y + rect.size.height)];
    }
    bezierPath.lineWidth = borderWidth;
    [bezierPath closePath];
    
    return bezierPath;
}

- (void) drawRect: (CGRect)rect;
{
    CGContextRef ctx = UIGraphicsGetCurrentContext ();
    
    CGContextSaveGState (ctx);
    
    UIBezierPath *fillBezierPath = [UIBezierPath bezierPathWithRect: rect];
    if (self.fillColor)
    {
        [self.fillColor setFill];
        [fillBezierPath fill];
    }
    
    UIBezierPath *lineBezierPath = [self bezierPathWithBorderRect: rect borderWidth: kDefaultBorderWidth];
    if (self.borderColor)
    {
        [self.borderColor setStroke];
        [lineBezierPath stroke];
    }

    CGContextRestoreGState (ctx);
}

@end


