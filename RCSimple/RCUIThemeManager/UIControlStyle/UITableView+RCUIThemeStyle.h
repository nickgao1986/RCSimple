//
//  UITableView+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UITableView (RCUIThemeStyle)

+ (id) uiTableViewWithThemeStyle: (RCUITableViewThemeStyle *)themeStyle style: (UITableViewStyle)style frame: (CGRect)frame;
+ (id) uiTableViewWithThemeStyle: (RCUITableViewThemeStyle *)themeStyle style: (UITableViewStyle)style;
- (void) uiApplyThemeStyle: (RCUITableViewThemeStyle *)themeStyle;

@end
