//
//  UIView+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UIView (RCUIThemeStyle)

+ (id) uiViewWithThemeStyle: (RCUIViewThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiViewWithThemeStyle: (RCUIViewThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUIViewThemeStyle *)themeStyle;

@end
