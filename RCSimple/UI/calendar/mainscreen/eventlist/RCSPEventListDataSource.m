//
//  RCSPEventListDataSource.m
//  RCSimple
//
//  Created by Nick Gao on 5/1/16.
//  Copyright © 2016 nickgao. All rights reserved.
//

#import "RCSPEventListDataSource.h"
#import "RCSPEventListItem.h"
#import "RCSPEventListTableViewCell.h"
#import "RCSPCalendarManager.h"
#import "RCUIModelDelegate.h"
#import "RCUIGlobalCommon.h"
#import "NSArray+RCUICategory.h"
#import "RCSPTimePeriod.h"

#define NUM 20
#define MIN_FREETIME        900 //15 * 60

@interface RCSPEventListDataSource ()
@property (nonatomic, retain) NSArray <RCSPEventListItem *> *eventListItems;
@property (nonatomic, assign) BOOL loading;
@end

@implementation RCSPEventListDataSource
- (instancetype) init;
{
    if (self = [super init])
    {
        [self setDataLoading: YES];
    }
    return self;
}

- (void) generateTestItems;
{
    NSMutableArray <RCSPEventListItem *> *array = [NSMutableArray array];
    for (NSInteger index = 0; index < 20; index++)
    {
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow: -(index + 1) * 60 * 60];
        if (index % 5 == 4)
        {
            RCSPTimePeriod *freeTime = [[[RCSPTimePeriod alloc] init] autorelease];
            freeTime.startTime  = date;
            freeTime.endTime = [date dateByAddingTimeInterval: 60 * 60];
            RCSPEventListItem *item = [RCSPEventListItem itemWithFreeTime: freeTime];
            [array addObject: item];
        }
        else
        {
            RCSPEvent *event = [RCSPEvent testEventWithEndDate: date];
            event.iconType = (RCSPEventIconType)(index % 4);
            if (index < 3)
            {
                [event testSetAllDayEvent];
            }
            RCSPEventListItem *item = [RCSPEventListItem itemWithEvent: event];
            [array addObject: item];
        }
    }
    self.eventListItems = array;
}

- (void) fetchAllEventForDate: (NSDate *)date withCompletion: (void (^)())completion;
{
    //    [self setDataLoading: YES];
    //    [self generateTestItems];
    //    [self setDataLoading: NO];
    //    [self didFinishLoad];
    //    if (completion)
    //    {
    //        completion();
    //    }
    
    __block __typeof(self) weakSelf = self;
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        RCSPCalendarManager *calendarManager = [RCSPCalendarManager sharedManager];
        NSArray <RCSPEvent *> *convertedEvents = [calendarManager fetchEventsForDate: date isSorted: YES];
               
      
        
        NSMutableArray *array = [NSMutableArray array];
        for (RCSPEvent *event in convertedEvents)
        {
            RCSPEventListItem *item = [RCSPEventListItem itemWithEvent: event];
            [array addObject: item];
        }
        NSArray <RCSPTimePeriod *> *freeTimeList = [calendarManager calculateFreeTime: convertedEvents forDate: date];
        for (RCSPTimePeriod *freeTime in freeTimeList)
        {
            if ([freeTime timeDuration] >= MIN_FREETIME)
            {
                RCSPEventListItem *item = [RCSPEventListItem itemWithFreeTime: freeTime];
                [array addObject: item];
            }
        }
        [array sortUsingSelector: @selector(compareStartDateWithItem:)];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.eventListItems = array;
            [weakSelf setDataLoading: NO];
            [weakSelf didFinishLoad];
            if (completion)
            {
                completion();
            }
        });
    });
}

- (UIImage *) imageForEmpty;
{
    return [UIImage imageNamed: @"SmileyFace"];
}

- (NSString *) titleForEmpty;
{
    return @"No Scheduled Meetings Today";
}

- (NSInteger) numberOfSectionsInTableView: (UITableView *)tableView;
{
    return 1;
}

- (NSInteger) tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section;
{
    return self.eventListItems.count;
}

- (id) tableView: (UITableView *)tableView objectForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    RCSPEventListItem *item = [self.eventListItems objectAtIndex: indexPath.row];
    return item;
}


- (Class) cellClassInTableView: (UITableView *)tableView forIndex: (NSIndexPath *)indexPath;
{
    RCSPEventListItem *item = [self.eventListItems objectAtIndex: indexPath.row];
    return [item cellClassForItem];
}

- (CGFloat) tableView: (UITableView *)tableView heightForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    RCSPEventListItem *item = [self.eventListItems objectAtIndex: indexPath.row];
    return [[self cellClassInTableView: tableView forIndex: indexPath] tableView: nil rowHeightForObject: item];
}

- (void) tableView: (UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath;
{
    [tableView deselectRowAtIndexPath: indexPath animated: NO];
}

- (void) scrollToCurrentHourEventIfNecessaryForTableView: (UITableView *)tableView;
{
    __block NSUInteger index = NSNotFound;
    [self.eventListItems enumerateObjectsUsingBlock:^(RCSPEventListItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!item.isFreeTime && item.event.isCurentHourEvent)
        {
            index = idx;
            *stop = YES;
        }
    }];
    
    if (index != NSNotFound)
    {
        [tableView scrollToRowAtIndexPath: [NSIndexPath indexPathForRow: index inSection: 0] atScrollPosition: UITableViewScrollPositionTop animated: NO];
    }
    
}

#pragma mark - RCUIModel

- (NSMutableArray *) delegates;
{
    if (!_delegates)
    {
        _delegates = RCUICreateNonRetainArray ();
    }
    
    return _delegates;
}

- (id<RCUIModel>) model;
{
    return self;
}

- (BOOL) isLoaded;
{
    return !!self.eventListItems;
}

- (BOOL) isLoading;
{
    return self.loading;
}

- (BOOL) isLoadingMore;
{
    return NO;
}

- (BOOL) isOutdated;
{
    return NO;
}

- (void) cancel;
{}

- (void) load: (RCUIModelCachePolicy)cachePolicy more: (BOOL)more;
{}

- (void) invalidate: (BOOL)erase;
{}

- (void) didStartLoad;
{
    [_delegates perform: @selector (modelDidStartLoad:) withObject: self];
}

- (void) didFinishLoad;
{
    [_delegates perform: @selector (modelDidFinishLoad:) withObject: self];
}

- (void) didFailLoadWithError: (NSError *)error;
{
    [_delegates perform: @selector (model:didFailLoadWithError:) withObject: self withObject: error];
}

- (void) didCancelLoad;
{
    [_delegates perform: @selector (modelDidCancelLoad:) withObject: self];
}

- (void) setDataLoading: (BOOL)flag;
{
    self.loading = flag;
}

#pragma mark - UIScrollViewDelegate
- (void) scrollViewDidScroll: (UIScrollView *)scrollView
{
//    if (!self.viewController.isEditing && ![self.viewController.searchDisplayController isActive])
//    {
//        CGFloat offsetY = scrollView.contentOffset.y;
//        
//        if (offsetY > 0)
//        {
//            [self.viewController.tableView bringSubviewToFront: self.viewController.refreshTableFooterView];
//            [self.viewController.refreshTableFooterView rcRefreshScrollViewDidScroll: scrollView];
//        }
//        else
//        {
//            [self.viewController.refreshHeaderView refreshScrollViewDidScroll: scrollView];
//        }
//    }
}

- (void) scrollViewDidEndDragging: (UIScrollView *)scrollView willDecelerate: (BOOL)decelerate
{
//    if (!self.viewController.isEditing && ![self.viewController.searchDisplayController isActive])
//    {
//        CGFloat offsetY = scrollView.contentOffset.y;
//        
//        if (offsetY > 0)
//        {
//            [self.viewController.refreshTableFooterView rcRefreshScrollViewDidEndDragging: scrollView];
//        }
//        else
//        {
//            [self.viewController.refreshHeaderView refreshScrollViewDidEndDragging: scrollView];
//        }
//    }
}
- (void) dealloc;
{
    [_delegates release];
    _delegates = nil;
    self.eventListItems = nil;
    [super dealloc];
}
@end
