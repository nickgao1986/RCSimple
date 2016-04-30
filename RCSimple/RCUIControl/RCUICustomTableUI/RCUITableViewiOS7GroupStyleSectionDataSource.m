//
//  RCUITableViewiOS7GroupStyleSectionDataSource.m
//  RCUIKit
//
//  Created by Jackie Karira on 9/23/14.
//
//

#import "RCUITableViewiOS7GroupStyleSectionDataSource.h"
#import <RCUIKit/RCUIiOS7TableViewCellBackgroundView.h>
#import <RCUIKit/RCUITableViewCell.h>
#import <RCBase/RCCasting.h>

@implementation RCUITableViewiOS7GroupStyleSectionDataSource

- (UITableViewCell *) tableView: (UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [super tableView: tableView cellForRowAtIndexPath: indexPath];
    
    if (tableView.style == UITableViewStylePlain)
    {
        return cell;
    }
    
    NSUInteger count;
    if (_sections)
    {
        NSArray *items = [_items objectAtIndex: indexPath.section];
        count = items.count;
    }
    else
    {
        count = _items.count;
    }
    
    RCUITableViewGroupCellPosition position;
    
    if (indexPath.row == 0)
    {
        position = RCUITableViewGroupCellPositionTop;
    }
    else if (RCUIntegerFromIndexPathRow (indexPath.row) == count - 1)
    {
        position = RCUITableViewGroupCellPositionBottom;
    }
    else
    {
        position = RCUITableViewGroupCellPositionMiddle;
    }
    
    if (count == 1)
    {
        position = RCUITableViewGroupCellPositionSingle;
    }
    
    id object = [self tableView: tableView objectForRowAtIndexPath: indexPath];
    Class cls = [self tableView: tableView cellClassForObject: object];
    if (cell.backgroundView && [cell.backgroundView isKindOfClass: [RCUIiOS7TableViewCellBackgroundView class]])
    {
        RCUIiOS7TableViewCellBackgroundView *backgroundView = (RCUIiOS7TableViewCellBackgroundView *)cell.backgroundView;
        backgroundView.position = position;
        backgroundView.separatorInset = [cls tableView: tableView separatorInsetForObject: object];
    }
    
    if (cell.selectedBackgroundView && [cell.selectedBackgroundView isKindOfClass: [RCUIiOS7TableViewCellBackgroundView class]])
    {
        RCUIiOS7TableViewCellBackgroundView *selectedBackgroundView = (RCUIiOS7TableViewCellBackgroundView *)cell.selectedBackgroundView;
        selectedBackgroundView.position = position;
        selectedBackgroundView.separatorInset = [cls tableView: tableView separatorInsetForObject: object];
    }
    
    return cell;
}

@end
