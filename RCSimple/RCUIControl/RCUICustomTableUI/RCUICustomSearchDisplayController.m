//
//  RCUICustomSearchDisplayController.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/15/13.
//  Copyright (c) 2013 RingCentral, Inc. All rights reserved.
//

#import "RCUICustomSearchDisplayController.h"
#import "RCApplicationDelegate.h"
#import <RCUIKit/RCUIThemeStyleHeader.h>

@implementation RCUICustomSearchDisplayController

- (void) customSearchBarWillAppear: (UISearchBar *)searchBar;
{
    [searchBar setShowsCancelButton: YES animated: YES];
    [searchBar uiApplyiOS7CancelThemeStyle: [RCUI_THEME_STYLE () searchBarThemeWithStyleName: RCCommonSearchBarDefault]];
}

- (void) customSearchBarWhenGenerated: (UISearchBar *)searchBar;
{
    [searchBar uiApplyiOS7ThemeStyle: [RCUI_THEME_STYLE () searchBarThemeWithStyleName: RCCommonSearchBarDefault]];
}

- (void) customTableViewWhenNoResults: (UITableView *)tableView;
{
    for (UIView *v in tableView.subviews)
    {
        if ([v isKindOfClass: [UILabel class]] && [[(UILabel*)v text] isEqualToString: @"No Results"])
        {
            [((UILabel *)v) uiApplyThemeStyle: [RCUI_THEME_STYLE () labelThemeWithStyleName: RCTableViewLabelEmpty]];
            break;
        }
    }
}

- (void) searchDisplayControllerWillBeginSearch: (UISearchDisplayController *)controller;
{
    [self customSearchBarWillAppear: self.searchBar];
    
    if (controller.searchContentsController.navigationController)
    {
        [[RCApplicationDelegate sharedApplicationDelegate] setStatusBarLightContentStyle: NO];
    }
}

- (void) searchDisplayControllerWillEndSearch: (UISearchDisplayController *)controller;
{
    self.searchBar.userInteractionEnabled = NO;
    
    if (controller.searchContentsController.navigationController)
    {
        [[RCApplicationDelegate sharedApplicationDelegate] setStatusBarLightContentStyle: YES];
    }
}

@end
