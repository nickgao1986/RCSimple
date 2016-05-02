//
//  RCSPEventListItem.m
//  RCSimple
//
//  Created by Nick Gao on 5/1/16.
//  Copyright © 2016 nickgao. All rights reserved.
//

#import "RCSPEventListItem.h"
#import "RCSPEventListTableViewCell.h"
#import "RCSPEventListFreeTimeCell.h"

@interface RCSPEventListItem()
@property (nonatomic, retain) RCSPEvent *event;
@property (nonatomic, retain) RCSPTimePeriod * freeTime;
@property (nonatomic, assign) BOOL isFreeTime;
@end

@implementation RCSPEventListItem
+ (instancetype) itemWithEvent: (RCSPEvent *)event;
{
    RCSPEventListItem *item = [[[RCSPEventListItem alloc] initWithEvent: event] autorelease];
    return item;
}

+ (instancetype) itemWithFreeTime: (RCSPTimePeriod *)freeTime;
{
    RCSPEventListItem *item = [[[RCSPEventListItem alloc] initWithFreeTime: freeTime] autorelease];
    return item;
}

- (instancetype) initWithEvent: (RCSPEvent *)event;
{
    if (self = [super init])
    {
        self.event = event;
        self.isFreeTime = NO;
        self.freeTime = nil;
    }
    return self;
}

- (instancetype) initWithFreeTime: (RCSPTimePeriod *)freeTime;
{
    if (self = [super init])
    {
        self.event = nil;
        self.isFreeTime = YES;
        self.freeTime = freeTime;
    }
    return self;
}

- (NSDate *) itemStartTime;
{
    if (self.isFreeTime)
    {
        return self.freeTime.startTime;
    }
    else
    {
        return self.event.startTime;
    }
}

- (Class) cellClassForItem;
{
    if (self.isFreeTime)
    {
        return [RCSPEventListFreeTimeCell class];
    }
    else
    {
        return [RCSPEventListTableViewCell class];
    }
}

- (NSComparisonResult) compareStartDateWithItem: (RCSPEventListItem *)other;
{
    return [[self itemStartTime] compare: [other itemStartTime]];
}

- (void) dealloc;
{
    self.event = nil;
    self.freeTime = nil;
    [super dealloc];
}
@end
