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

#import "RCUITableViewSectionDataSource.h"
#import "RCUITableViewItem.h"
#import "RCUITableViewSection.h"

@implementation RCUITableViewSectionDataSource
@synthesize items = _items;
@synthesize sections = _sections;

+ (RCUITableViewSectionDataSource *) dataSourceWithObjects: (id)object,...;
{
    NSMutableArray *items = [NSMutableArray array];
	NSMutableArray *sections = [NSMutableArray array];
	NSMutableArray *section = nil;
	
	va_list ap;
	va_start (ap, object);
	
	while (object)
	{
		if ([object isKindOfClass: [NSString class]]
            || [object isKindOfClass: [RCUITableViewSection class]])
		{
			[sections addObject: object];
			section = [NSMutableArray array];
			[items addObject: section];
			
		}
		else
		{
			[section addObject: object];
		}
		
		object = va_arg (ap, id);
	}
	
	va_end (ap);
	
	return [[[self alloc] initWithItems: items sections: sections] autorelease];
}

+ (RCUITableViewSectionDataSource *) dataSourceWithArrays: (id)object,...;
{
    NSMutableArray *items = [NSMutableArray array];
    NSMutableArray *sections = [NSMutableArray array];
    
    va_list ap;
    va_start (ap, object);
    
    while (object)
    {
        if ([object isKindOfClass:[NSString class]] ||
            [object isKindOfClass:[RCUITableViewSection class]])
        {
            [sections addObject: object];
        }
        else
        {
            [items addObject: object];
        }
        object = va_arg (ap, id);
    }
    
    va_end(ap);
    
    return [[[self alloc] initWithItems:items sections:sections] autorelease];
}

+ (RCUITableViewSectionDataSource *) dataSourceWithItems: (NSArray *)items sections: (NSArray *)sections;
{
    return [[[self alloc] initWithItems: items sections: sections] autorelease];
}

- (id) initWithItems: (NSArray *)items sections: (NSArray *)sections;
{
    self = [self init];
    
    if (self != nil)
    {
        _items = [items mutableCopy];
        _sections = [sections mutableCopy];
    }
    
    return self;
}

- (NSInteger) numberOfSectionsInTableView: (UITableView *)tableView;
{
    return self.sections ? self.sections.count : 1;
}

- (NSInteger) tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section;
{
    if (self.sections)
    {
        NSArray *items = [self.items objectAtIndex: section];
        return items.count;
    }
    
    return self.items.count;
}

- (NSString *) tableView: (UITableView *)tableView titleForHeaderInSection: (NSInteger)section;
{
    if (self.sections.count)
    {
        if ([[self.sections objectAtIndex: section] isKindOfClass: [RCUITableViewSection class]])
        {
            RCUITableViewSection *sectionInfo = [self.sections objectAtIndex: section];
            return sectionInfo.headerTitle;
        }
        else
        {
            return [self.sections objectAtIndex: section];
        }
    }
    
    return nil;
}

- (NSString *) tableView: (UITableView *)tableView titleForFooterInSection: (NSInteger)section;
{
    if (tableView.style==UITableViewStyleGrouped
        && self.sections.count
        && [[self.sections objectAtIndex: section] isKindOfClass: [RCUITableViewSection class]])
    {
        RCUITableViewSection *sectionInfo = [self.sections objectAtIndex: section];
        return sectionInfo.footerTitle;
    }
    
    return nil;
}

- (id) tableView: (UITableView *)tableView objectForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    if (self.sections != nil)
    {
        NSArray *section = [self.items objectAtIndex: indexPath.section];
        return [section objectAtIndex: indexPath.row];
    }
    
    return [self.items objectAtIndex: indexPath.row];
}

- (NSIndexPath *) tableView: (UITableView *)tableView indexPathForObject: (id)object;
{
    if (self.sections != nil)
    {
        for (NSUInteger i = 0; i < self.items.count; ++i)
        {
            NSMutableArray *section = [self.items objectAtIndex: i];
            NSUInteger objectIndex = [section indexOfObject: object];
            if (objectIndex != NSNotFound)
            {
                return [NSIndexPath indexPathForRow: objectIndex inSection: i];
            }
        } 
    }
    else
    {
        NSUInteger objectIndex = [self.items indexOfObject: object];
        if (objectIndex != NSNotFound)
        {
            return [NSIndexPath indexPathForRow: objectIndex inSection: 0];
        }
    }
    
    return nil;
}

- (NSIndexPath *) indexPathOfItemWithUserInfo: (id)userInfo;
{
    if (self.sections.count)
    {
        for (NSUInteger i = 0; i < self.items.count; ++i)
        {
            NSArray *items = [self.items objectAtIndex: i];
            for (NSUInteger j = 0; j < items.count; ++j)
            {
                RCUITableViewItem *item = [items objectAtIndex: j];
                if (item.userInfo == userInfo)
                {
                    return [NSIndexPath indexPathForRow: j inSection: i];
                }
            }
        }
    }
    else
    {
        for (NSUInteger i = 0; i < self.items.count; ++i)
        {
            RCUITableViewItem *item = [self.items objectAtIndex: i];
            if (item.userInfo == userInfo)
            {
                return [NSIndexPath indexPathForRow: i inSection: 0];
            }
        }
    }
    
    return nil;
}

- (void) removeItemAtIndexPath: (NSIndexPath *)indexPath;
{
    [self removeItemAtIndexPath: indexPath andSectionIfEmpty: NO];
}

- (BOOL) removeItemAtIndexPath: (NSIndexPath *)indexPath andSectionIfEmpty:(BOOL)andSection;
{
    if (self.sections.count)
    {
        NSMutableArray* items = [self.items objectAtIndex: indexPath.section];
        [items removeObjectAtIndex: indexPath.row];
        
        if (andSection && !items.count)
        {
            [self.sections removeObjectAtIndex: indexPath.section];
            [self.items removeObjectAtIndex: indexPath.section];
            return YES;
        }
    }
    else if (!indexPath.section)
    {
        [self.items removeObjectAtIndex: indexPath.row];
    }
    
    return NO;
}

- (void) dealloc;
{
    self.items = nil;
    self.sections = nil;
    [super dealloc];
}

@end
