//
//  RCSPEventListItem.h
//  RCSimple
//
//  Created by Nick Gao on 5/1/16.
//  Copyright © 2016 nickgao. All rights reserved.
//

#import "RCUITableViewItem.h"
#import "RCSPEvent.h"
#import "RCSPTimePeriod.h"

@interface RCSPEventListItem : RCUITableViewItem
@property (nonatomic, retain, readonly) RCSPEvent *event;
@property (nonatomic, retain, readonly) RCSPTimePeriod *freeTime;
@property (nonatomic, assign, readonly) BOOL isFreeTime;

+ (instancetype) itemWithEvent: (RCSPEvent *)event;
+ (instancetype) itemWithFreeTime: (RCSPTimePeriod *)freeTime;

- (NSComparisonResult) compareStartDateWithItem: (RCSPEventListItem *)other;

@end
