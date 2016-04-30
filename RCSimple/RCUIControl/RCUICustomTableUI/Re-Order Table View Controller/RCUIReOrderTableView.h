//
//  RCUIReOrderTableView.h
//  RingCentralNewUX
//
//  Created by Kingle.Zhuang on 3/6/15.
//  Copyright (c) 2015 RingCentral. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface RCUIReOrderTableView : UITableView <UIGestureRecognizerDelegate>

@property (nonatomic, retain) NSIndexPath *movingIndexPath;
@property (nonatomic, retain) NSIndexPath *initialIndexPathForMovingRow;

- (BOOL) indexPathIsMovingIndexPath: (NSIndexPath *)indexPath;
- (NSIndexPath *) adaptedIndexPathForRowAtIndexPath: (NSIndexPath *)indexPath;
- (void) cancelIfNeeded;

@end
