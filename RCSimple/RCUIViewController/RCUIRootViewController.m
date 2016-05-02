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

#import "RCUIRootViewController.h"
#import "RCUITableViewController.h"
#import "RCUISearchDisplayController.h"
#import "RCUISearchBar.h"

@interface RCUIRootViewController ()

@property (nonatomic, retain) RCUISearchDisplayController *searchController;

@end

@implementation RCUIRootViewController
@synthesize searchController = _searchController;
@synthesize searchViewController = _searchViewController;

- (id) initWithNibName: (NSString *)nibNameOrNil bundle: (NSBundle *)nibBundleOrNil;
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    
    if (self != nil)
    {}
    
    return self;
}

- (id) init;
{
    self = [self initWithNibName: nil bundle: nil];
    
    if (self != nil)
    {}
    
    return self;
}

- (void) viewDidLoad;
{
    [super viewDidLoad];
}

- (void) didReceiveMemoryWarning;
{
    [super didReceiveMemoryWarning];
}

- (RCUITableViewController *) searchViewController;
{
    return self.searchController.searchResultsViewController;
}

- (void) setSearchViewController: (RCUITableViewController *)searchViewController;
{
    if (searchViewController != nil)
    {
        if (self.searchController == nil)
        {
            UISearchBar *searchBar = [[[RCUISearchBar alloc] init] autorelease];
            [searchBar sizeToFit];
            self.searchController = [self generatedSearchDisplayController: searchBar];
        }
        searchViewController.superViewController = self;
        self.searchController.searchResultsViewController = searchViewController;
    }
    else
    {
        self.searchController.searchResultsViewController = nil;
        self.searchController = nil;
    }
}

- (RCUISearchDisplayController *) generatedSearchDisplayController: (RCUISearchBar *)searchBar;
{
    return [[[RCUISearchDisplayController alloc] initWithSearchBar: searchBar contentsController: self] autorelease];
}

- (void) dealloc;
{
    self.searchViewController = nil;
    
    [super dealloc];
}

@end
