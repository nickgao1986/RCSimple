//
//  UITableViewCell+RCUIIOS7Style.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 1/18/14.
//
//

#import "UITableViewCell+RCUIIOS7Style.h"


static const char *RCUITableViewCellIOS7Style = "RCUITableViewCellIOS7Style";

@implementation UITableViewCell (RCUIIOS7Style)

- (UITableView *) tableView;
{
//    RC_V (tableView, RC_KCAST (UITableView, objc_getAssociatedObject (self, (void *)RCUITableViewCellIOS7Style)));
//	return tableView;
    return nil;
}

- (void) setTableView: (UITableView *)tableView;
{
//    objc_setAssociatedObject (self, (void *)RCUITableViewCellIOS7Style, tableView, OBJC_ASSOCIATION_ASSIGN);
}

@end
