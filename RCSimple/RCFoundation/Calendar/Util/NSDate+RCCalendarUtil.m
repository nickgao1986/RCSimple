//
//  NSDate+RCCalendarUtil.m
//  RCSPFoundation
//
//  Created by John Wu on 4/14/16.
//
//

#import "NSDate+RCCalendarUtil.h"
#import <Foundation/NSCalendar.h>

#define ONE_DAY_INTERVAL 86400

@implementation NSDate (RCCalendarUtil)

- (NSDate *) startOfDay;
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate: self];
    
    [components setHour: 0];
    [components setMinute: 0];
    [components setSecond: 0];
    
    return [cal dateFromComponents:components];
}

- (NSDate *) endOfDay;
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate: self];
    
    [components setHour: 23];
    [components setMinute: 59];
    [components setSecond: 59];
    
    return [cal dateFromComponents:components];
}

- (BOOL) isMidnight;
{
    return [[self startOfDay] timeIntervalSinceDate: self] == 0.0;
}

- (NSDate *) previousDay;
{
    return [self dateByAddingTimeInterval: -ONE_DAY_INTERVAL];
}

- (NSDate *) nextDay;
{
    return [self dateByAddingTimeInterval: ONE_DAY_INTERVAL];
}

@end
