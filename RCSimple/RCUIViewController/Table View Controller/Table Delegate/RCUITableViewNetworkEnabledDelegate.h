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

#import "RCUITableViewVarHeightDelegate.h"

@class RCUITableViewHeaderDragRefreshView;
@class RCUITableViewFooterInfiniteScrollView;
@protocol RCUIModel;
@protocol RCUITableViewNetworkEnabledTableViewController;


@interface RCUITableViewNetworkEnabledDelegate : RCUITableViewVarHeightDelegate
{
    id <RCUIModel> _model;
}

@property (nonatomic, retain) RCUITableViewHeaderDragRefreshView  *headerView;
@property (nonatomic, retain) RCUITableViewFooterInfiniteScrollView *footerView;
@property (nonatomic, readonly) BOOL dragRefreshEnabled;
@property (nonatomic, readonly) BOOL infiniteScrollEnabled;

- (id) initWithController: (RCUITableViewController *)controller
          withDragRefresh: (BOOL)enabledDragRefresh
       withInfiniteScroll: (BOOL)enabledInfiniteScroll;

@end




@protocol RCUITableViewNetworkEnabledTableViewController <NSObject>

@optional
- (BOOL) shouldLoadAtScrollRatio: (CGFloat)scrollRatio;

@end
