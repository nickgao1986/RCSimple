//
//  UITabBar+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UITabBar (RCUIThemeStyle)

+ (id) uiTabBarWithThemeStyle: (RCUITabBarThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiTabBarWithThemeStyle: (RCUITabBarThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUITabBarThemeStyle *)themeStyle;

@end
