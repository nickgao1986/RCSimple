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

#import "RCUITableViewListDataSource.h"
#import "RCUITableViewItem.h"

@implementation RCUITableViewListDataSource
@synthesize items = _items;

+ (RCUITableViewListDataSource *) dataSourceWithObjects: (id)object,...;
{
    NSMutableArray *items = [NSMutableArray array];
    va_list ap;
    va_start (ap, object);
    while (object)
    {
        [items addObject: object];
        object = va_arg (ap, id);
    }
    va_end (ap);
    
    return [[[RCUITableViewListDataSource alloc] initWithItems: items] autorelease];
}

+ (RCUITableViewListDataSource *) dataSourceWithItems: (NSMutableArray*)items;
{
    return [[[RCUITableViewListDataSource alloc] initWithItems: items] autorelease];
}

- (id) initWithItems: (NSArray *)items;
{
    self = [self init];
    
    if (self != nil)
    {
        _items = [items mutableCopy];
    }
    
    return self;
}

- (NSInteger) tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section;
{
	return self.items.count;
}

- (id) tableView: (UITableView *)tableView objectForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    if ((NSUInteger)indexPath.row < self.items.count)
    {
        return [self.items objectAtIndex: indexPath.row];
    }
    
    return nil;
}

- (NSIndexPath *) tableView: (UITableView *)tableView indexPathForObject: (id)object;
{
    NSUInteger objectIndex = [self.items indexOfObject: object];
    
    if (objectIndex != NSNotFound)
    {
        return [NSIndexPath indexPathForRow: objectIndex inSection: 0];
    }
    
    return nil;
}

- (NSMutableArray *) items;
{
	if (!_items)
	{
		_items = [[NSMutableArray alloc] init];
	}
	
	return _items;
}

- (NSIndexPath *) indexPathOfItemWithUserInfo: (id)userInfo;
{
    for (NSUInteger i = 0; i < self.items.count; ++i)
	{
		RCUITableViewItem *item = [self.items objectAtIndex: i];
		
		if (item.userInfo == userInfo)
		{
			return [NSIndexPath indexPathForRow: i inSection: 0];
		}
	}
	
	return nil;
}

- (void) dealloc;
{
    self.items = nil;
    [super dealloc];
}

@end
