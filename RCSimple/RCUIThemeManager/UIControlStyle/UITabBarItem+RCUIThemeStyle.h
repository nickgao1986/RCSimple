//
//  UITabBarItem+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UITabBarItem (RCUIThemeStyle)

+ (id) uiTabBarItemWithThemeStyle: (RCUITabBarItemThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUITabBarItemThemeStyle *)themeStyle;

@end
