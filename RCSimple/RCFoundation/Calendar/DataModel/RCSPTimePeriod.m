//
//  RCSPTimePeriod.m
//  RCSPFoundation
//
//  Created by John Wu on 4/20/16.
//
//

#import "RCSPTimePeriod.h"
#import "NSDate+RCCalendarUtil.h"

@implementation RCSPTimePeriod
+ (instancetype) periodForDate: (NSDate *)date;
{
    RCSPTimePeriod *period = [[[RCSPTimePeriod alloc] init] autorelease];
    period.startTime = [date startOfDay];
    period.endTime = [date endOfDay];
    return period;
}

- (void) dealloc;
{
    self.startTime = nil;
    self.endTime = nil;
    [super dealloc];
}

- (NSTimeInterval) timeDuration;
{
    if ([self startTime] && [self endTime])
    {
        return [[self endTime] timeIntervalSinceDate: [self startTime]];
    }
    return 0;
}

- (BOOL) isSameTimePeriod: (RCSPTimePeriod *)timePeriod;
{
    return ([self.startTime timeIntervalSinceDate: timePeriod.startTime] == 0.0 && [self.endTime timeIntervalSinceDate: timePeriod.endTime] == 0.0);
}

- (BOOL) containsDate: (NSDate *)date;
{
    if (date == nil)
    {
        return NO;
    }
    return ([self.startTime timeIntervalSinceDate: date] <= 0 && [self.endTime timeIntervalSinceDate: date] >= 0);
}

- (BOOL) containsTimePeriod: (RCSPTimePeriod *)timePeriod;
{    
    return ([self containsDate: timePeriod.startTime] && [self containsDate: timePeriod.endTime]);
}

- (BOOL) overlapWithTimePeriod: (RCSPTimePeriod *)timePeriod;
{
    return [self overlappedTime: timePeriod] > 0;
}

- (NSTimeInterval) overlappedTime: (RCSPTimePeriod *)timePeriod;
{
    if ([self containsDate: timePeriod.startTime] && ![self containsDate: timePeriod.endTime])
    {
        return [self.endTime timeIntervalSinceDate: timePeriod.startTime];
    }
    else if (![self containsDate: timePeriod.startTime] && [self containsDate: timePeriod.endTime])
    {
        return [timePeriod.endTime timeIntervalSinceDate: self.startTime];
    }
    else
    {
        return 0;
    }
}

- (NSArray <RCSPTimePeriod *> *) removeTimePeriod: (RCSPTimePeriod *)timePeriod;
{
    if ([self isSameTimePeriod: timePeriod])
    {
        return nil;
    }
    else if ([self containsTimePeriod: timePeriod])
    {
        if ([self.startTime timeIntervalSinceDate: timePeriod.startTime] == 0.0 && [self.endTime timeIntervalSinceDate: timePeriod.endTime] > 0.0)
        {
            RCSPTimePeriod *tailPeriod = [[[RCSPTimePeriod alloc] init] autorelease];
            tailPeriod.startTime = timePeriod.endTime;
            tailPeriod.endTime = self.endTime;
            return @[tailPeriod];
        }
        else if ([self.startTime timeIntervalSinceDate: timePeriod.startTime] < 0.0 && [self.endTime timeIntervalSinceDate: timePeriod.endTime] == 0.0)
        {
            RCSPTimePeriod *headPeriod = [[[RCSPTimePeriod alloc] init] autorelease];
            headPeriod.startTime = self.startTime;
            headPeriod.endTime = timePeriod.startTime;
            return @[headPeriod];
        }
        else
        {
            RCSPTimePeriod *headPeriod = [[[RCSPTimePeriod alloc] init] autorelease];
            headPeriod.startTime = self.startTime;
            headPeriod.endTime = timePeriod.startTime;
            RCSPTimePeriod *tailPeriod = [[[RCSPTimePeriod alloc] init] autorelease];
            tailPeriod.startTime = timePeriod.endTime;
            tailPeriod.endTime = self.endTime;
            return @[headPeriod, tailPeriod];
        }
    }
    else if ([self overlapWithTimePeriod: timePeriod])
    {
        if ([self containsDate: timePeriod.startTime])
        {
            RCSPTimePeriod *headPeriod = [[[RCSPTimePeriod alloc] init] autorelease];
            headPeriod.startTime = self.startTime;
            headPeriod.endTime = timePeriod.startTime;
            return @[headPeriod];
        }
        else
        {
            RCSPTimePeriod *tailPeriod = [[[RCSPTimePeriod alloc] init] autorelease];
            tailPeriod.startTime = timePeriod.endTime;
            tailPeriod.endTime = self.endTime;
            return @[tailPeriod];
        }
    }
    else
    {
        return nil;
    }
}

@end
