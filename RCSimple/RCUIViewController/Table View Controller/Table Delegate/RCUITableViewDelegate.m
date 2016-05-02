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

#import "RCUITableViewDelegate.h"
#import "RCUITableViewController.h"
#import "RCUITableViewHeaderView.h"
#import "RCUITableViewDataSource.h"
#import "RCUITableViewItem.h"
#import "UITableView+RCUICategory.h"
//#import "UITableView+SWTableViewCell.h"
#import "RCUIGlobalCommon.h"

static const CGFloat kEmptyHeaderHeight = 0.0f;
static const CGFloat kSectionHeaderHeight = 22.0f;
static const CGFloat kGroupedSectionHeaderHeight = 36.0f;
static const CGFloat kGroupedSectionHeaderHeightForiOS7 = 16.f;
static const CGFloat kGroupedSectionFirstHeaderHeight = kGroupedSectionHeaderHeightForiOS7 + 30.f;
static const NSUInteger kFirstTableSection = 0;

@interface RCUITableViewDelegate ()

@property (nonatomic, assign) RCUITableViewController *viewController;

@end

@implementation RCUITableViewDelegate
@synthesize viewController = _viewController;
@synthesize headers = _headers;

- (id) initWithController: (RCUITableViewController *)viewController;
{
    self = [super init];
    
    if (self != nil)
    {
        self.viewController = viewController;
    }
    
    return self;
}

- (UIView *) tableView: (UITableView *)tableView viewForHeaderInSection: (NSInteger)section;
{
    if (tableView.style != UITableViewStylePlain)
    {
        return nil;
    }
    
    if ([tableView.dataSource respondsToSelector: @selector (tableView:titleForHeaderInSection:)])
    {
        NSString *title = [tableView.dataSource tableView: tableView titleForHeaderInSection: section];
        
        if (title.length > 0)
        {
            RCUITableViewHeaderView *header = [self.headers objectForKey: title];
            
            if (nil != header)
            {
                header.alpha = 1.0f;
            }
            else
            {
                if (nil == self.headers)
                {
                    self.headers = [NSMutableDictionary dictionary];
                }
                
                header = [[[RCUITableViewHeaderView alloc] initWithTitle: title] autorelease];
                [self.headers setObject: header forKey: title];
            }
            
            return header;
        }
    }
    
    return nil;
}

- (CGFloat) tableView: (UITableView *)tableView heightForHeaderInSection: (NSInteger)section;
{
    if ([tableView.dataSource respondsToSelector: @selector (tableView:titleForHeaderInSection:)])
    {
        NSString *title = [tableView.dataSource tableView: tableView titleForHeaderInSection: section];
        
        if (tableView.style == UITableViewStylePlain)
        {
            return ![title length] ? kEmptyHeaderHeight : kSectionHeaderHeight;
        }
        else
        {
            if (section == kFirstTableSection)
            {
                return RCUIIsIOSSDKVersionAbove7 () ? kGroupedSectionHeaderHeightForiOS7 : (![title length] ? kGroupedSectionHeaderHeightForiOS7 : kGroupedSectionFirstHeaderHeight);
            }
            
            return ![title length] ? kEmptyHeaderHeight : kGroupedSectionHeaderHeight;
        }
    }
    
    return kEmptyHeaderHeight;
}

- (BOOL) tableView: (UITableView *)tableView shouldShowMenuForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    id<RCUITableViewDataSource> dataSource = (id<RCUITableViewDataSource>)tableView.dataSource;
    id object = [dataSource tableView: tableView objectForRowAtIndexPath: indexPath];
    
    if ([object isKindOfClass: [RCUITableViewItem class]])
    {
        RCUITableViewItem *tableViewItem = (RCUITableViewItem *)object;
        
        if (tableViewItem.allowCopy)
        {
            [[UIMenuController sharedMenuController] setArrowDirection: UIMenuControllerArrowDefault];
            return YES;
        }
    }
    
    return NO;
}

- (BOOL) tableView: (UITableView *)tableView canPerformAction: (SEL)action forRowAtIndexPath :(NSIndexPath *)indexPath withSender: (id)sender;
{
    id<RCUITableViewDataSource> dataSource = (id<RCUITableViewDataSource>)tableView.dataSource;
    id object = [dataSource tableView: tableView objectForRowAtIndexPath: indexPath];
    
    if ([object isKindOfClass: [RCUITableViewItem class]])
    {
        RCUITableViewItem *tableViewItem = (RCUITableViewItem *)object;
        
        if (tableViewItem.allowCopy)
        {
            return (action == @selector (copy:));
        }
    }
    
    return NO;
}

- (void) tableView: (UITableView *)tableView performAction: (SEL)action forRowAtIndexPath: (NSIndexPath *)indexPath withSender: (id)sender;
{
    id<RCUITableViewDataSource> dataSource = (id<RCUITableViewDataSource>)tableView.dataSource;
    id object = [dataSource tableView: tableView objectForRowAtIndexPath: indexPath];
    [self.viewController didPerformAction: action object: object atIndexPath: indexPath];
}

- (CGFloat) tableView: (UITableView *)tableView heightForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    return [tableView tableCellHeight];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return tableView.isSwipeUtilityShown ? nil : indexPath;
    return indexPath;
}

- (void) tableView: (UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath;
{
    id<RCUITableViewDataSource> dataSource = (id<RCUITableViewDataSource>)tableView.dataSource;
    id object = [dataSource tableView: tableView objectForRowAtIndexPath: indexPath];
    [self.viewController didSelectObject: object atIndexPath: indexPath];
}

- (void) tableView: (UITableView *)tableView didDeselectRowAtIndexPath: (NSIndexPath *)indexPath;
{
    id<RCUITableViewDataSource> dataSource = (id<RCUITableViewDataSource>)tableView.dataSource;
    id object = [dataSource tableView: tableView objectForRowAtIndexPath: indexPath];
    [self.viewController didDeselectObject: object atIndexPath: indexPath];
}

- (void) tableView: (UITableView *)tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *)indexPath;
{
    id<RCUITableViewDataSource> dataSource = (id<RCUITableViewDataSource>)tableView.dataSource;
    id object = [dataSource tableView: tableView objectForRowAtIndexPath: indexPath];
    [self.viewController didSelectAccessory: object atIndexPath: indexPath];
}

- (UITableViewCellEditingStyle) tableView: (UITableView *)tableView editingStyleForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    if (tableView.editing)
    {
        return UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete;
    }
    
    return UITableViewCellEditingStyleDelete;
}

- (BOOL) scrollViewShouldScrollToTop: (UIScrollView *)scrollView;
{
    return YES;
}

- (void) scrollViewDidScrollToTop: (UIScrollView *)scrollView;
{}

- (void) scrollViewDidScroll: (UIScrollView *)scrollView;
{}

- (void) scrollViewWillBeginDragging: (UIScrollView *)scrollView;
{
    [self.viewController didBeginDragging];
}

- (void) scrollViewDidEndDragging: (UIScrollView *)scrollView willDecelerate: (BOOL)decelerate;
{
    [self.viewController didEndDragging];
}

- (void) scrollViewDidEndDecelerating: (UIScrollView *)scrollView;
{}

- (NSString *) tableView: (UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    return @"Delete";
}

- (void) dealloc;
{
    self.viewController = nil;
    self.headers = nil;
    
    [super dealloc];
}

@end
