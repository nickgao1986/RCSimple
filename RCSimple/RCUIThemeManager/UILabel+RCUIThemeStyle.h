//
//  UILabel+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UILabel (RCUIThemeStyle)

+ (id) uiLabelWithThemeStyle: (RCUILabelThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiLabelWithThemeStyle: (RCUILabelThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUILabelThemeStyle *)themeStyle;

@end
