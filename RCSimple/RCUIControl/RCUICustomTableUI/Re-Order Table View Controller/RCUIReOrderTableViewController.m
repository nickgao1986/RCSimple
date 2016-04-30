//
//  RCUIReOrderTableViewController.m
//  RingCentralNewUX
//
//  Created by Kingle.Zhuang on 3/6/15.
//  Copyright (c) 2015 RingCentral. All rights reserved.
//

#import "RCUIReOrderTableViewController.h"
#import "RCUIReOrderTableView.h"

@implementation RCUIReOrderTableViewController

+ (Class) tableViewClass;
{
    return [RCUIReOrderTableView class];
}

- (void) willRotateToInterfaceOrientation: (UIInterfaceOrientation)toInterfaceOrientation duration: (NSTimeInterval)duration;
{
    [super willRotateToInterfaceOrientation: toInterfaceOrientation duration: duration];
    if ([self.tableView isKindOfClass: [RCUIReOrderTableView class]])
    {
        if (((RCUIReOrderTableView *)self.tableView).movingIndexPath)
        {
            [(RCUIReOrderTableView *)self.tableView cancelIfNeeded];
            [self.tableView reloadData];
        }
    }
}

- (void) cancelIfNeeded;
{
    if ([self.tableView isKindOfClass: [RCUIReOrderTableView class]])
    {
        [(RCUIReOrderTableView *)self.tableView cancelIfNeeded];
        [self.tableView reloadData];
    }
}

@end
