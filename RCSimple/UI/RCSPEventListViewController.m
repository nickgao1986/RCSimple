//
//  RCSPEventListViewController.m
//  RCSimple
//
//  Created by Nick Gao on 4/30/16.
//  Copyright © 2016 nickgao. All rights reserved.
//

#import "RCSPEventListViewController.h"
#import "RCSPEventListDataSource.h"
#import "NSDate+RCCalendarUtil.h"
#import "RCUIThemeStyleHeader.h"
#import "RCUIErrorView.h"
#import "RCSPTimePeriod.h"

@interface RCSPEventListViewController()

@property (nonatomic, retain) RCSPEventListDataSource *listDataSource;
@property (nonatomic, retain) NSDate *currentDate;
@property (nonatomic, assign) UIView *smaileyFaceView;
@property (nonatomic, assign) BOOL shouldScroll;

@end

@implementation RCSPEventListViewController


- (id) initWithNibName: (NSString *)nibNameOrNil bundle: (NSBundle *)nibBundleOrNil;
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    
    if (self)
    {
        self.title = @"Join Now";
        self.flurryText = @"Join Now";
        [self setUpTableView];
    }
    
    return self;
}


- (void) loadView;
{
    [super loadView];
}


- (void) viewDidLoad;
{
    [super viewDidLoad];
//    [self createTableViewContentKVOBinding];
//    [self createTableViewFrameKVOBinding];
}


- (void) setUpTableView;
{
  //  self.refreshHeaderViewType = NormalHeadView;
    self.tableViewStyle = UITableViewStylePlain;
    self.tableView.separatorStyle   = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor   = [UIColor clearColor];
    self.tableView.allowsSelection  = NO;
    RCSPEventListDataSource *dataSource = [[[RCSPEventListDataSource alloc] init] autorelease];
    dataSource.viewController = self;
    self.dataSource  = dataSource;
    self.tableView.delegate = dataSource;
    self.listDataSource = dataSource;
    [self.tableView uiApplyThemeStyle: [RCUI_THEME_STYLE () tableViewThemeWithStyleName: RCCommonTableViewDefault]];
//    [self createRefreshFooterView];
//    [self createRefreshHeaderViewWithType: self.refreshHeaderViewType];
}




- (void) viewWillAppear: (BOOL)animated;
{
    [super viewWillAppear: animated];
    [self refreshEventsForCurrentDate];
}


- (void) viewDidAppear: (BOOL)animated;
{
    [super viewDidAppear: animated];
    if (self.shouldScroll)
    {
        self.shouldScroll = NO;
        [self.listDataSource scrollToCurrentHourEventIfNecessaryForTableView: self.tableView];
    }
}


- (void) refreshEventsForDate: (NSDate *)date withCompletion: (void (^)())completion;
{
    self.currentDate = date != nil ? date : [NSDate date];
    self.shouldScroll = YES;
    __block __typeof(self) weakSelf = self;
    [self.listDataSource fetchAllEventForDate: self.currentDate withCompletion:^{
//        [weakSelf createRefreshFooterView];
//        [weakSelf createRefreshHeaderViewWithType: weakSelf.refreshHeaderViewType];
        if (completion)
        {
            completion();
        }
    }];
}


- (void) refreshEventsForCurrentDate;
{
    [self refreshEventsForDate: self.currentDate withCompletion: nil];
}

- (void) refreshEventsForNextDate;
{
    NSDate *nextDay = [self.currentDate previousDay];
    [self refreshEventsForDate: nextDay withCompletion: nil];
}

- (void) refreshEventsForPreviousDate;
{
    NSDate *previousDay = [self.currentDate previousDay];
    [self refreshEventsForDate: previousDay withCompletion: nil];
}


#pragma mark - RCUIModelViewController
- (void) showEmpty: (BOOL)show;
{
    if (show)
    {
        NSString *title = [self.dataSource titleForEmpty];
        NSString *subtitle = [self.dataSource subtitleForEmpty];
        UIImage *image = [self.dataSource imageForEmpty];
        
        if (title.length || subtitle.length || image)
        {
            RCUIErrorView *emptyView = [[[RCUIErrorView alloc] initWithTitle: title subtitle: subtitle image: image] autorelease];
            CGSize size = self.tableView.frame.size;
            emptyView.frame = CGRectMake(0, 0, size.width, size.height);
            emptyView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            emptyView.backgroundColor = self.tableView.backgroundColor;
            [self.tableView addSubview: emptyView];
            [self.tableView bringSubviewToFront: emptyView];
            self.smaileyFaceView = emptyView;
            
        }
        else
        {
            [self.smaileyFaceView removeFromSuperview];
            self.smaileyFaceView = nil;
        }
        self.tableView.dataSource = nil;
        [self.tableView reloadData];
    }
    else
    {
        [self.smaileyFaceView removeFromSuperview];
        self.smaileyFaceView = nil;
    }
}

@end
