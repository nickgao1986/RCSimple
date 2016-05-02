//
//  RCSPCalendarSelectedDateView.m
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/15/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCSPCalendarSelectedDateView.h"
#import "RCSPCalendarComponentFactory.h"

@interface RCSPCalendarSelectedDateView()
@property (nonatomic, assign) UILabel *titleLabel;
@property (nonatomic, retain) NSDate *currentDate;
@end

@implementation RCSPCalendarSelectedDateView

- (instancetype) initWithFrame: (CGRect)frame;
{
    if (self = [super initWithFrame: frame])
    {
        [self initSubViews];
    }
    return self;
}

- (void) dealloc;
{
    self.currentDate = nil;
    [super dealloc];
}

- (void) initSubViews;
{
    [self initLabel];
    [self initLine];
}

- (void) initLabel;
{
    UILabel *label = [RCSPCalendarComponentFactory labelForCalendarDateTitle: self.frame];
    [self addSubview: label];
    self.titleLabel = label;
}

- (void) initLine;
{
    UIView *line = [RCSPCalendarComponentFactory horizontalLine: self.frame.size.width];
    CGRect frame = line.frame;
    frame.origin.y = self.frame.size.height - frame.size.height;
    line.frame = frame;
    [line setAutoresizingMask: UIViewAutoresizingFlexibleWidth];
    [self addSubview: line];
}

- (void) updateCurrentDate: (NSDate *)date;
{
    self.currentDate = date;
    self.titleLabel.text = [self formateDate: date];
}

- (NSString *) formateDate: (NSDate *)date;
{
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    //todo check the format
    //Today's date will be displayed on the top of the screen (Note: use the time format of the device, long type)
    //kCFDateFormatterLongStyle : January 12, 1952
    //kCFDateFormatterFullStyle : Tuesday, April 12, 1952
    //[formatter setDateFormat:@"EEEE, MMMM dd"];
    formatter.dateStyle = kCFDateFormatterFullStyle;
    formatter.timeStyle = kCFDateFormatterNoStyle;
    return [formatter stringFromDate: date];
}
@end
