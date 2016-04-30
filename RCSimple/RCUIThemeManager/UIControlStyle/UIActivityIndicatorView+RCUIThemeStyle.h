//
//  UIActivityIndicatorView+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UIActivityIndicatorView (RCUIThemeStyle)

+ (id) uiActivityIndicatorViewWithThemeStyle: (RCUIActivityIndicatorViewThemeStyle *)themeStyle style: (UIActivityIndicatorViewStyle)style;
- (void) uiApplyThemeStyle: (RCUIActivityIndicatorViewThemeStyle *)themeStyle;

@end
