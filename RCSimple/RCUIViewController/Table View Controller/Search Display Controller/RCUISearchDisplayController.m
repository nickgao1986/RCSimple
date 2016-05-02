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

#import "RCUISearchDisplayController.h"
#import "RCUITableViewController.h"
#import "RCUITableViewDataSource.h"
#import "RCUIOrientationSupportedViewController.h"
#import "RCUIGlobalCommon.h"
#import "RCUIGlobalStyle.h"
#import "UITableView+RCUICategory.h"

//#import <RCFoundation/RCKVOBinding.h>
//#import <RCBase/RCCasting.h>
//#import <RCBase/RCVariableDeclarations.h>
//#import <RCBase/RCNullForNil.h>

static const NSTimeInterval kPauseInterval = 0.4;

@implementation RCUISearchDisplayController
@synthesize searchResultsViewController = _searchResultsViewController;
@synthesize pausesBeforeSearching = _pausesBeforeSearching;

- (id) initWithSearchBar: (UISearchBar *)searchBar contentsController: (UIViewController *)viewController;
{
    self = [super initWithSearchBar: searchBar contentsController: viewController];
    
    if (self != nil)
    {
        self.delegate = self;
        searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        searchBar.clipsToBounds = YES;
        searchBar.translucent = NO;
        [self customSearchBarWhenGenerated: searchBar];
        [self.searchResultsTableView disableMarginsFollowReadableWidth];
    }
    
    return self;
}

- (void) customSearchBarWillAppear: (UISearchBar *)searchBar;
{}

- (void) customSearchBarWhenGenerated: (UISearchBar *)searchBar;
{}

- (void) customTableViewWhenShowResults: (UITableView *)tableView;
{}

- (void) customTableViewWhenNoResults: (UITableView *)tableView;
{}

- (void) resetResults;
{
    if (self.searchResultsViewController.model.isLoading)
    {
        [self.searchResultsViewController.model cancel];
    }
    
    [self.searchResultsViewController.dataSource search: nil];
    [self.searchResultsViewController viewWillDisappear: NO];
    [self.searchResultsViewController viewDidDisappear: NO];
    self.searchResultsViewController.tableView = nil;
}

- (void) restartPauseTimer;
{
    [_pauseTimer invalidate];
    _pauseTimer = nil;
    
    _pauseTimer = [NSTimer scheduledTimerWithTimeInterval: kPauseInterval
                                                   target: self
                                                 selector: @selector (searchAfterPause)
                                                 userInfo: nil
                                                  repeats: NO];
}

- (void) searchAfterPause;
{
    _pauseTimer = nil;
    [self.searchResultsViewController.dataSource search: self.searchBar.text];
}

- (void) searchDisplayControllerWillBeginSearch: (UISearchDisplayController *)controller;
{
    [self customSearchBarWillAppear: self.searchBar];
}

- (void) searchDisplayControllerDidBeginSearch: (UISearchDisplayController *)controller;
{}

- (void) searchDisplayControllerWillEndSearch: (UISearchDisplayController *)controller;
{
    self.searchBar.userInteractionEnabled = NO;
}

- (void) searchDisplayControllerDidEndSearch: (UISearchDisplayController *)controller;
{
    self.searchBar.userInteractionEnabled = YES;
    
    [self resetResults];
    
    if (!RCUIIsIOSSDKVersionAbove7 ())
    {
        return;
    }
    
    if ([self.searchBar superview] != ((RCUITableViewController *)controller.searchContentsController).tableView.tableHeaderView)
    {
        [self.searchBar removeFromSuperview];
        [((RCUITableViewController *)controller.searchContentsController).tableView.tableHeaderView addSubview: self.searchBar];
    }
    
    [((RCUITableViewController *)controller.searchContentsController).tableView reloadData];
}

- (void) searchDisplayController: (UISearchDisplayController *)controller
   didLoadSearchResultsTableView: (UITableView *)tableView;
{}

- (void) searchDisplayController: (UISearchDisplayController *)controller
willUnloadSearchResultsTableView: (UITableView *)tableView ;
{}

- (void) searchDisplayController: (UISearchDisplayController *)controller
  willShowSearchResultsTableView: (UITableView *)tableView;
{}

- (void) searchDisplayController: (UISearchDisplayController *)controller
   didShowSearchResultsTableView: (UITableView *)tableView;
{
    [self customTableViewWhenShowResults: tableView];
    self.searchResultsViewController.tableView = tableView;
    
    [self.searchResultsViewController viewWillAppear: NO];
    [self.searchResultsViewController viewDidAppear: NO];
}

- (void) searchDisplayController: (UISearchDisplayController *)controller
  willHideSearchResultsTableView: (UITableView *)tableView;
{
    [self resetResults];
}

- (void) searchDisplayController: (UISearchDisplayController *)controller
   didHideSearchResultsTableView: (UITableView *)tableView;
{}

- (BOOL) searchDisplayController: (UISearchDisplayController *)controller
shouldReloadTableForSearchString: (NSString *)searchString;
{
    if (self.pausesBeforeSearching)
    {
        [self restartPauseTimer];
    }
    else
    {
        [self.searchResultsViewController.dataSource search: searchString];
    }
    [self customTableViewWhenNoResults: [controller searchResultsTableView]];
    
    return NO;
}

- (BOOL) searchDisplayController: (UISearchDisplayController*)controller
 shouldReloadTableForSearchScope: (NSInteger)searchOption;
{
    [self.searchResultsViewController invalidateModel];
    [self.searchResultsViewController.dataSource search: self.searchBar.text];
    return NO;
}

- (void) setSearchResultsDelegate: (id<UITableViewDelegate>)searchResultsDelegate;
{
    [super setSearchResultsDelegate: searchResultsDelegate];
    
    if (_searchResultsDelegate2 != searchResultsDelegate)
    {
        [_searchResultsDelegate2 release];
        _searchResultsDelegate2 = [searchResultsDelegate retain];
    }
}

- (void) dealloc;
{
    [_pauseTimer invalidate];
    _pauseTimer = nil;
    
    [_searchResultsDelegate2 release];
    _searchResultsDelegate2 = nil;
    
    self.searchResultsViewController    = nil;
    
    [super dealloc];
}

@end
