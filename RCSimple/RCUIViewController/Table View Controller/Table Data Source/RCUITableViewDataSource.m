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

#import "RCUITableViewDataSource.h"
#import "RCUITableViewCell.h"
#import "RCUITableViewItem.h"
//#import <RCSPFoundation/RCSPLocalization.h>
//#import <objc/runtime.h>

@implementation RCUITableViewDataSource
@synthesize model = _model;

+ (NSArray *) lettersForSectionsWithSearch: (BOOL)search summary: (BOOL)summary;
{
    NSMutableArray *letters = [NSMutableArray array];
	
	if (search)
	{
		[letters addObject: UITableViewIndexSearch];
	}
	
	for (unichar c = 'A'; c <= 'Z'; ++c)
	{
		[letters addObject: [NSString stringWithFormat: @"%c", c]];
	}
	
	if (summary)
	{
		[letters addObject: @"#"];
	}
	
	return letters;
}

- (NSInteger) tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section;
{
    return 0;
}

- (UITableViewCell *) tableView: (UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    id object = [self tableView: tableView objectForRowAtIndexPath: indexPath];
    
    Class cellClass = [self tableView: tableView cellClassForObject: object];
    
//    const char *className = class_getName (cellClass);
//    
//    NSString *identifier = [[NSString alloc] initWithBytesNoCopy: (char *)className
//                                                          length: strlen (className)
//                                                        encoding: NSASCIIStringEncoding
//                                                    freeWhenDone: NO];
    
    NSString *identifier = @"aaa";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier: identifier];
    if (cell == nil)
    {
        cell = [[[cellClass alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: identifier] autorelease];
    }
    [identifier release];
    
    [self tableView: tableView cell: cell willAppearAtIndexPath: indexPath];
    
    if ([cell isKindOfClass: [RCUITableViewCell class]])
    {
        [(RCUITableViewCell*)cell setTableView: tableView];
        [(RCUITableViewCell*)cell setObject: object];
    }
    
    return cell;
}

- (NSArray *) sectionIndexTitlesForTableView: (UITableView *)tableView;
{
	return nil;
}

- (NSInteger) tableView: (UITableView *)tableView sectionForSectionIndexTitle: (NSString *)title atIndex:(NSInteger)sectionIndex;
{
    if (tableView.tableHeaderView != nil)
    {
        if (sectionIndex == 0)
        {
            [tableView scrollRectToVisible: tableView.tableHeaderView.bounds animated: NO];
            return -1;
        }
    }
    
    NSString *letter = [title substringToIndex: 1];
    NSInteger sectionCount = [tableView numberOfSections];
    for (NSInteger i = 0; i < sectionCount; ++i)
    {
        NSString *section  = [tableView.dataSource tableView: tableView titleForHeaderInSection: i];
        if ([section hasPrefix: letter])
        {
            return i;
        }
        
        if ([letter isEqualToString: @"#"])
		{
			return sectionCount - 1;
		}
		else
		{
			BOOL tapedLetterNotInSections = [letter compare: section] == NSOrderedAscending;
			if (tapedLetterNotInSections)
			{
				return (i > 0 ? i - 1 : i);
			}
		}
    }
    if (sectionIndex >= sectionCount)
    {
        return sectionCount - 1;
        
    }
    
    return sectionIndex;
}

- (id) tableView: (UITableView *)tableView objectForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    return nil;
}

- (Class) tableView: (UITableView *)tableView cellClassForObject: (id)object;
{
    if ([object isKindOfClass: [RCUITableViewItem class]])
    {
        return [object cellClassForItem];
    }
    
    return [RCUITableViewCell class];
}

- (NSString *) tableView: (UITableView *)tableView labelForObject: (id)object;
{
    return [NSString stringWithFormat: @"%@", object];
}

- (NSIndexPath *) tableView: (UITableView *)tableView indexPathForObject: (id)object;
{
    return nil;
}

- (void) tableView: (UITableView *)tableView cell:(UITableViewCell *)cell willAppearAtIndexPath: (NSIndexPath *)indexPath;
{}

- (void) tableViewDidLoadModel: (UITableView *)tableView;
{}

- (void) search: (NSString *)text;
{}

- (NSString *) titleForLoading: (BOOL)reloading;
{
    if (reloading)
    {
        return @"Updating...";
    }
    else
    {
        return @"Loading...";
    }
}

- (UIImage *) imageForEmpty;
{
    return [self imageForError: nil];
}

- (NSString *) titleForEmpty;
{
    return nil;
}

- (NSString *) subtitleForEmpty;
{
    return nil;
}

- (BOOL) reloadButtonForEmpty;
{
    return YES;
}

- (UIImage *) imageForError: (NSError *)error;
{
    return nil;
}

- (NSString *) titleForError: (NSError *)error;
{
    return @"Error";
}

- (NSString *) subtitleForError: (NSError *)error;
{
    return @"Sorry, there was an error.";
}

- (id<RCUIModel>) model;
{
    return _model ? _model : self;
}

- (NSMutableArray *) delegates;
{
    return nil;
}

- (BOOL) isLoaded;
{
    return YES;
}

- (BOOL) isLoading;
{
    return NO;
}

- (BOOL) isLoadingMore;
{
    return NO;
}

- (BOOL) isOutdated;
{
    return NO;
}

- (void) cancel;
{}

- (void) load: (RCUIModelCachePolicy)cachePolicy more: (BOOL)more;
{}

- (void) invalidate: (BOOL)erase;
{}

- (void) dealloc;
{
    [_model release];
    _model = nil;
    [super dealloc];
}

@end


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUITableViewInterstitialDataSource

- (id<RCUIModel>) model;
{
    return self;
}

- (NSMutableArray *) delegates;
{
    return nil;
}

- (BOOL) isLoaded;
{
    return NO;
}

- (BOOL) isLoading;
{
    return YES;
}

- (BOOL) isLoadingMore;
{
    return NO;
}

- (BOOL) isOutdated;
{
    return NO;
}

- (void) cancel;
{}

- (void) load: (RCUIModelCachePolicy)cachePolicy more: (BOOL)more;
{}

- (void) invalidate: (BOOL)erase;
{}

@end






