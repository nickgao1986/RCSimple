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

#import "RCUIModelViewController.h"
#import "RCUITableViewDataSource.h"

@interface RCUITableViewController : RCUIModelViewController
{
    id <UITableViewDelegate> _tableDelegate;
}

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) UIView *tableOverlayView;
@property (nonatomic, retain) UIView *loadingView;
@property (nonatomic, retain) UIView *errorView;
@property (nonatomic, retain) UIView *emptyView;
@property (nonatomic, retain) id<RCUITableViewDataSource> dataSource;
@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@property (nonatomic, assign) BOOL variableHeightRows;
@property (nonatomic, assign) BOOL allowScrollToBottom;

+ (Class) tableViewClass;

- (id) initWithStyle: (UITableViewStyle)style;
- (void) pushSwipeUtilityButtonsState;
- (void) popSwipeUtilityButtonsState;
- (id<UITableViewDelegate>) generatedDelegate;
- (void) didBeginDragging;
- (void) didEndDragging;
- (void) didPerformAction: (SEL)action object: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (void) didSelectObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (void) didDeselectObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (void) didSelectAccessory: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (void) didBeginEditingObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (void) didEndEditingObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (CGRect) rectForOverlayView;

@end
