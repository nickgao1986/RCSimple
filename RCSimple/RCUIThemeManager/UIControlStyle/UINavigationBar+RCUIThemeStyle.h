//
//  UINavigationBar+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import "UIImage+RCUIPathCategory.h"
#import <UIKit/UIKit.h>

@interface UINavigationBar (RCUIThemeStyle)

+ (id) uiNavigationBarWithThemeStyle: (RCUINavigationBarThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiNavigationBarWithThemeStyle: (RCUINavigationBarThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUINavigationBarThemeStyle *)themeStyle;

@end
