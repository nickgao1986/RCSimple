//
//  UIProgressView+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UIProgressView (RCUIThemeStyle)

+ (id) uiProgressViewWithThemeStyle: (RCUIProgressViewThemeStyle *)themeStyle style: (UIProgressViewStyle)style;
- (void) uiApplyThemeStyle: (RCUIProgressViewThemeStyle *)themeStyle;

@end
