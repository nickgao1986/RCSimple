// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "RCUITableViewNetworkEnabledDelegate.h"
#import "RCUITableViewHeaderDragRefreshView.h"
#import "RCUITableViewFooterInfiniteScrollView.h"
#import "RCUIModel.h"
#import "RCUITableViewController.h"
#import "RCUIGlobalCommon.h"
#import "RCUIGlobalStyle.h"

/* The number of pixels the table needs to be pulled down by in order to initiate the refresh. */
static const CGFloat kRefreshDeltaY = -65.0f;
/* The height of the refresh header when it is in its "loading" state. */
static const CGFloat kHeaderVisibleHeight = 60.0f;
/* The height of the infinite scroll footer view. */
static const CGFloat kInfiniteScrollFooterHeight = 40.0f;
/* The percentage of table scrolling to trigger infinite scroll agter. */
static const CGFloat kInfiniteScrollThreshold = 0.5f;


@interface RCUITableViewNetworkEnabledDelegate ()

@property (nonatomic, assign) BOOL dragRefreshEnabled;
@property (nonatomic, assign) BOOL infiniteScrollEnabled;

@end


@implementation RCUITableViewNetworkEnabledDelegate
@synthesize headerView = _headerView;
@synthesize footerView = _footerView;
@synthesize dragRefreshEnabled = _dragRefreshEnabled;
@synthesize infiniteScrollEnabled = _infiniteScrollEnabled;

- (id) initWithController: (RCUITableViewController *)controller
          withDragRefresh: (BOOL)enabledDragRefresh
       withInfiniteScroll: (BOOL)enabledInfiniteScroll;
{
    self = [super initWithController: controller];
    
    if (self != nil)
    {
        self.dragRefreshEnabled = enabledDragRefresh;
        self.infiniteScrollEnabled = enabledInfiniteScroll;
        
        _model = [controller.model retain];
        [_model.delegates addObject: self];
        
        if (self.dragRefreshEnabled)
        {
            self.headerView = [[[RCUITableViewHeaderDragRefreshView alloc] initWithFrame:
                                CGRectMake (0, -self.viewController.tableView.bounds.size.height,
                                            self.viewController.tableView.bounds.size.width,
                                            self.viewController.tableView.bounds.size.height)] autorelease];
            self.headerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            self.headerView.backgroundColor = RGBCOLOR (226, 231, 237);
            [self.headerView setStatus: RCUITableHeaderDragRefreshPullToReload];
            [self.viewController.tableView addSubview: self.headerView];
            
            if ([_model respondsToSelector: NSSelectorFromString (@"loadedTime")] && enabledDragRefresh)
            {
                NSDate *date = [_model performSelector: NSSelectorFromString (@"loadedTime")];
                
                if (date != nil)
                {
                    [self.headerView setUpdateDate: date];
                }
            }
        }
        
        if (self.infiniteScrollEnabled)
        {
            self.footerView = [[[RCUITableViewFooterInfiniteScrollView alloc]
                               initWithFrame: CGRectMake (0, 0,
                                                          self.viewController.tableView.bounds.size.width,
                                                          kInfiniteScrollFooterHeight)] autorelease];
            self.footerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            self.viewController.tableView.tableFooterView = self.footerView;
        }
    }
    
    return self;
}

- (void) scrollViewDidScroll: (UIScrollView *)scrollView;
{
    [super scrollViewDidScroll: scrollView];
    
    if (self.dragRefreshEnabled)
    {
        if (scrollView.dragging && !_model.isLoading)
        {
            if (scrollView.contentOffset.y > kRefreshDeltaY && scrollView.contentOffset.y < 0.0f)
            {
                [self.headerView setStatus: RCUITableHeaderDragRefreshPullToReload];
            }
            else if (scrollView.contentOffset.y < kRefreshDeltaY)
            {
                [self.headerView setStatus: RCUITableHeaderDragRefreshReleaseToReload];
            }
        }
        
        if (_model.isLoading)
        {
            if (scrollView.contentOffset.y >= 0)
            {
                self.viewController.tableView.contentInset = UIEdgeInsetsZero;
            }
            else if (scrollView.contentOffset.y < 0)
            {
                self.viewController.tableView.contentInset = UIEdgeInsetsMake (kHeaderVisibleHeight, 0.0f, 0.0f, 0.0f);
            }
        }
    }
    
    if (self.infiniteScrollEnabled && !_model.isLoading)
    {
        CGFloat scrollRatio = scrollView.contentOffset.y / (scrollView.contentSize.height - scrollView.frame.size.height);
        scrollRatio = MAX (MIN (scrollRatio, 1), 0);
        BOOL shouldLoad;
        
        if ([self.viewController respondsToSelector: @selector (shouldLoadAtScrollRatio:)])
        {
            shouldLoad = [(id<RCUITableViewNetworkEnabledTableViewController>)self.viewController shouldLoadAtScrollRatio: scrollRatio];
        }
        else
        {
            shouldLoad = (scrollRatio > kInfiniteScrollThreshold);
        }
        
        if (shouldLoad)
        {
            [_model load: RCUIModelCachePolicyDefault more: YES];
            [(RCUITableViewFooterInfiniteScrollView*)self.viewController.tableView.tableFooterView setLoading: YES];
        }
    }
}

- (void) scrollViewDidEndDragging: (UIScrollView *)scrollView willDecelerate: (BOOL)decelerate;
{
    [super scrollViewDidEndDragging: scrollView willDecelerate: decelerate];
    
    if (self.dragRefreshEnabled)
    {
        if (scrollView.contentOffset.y <= kRefreshDeltaY && !_model.isLoading)
        {
            [[NSNotificationCenter defaultCenter] postNotificationName: @"RCUIDragRefreshTableReload" object: nil];
            [_model load: RCUIModelCachePolicyNetwork more: NO];
        }
    }
}

- (void) modelDidStartLoad: (id<RCUIModel>)model;
{
    if (self.dragRefreshEnabled)
    {
        [self.headerView setStatus: RCUITableHeaderDragRefreshLoading];
        
        [UIView beginAnimations: nil context: NULL];
        [UIView setAnimationDuration: ttkDefaultFastTransitionDuration];
        if (self.viewController.tableView.contentOffset.y < 0)
        {
            self.viewController.tableView.contentInset = UIEdgeInsetsMake (kHeaderVisibleHeight, 0.0f, 0.0f, 0.0f);
        }
        
        [UIView commitAnimations];
    }
}

- (void) modelDidFinishLoad: (id<RCUIModel>)model;
{
    if (self.dragRefreshEnabled)
    {
        [self.headerView setStatus: RCUITableHeaderDragRefreshPullToReload];
        
        [UIView beginAnimations: nil context: NULL];
        [UIView setAnimationDuration: ttkDefaultTransitionDuration];
        self.viewController.tableView.contentInset = UIEdgeInsetsZero;
        
        [UIView commitAnimations];
        
        if ([model respondsToSelector: NSSelectorFromString (@"loadedTime")])
        {
            NSDate* date = [model performSelector: NSSelectorFromString (@"loadedTime")];
            [self.headerView setUpdateDate: date];
        }
        else
        {
            [self.headerView setCurrentDate];
        }
    }
    
    if (self.infiniteScrollEnabled)
    {
        [(RCUITableViewFooterInfiniteScrollView *)self.viewController.tableView.tableFooterView setLoading: NO];
    }
}

- (void) model: (id<RCUIModel>)model didFailLoadWithError: (NSError *)error;
{
    if (self.dragRefreshEnabled)
    {
        [self.headerView setStatus: RCUITableHeaderDragRefreshPullToReload];
        
        [UIView beginAnimations: nil context: NULL];
        [UIView setAnimationDuration: ttkDefaultTransitionDuration];
        self.viewController.tableView.contentInset = UIEdgeInsetsZero;
        
        [UIView commitAnimations];
    }
}

- (void) modelDidCancelLoad: (id<RCUIModel>)model;
{
    if (self.dragRefreshEnabled)
    {
        [self.headerView setStatus: RCUITableHeaderDragRefreshPullToReload];
        
        [UIView beginAnimations: nil context: NULL];
        [UIView setAnimationDuration: ttkDefaultTransitionDuration];
        self.viewController.tableView.contentInset = UIEdgeInsetsZero;
        
        [UIView commitAnimations];
    }
}


- (void) dealloc;
{
    self.viewController.tableView.tableFooterView = nil;
    [_model.delegates removeObject: self];
    [self.headerView removeFromSuperview];
    self.headerView = nil;
    self.footerView = nil;
    [_model release];
    _model = nil;
    
    [super dealloc];
}

@end
