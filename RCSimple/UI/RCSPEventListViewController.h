//
//  RCSPEventListViewController.h
//  RCSimple
//
//  Created by Nick Gao on 4/30/16.
//  Copyright © 2016 nickgao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCUITableViewController.h"


@class RCSPEventListViewController;
@protocol RCSPEventListViewControllerRefreshDelegate <NSObject>
- (void) onStartPullingDataForNextDate: (RCSPEventListViewController *)controller withCompletion: (void (^)())completion;
- (void) onStartPullingDataForPreviousDate: (RCSPEventListViewController *)controller withCompletion: (void (^)())completion;
@end

@interface RCSPEventListViewController : RCUITableViewController


@property (nonatomic, retain, readonly) NSDate *currentDate;
@property (nonatomic, assign) id <RCSPEventListViewControllerRefreshDelegate> refreshDelegate;

- (void) refreshEventsForNextDate;
- (void) refreshEventsForPreviousDate;
- (void) refreshEventsForCurrentDate;
- (void) refreshEventsForDate: (NSDate *)date withCompletion: (void (^)())completion;

@end
