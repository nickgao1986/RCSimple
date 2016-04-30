//
//  RCUITableViewiOS6GroupStyleSectionDataSource.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 4/9/14.
//
//

#import "RCUITableViewiOS6GroupStyleSectionDataSource.h"
#import <RCUIKit/RCUITableViewCellBackgroundView.h>
#import <RCBase/RCCasting.h>

@implementation RCUITableViewiOS6GroupStyleSectionDataSource

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
	
	if (cell.backgroundView && [cell.backgroundView isKindOfClass: [RCUITableViewCellBackgroundView class]])
	{
		RCUITableViewCellBackgroundView *backgroundView = (RCUITableViewCellBackgroundView *)cell.backgroundView;
		backgroundView.position = position;
	}
	
	if (cell.selectedBackgroundView && [cell.selectedBackgroundView isKindOfClass: [RCUITableViewCellBackgroundView class]])
	{
		RCUITableViewCellBackgroundView *selectedBackgroundView = (RCUITableViewCellBackgroundView *)cell.selectedBackgroundView;
		selectedBackgroundView.position = position;
	}
	
	return cell;
}

@end
