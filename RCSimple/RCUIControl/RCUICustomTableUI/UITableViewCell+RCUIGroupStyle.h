//
//  UITableViewCell+RCUIGroupStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 1/23/14.
//
//

#import <RCUIKit/RCUITableViewCellBackgroundView.h>

@interface UITableViewCell (RCUIGroupStyle)

- (void) styleFillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor position: (RCUITableViewGroupCellPosition)position;
- (void) selectedStyleFillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor position: (RCUITableViewGroupCellPosition)position;

- (void) defaultBackgroundStyle: (RCUITableViewGroupCellPosition)position;
- (void) defaultSelectedBackgroundStyle: (RCUITableViewGroupCellPosition)position;

@end

