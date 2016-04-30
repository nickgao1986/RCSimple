//
//  UISearchBar+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UISearchBar (RCUIThemeStyle)

+ (id) uiSearchBarWithThemeStyle: (RCUISearchBarThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUISearchBarThemeStyle *)themeStyle;
- (void) uiApplyiOS7ThemeStyle: (RCUISearchBarThemeStyle *)themeStyle;
- (void) uiApplyiOS7CancelThemeStyle: (RCUISearchBarThemeStyle *)themeStyle;

@end
