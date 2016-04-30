//
//  UIToolbar+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import "UIImage+RCUIPathCategory.h"
#import <UIKit/UIKit.h>

@interface UIToolbar (RCUIThemeStyle)

+ (id) uiToolbarWithThemeStyle: (RCUIToolBarThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiToolbarWithThemeStyle: (RCUIToolBarThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUIToolBarThemeStyle *)themeStyle;

@end
