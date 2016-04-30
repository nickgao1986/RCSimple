//
//  UIBarButtonItem+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UIBarButtonItem (RCUIThemeStyle)

+ (id) uiBarButtonItemWithThemeStyle: (RCUIBarButtonItemThemeStyle *)themeStyle
                          customView: (UIView *)customView;
+ (id) uiBarButtonItemWithThemestyle: (RCUIBarButtonItemThemeStyle *)themeStyle
                               title: (NSString *)title
                               style: (UIBarButtonItemStyle)style
                              target: (id)target
                              action: (SEL)action;
- (void) uiApplyThemeStyle: (RCUIBarButtonItemThemeStyle *)themeStyle;
- (void) uiAppearanceThemeStyle: (RCUIBarButtonItemThemeStyle *)themeStyle UI_APPEARANCE_SELECTOR;

@end
