//
//  RCUIReOrderTableViewDataSource.m
//  RingCentralNewUX
//
//  Created by Kingle.Zhuang on 3/6/15.
//  Copyright (c) 2015 RingCentral. All rights reserved.
//

#import "RCUIReOrderTableViewDataSource.h"
#import "RCUIReOrderTableView.h"
#import <RCUIKit/RCUITableViewCell.h>
#import <RCUIKit/RCUITableViewItem.h>
#import <objc/runtime.h>

@implementation RCUIReOrderTableViewDataSource

- (UITableViewCell *) tableView: (UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath;
{
    id object = [self tableView: tableView objectForRowAtIndexPath: indexPath];
    
    Class cellClass = [self tableView: tableView cellClassForObject: object];
    
    const char *className = class_getName (cellClass);
    
    NSString *identifier = [[NSString alloc] initWithBytesNoCopy: (char *)className
                                                          length: strlen (className)
                                                        encoding: NSASCIIStringEncoding
                                                    freeWhenDone: NO];
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier: identifier];
    if (cell == nil)
    {
        cell = [[[cellClass alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: identifier] autorelease];
    }
    [identifier release];
    
    if ([tableView isKindOfClass: [RCUIReOrderTableView class]])
    {
        if ([(RCUIReOrderTableView *)tableView indexPathIsMovingIndexPath: indexPath])
        {
            if ([cell isKindOfClass: [RCUITableViewCell class]])
            {
                [(RCUITableViewCell*)cell prepareForMove];
            }
        }
        else
        {
            if ([(RCUIReOrderTableView *)tableView movingIndexPath] != nil)
            {
                indexPath = [(RCUIReOrderTableView *)tableView adaptedIndexPathForRowAtIndexPath: indexPath];
            }
            
            [self tableView: tableView cell: cell willAppearAtIndexPath: indexPath];
            
            if ([cell isKindOfClass: [RCUITableViewCell class]])
            {
                [(RCUITableViewCell*)cell setTableView: tableView];
                [(RCUITableViewCell*)cell setObject: object];
            }
        }
    }
    else
    {
        [self tableView: tableView cell: cell willAppearAtIndexPath: indexPath];
        
        if ([cell isKindOfClass: [RCUITableViewCell class]])
        {
            [(RCUITableViewCell*)cell setTableView: tableView];
            [(RCUITableViewCell*)cell setObject: object];
        }
    }
    
    return cell;
}

@end
