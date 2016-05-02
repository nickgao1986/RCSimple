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

#import "RCUITableViewDragRefreshDelegate.h"
#import "RCUITableViewHeaderDragRefreshView.h"
#import "RCUIModel.h"
#import "RCUITableViewController.h"
#import "RCUIGlobalCommon.h"
#import "RCUIGlobalStyle.h"

/* The number of pixels the table needs to be pulled down by in order to initiate the refresh. */
static const CGFloat kRefreshDeltaY = -65.0f;
/* The height of the refresh header when it is in its "loading" state. */
static const CGFloat kHeaderVisibleHeight = 60.0f;


@implementation RCUITableViewDragRefreshDelegate
@synthesize headerView = _headerView;
- (id) initWithController: (RCUITableViewController *)controller;
{
    self = [super initWithController: controller];
    
    if (self != nil)
    {
        self.headerView = [[[RCUITableViewHeaderDragRefreshView alloc] initWithFrame:
                               CGRectMake (0, -self.viewController.tableView.bounds.size.height,
                                           self.viewController.tableView.bounds.size.width,
                                           self.viewController.tableView.bounds.size.height)] autorelease];
        self.headerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.headerView.backgroundColor = RGBCOLOR (226, 231, 237);
        [self.headerView setStatus: RCUITableHeaderDragRefreshPullToReload];
        [self.viewController.tableView addSubview: self.headerView];
        
        _model = [controller.model retain];
        [_model.delegates addObject: self];
        
        
        if ([_model respondsToSelector: NSSelectorFromString (@"loadedTime")])
        {
            NSDate *date = [_model performSelector: NSSelectorFromString (@"loadedTime")];
            
            if (date != nil)
            {
                [self.headerView setUpdateDate: date];
            }
        }
    }
    
    return self;
}

- (void) scrollViewDidScroll: (UIScrollView *)scrollView;
{
    [super scrollViewDidScroll: scrollView];
    
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

- (void) scrollViewDidEndDragging: (UIScrollView *)scrollView willDecelerate: (BOOL)decelerate;
{
    [super scrollViewDidEndDragging: scrollView willDecelerate: decelerate];
    
    if (scrollView.contentOffset.y <= kRefreshDeltaY && !_model.isLoading)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName: @"RCUIDragRefreshTableReload" object: nil];
        [_model load: RCUIModelCachePolicyNetwork more: NO];
    }
}

- (void) modelDidStartLoad: (id<RCUIModel>)model;
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

- (void) modelDidFinishLoad: (id<RCUIModel>)model;
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

- (void) model: (id<RCUIModel>)model didFailLoadWithError: (NSError *)error;
{
    [self.headerView setStatus: RCUITableHeaderDragRefreshPullToReload];
    
    [UIView beginAnimations: nil context: NULL];
    [UIView setAnimationDuration: ttkDefaultTransitionDuration];
    self.viewController.tableView.contentInset = UIEdgeInsetsZero;
    
    [UIView commitAnimations];
}

- (void) modelDidCancelLoad: (id<RCUIModel>)model;
{
    [self.headerView setStatus: RCUITableHeaderDragRefreshPullToReload];
    
    [UIView beginAnimations: nil context: NULL];
    [UIView setAnimationDuration: ttkDefaultTransitionDuration];
    self.viewController.tableView.contentInset = UIEdgeInsetsZero;
    
    [UIView commitAnimations];
}

- (void) dealloc;
{
    [_model.delegates removeObject: self];
    [self.headerView removeFromSuperview];
    self.headerView = nil;
    [_model release];
    _model = nil;
    [super dealloc];
}

@end
