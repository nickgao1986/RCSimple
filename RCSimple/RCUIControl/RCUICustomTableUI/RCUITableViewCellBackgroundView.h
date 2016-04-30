//
//  RCUITableViewCellBackgroundView.h
//  RCUIKit
//
//  Created by Kingle Zhuang on 4/5/12.
//  Copyright 2012 RingCentral, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, RCUITableViewGroupCellPosition)
{
    RCUITableViewGroupCellPositionTop,
    RCUITableViewGroupCellPositionMiddle,
    RCUITableViewGroupCellPositionBottom,
    RCUITableViewGroupCellPositionSingle,
    RCUITableViewGroupCellPositionNone
};

@interface RCUITableViewCellBackgroundView : UIView

@property(nonatomic, retain) UIColor *borderColor;
@property(nonatomic, retain) UIColor *fillColor;
@property(nonatomic, assign) RCUITableViewGroupCellPosition position;

@end

