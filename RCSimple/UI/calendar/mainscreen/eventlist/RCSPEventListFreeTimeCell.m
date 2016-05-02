//
//  RCSPEventListFreeTimeCell.m
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/20/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCSPEventListFreeTimeCell.h"
#import "RCSPEventListItem.h"
#import "RCSPCalendarComponentFactory.h"
#import "NSDate+RCCalendarUtil.h"
#import "RCSPTimePeriod.h"
#import <UIkit/UIkit.h>

#define LABEL_HEIGHT        27
#define TOP_GAP             4
#define DOT_WIDTH           1

@interface RCSPEventListFreeTimeCell()
@property (nonatomic, assign) UILabel *freeLabel;
@property (nonatomic, retain) UIColor *dotColor;
@property (nonatomic, retain) RCSPTimePeriod *freeTime;
@end

@implementation RCSPEventListFreeTimeCell
- (id) initWithStyle: (UITableViewCellStyle)style reuseIdentifier: (NSString *)reuseIdentifier;
{
    self = [super initWithStyle: UITableViewCellStyleDefault reuseIdentifier: reuseIdentifier];
    
    if (self)
    {
        self.dotColor = [UIColor colorWithRed: 179.f/255.f green: 179.f/255.f blue: 179.f/255.f alpha: 1.0];
        [self initSubViews];
    }
    
    return self;
}

- (void) dealloc;
{
    self.dotColor = nil;
    self.freeTime = nil;
    [super dealloc];
}

+ (CGFloat) tableView: (UITableView *)tableView rowHeightForObject: (id)object;
{
    return (LABEL_HEIGHT +  TOP_GAP * 2);
}

- (void) initSubViews;
{
    [self initLabel];
}

- (void) initLabel;
{
    CGSize size = self.frame.size;
    CGRect frame = CGRectMake(0, TOP_GAP, size.width, LABEL_HEIGHT);
    UILabel *freeLabel = [RCSPCalendarComponentFactory labelForEventFreeTime: frame];    
    [self addSubview: freeLabel];
    self.freeLabel = freeLabel;
}

- (void) updateLabelFrame;
{
    CGSize size = self.frame.size;
    CGRect frame = CGRectMake(0, TOP_GAP, size.width, LABEL_HEIGHT);
    self.freeLabel.frame = frame;
}

- (void) updateLabel: (RCSPTimePeriod *)freeTime;
{
    self.freeTime = freeTime;
    NSString *free = @"Free";
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    //todo this is will not show am/pm if device is set to 24h time format
    formatter.dateFormat = @"hh:mm a";
    NSString *startTime = [freeTime.startTime isMidnight] ? @"midnight" : [formatter stringFromDate: freeTime.startTime];
    NSString *endTime = [formatter stringFromDate: freeTime.endTime];
    NSString *freeString = [NSString stringWithFormat: @"%@: %@ - %@", free, startTime, endTime];
    self.freeLabel.text = freeString;
}

- (void) setObject: (id)object;
{
    if (_object != object)
    {
        [_object release];
        _object = [object retain];
        
        RCSPEventListItem *item = (RCSPEventListItem *)object;
        [self updateLabel: item.freeTime];
    }
}

- (void) layoutSubviews;
{
    [super layoutSubviews];
    [self updateLabelFrame];
}

- (void) drawRect: (CGRect)rect;
{
    [super drawRect: rect];
    CGFloat width = rect.size.width;
    CGFloat lineWidth = DOT_WIDTH;
    CGPoint point1 = CGPointMake(lineWidth, TOP_GAP);
    CGPoint point2 = CGPointMake(width - lineWidth, TOP_GAP);
    CGPoint point3 = CGPointMake(lineWidth, TOP_GAP + LABEL_HEIGHT);
    CGPoint point4 = CGPointMake(width - lineWidth, TOP_GAP + LABEL_HEIGHT);
    [RCSPCalendarComponentFactory drawDottedLineFromStartingPoint: point1 toEndPoint: point2 color: self.dotColor];
    [RCSPCalendarComponentFactory drawDottedLineFromStartingPoint: point3 toEndPoint: point4 color: self.dotColor];    
}
@end
