//
//  RCSPEventListDataSource.h
//  RCSimple
//
//  Created by Nick Gao on 5/1/16.
//  Copyright © 2016 nickgao. All rights reserved.
//

#import "RCUITableViewDataSource.h"
#import "RCSPEventListViewController.h"

@interface RCSPEventListDataSource : RCUITableViewDataSource<UITableViewDelegate, RCUIModel>{
    NSMutableArray *_delegates;
}


@property (nonatomic, assign) RCSPEventListViewController *viewController;

- (void) didStartLoad;
- (void) didFinishLoad;
- (void) didFailLoadWithError: (NSError *)error;
- (void) didCancelLoad;
- (void) setDataLoading: (BOOL)flag;

- (void) fetchAllEventForDate: (NSDate *)date withCompletion: (void (^)())completion;
- (void) scrollToCurrentHourEventIfNecessaryForTableView: (UITableView *)tableView;

@end
