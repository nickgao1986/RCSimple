//
//  UIWebView+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UIWebView (RCUIThemeStyle)

+ (id) uiWebViewWithThemeStyle: (RCUIWebViewThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiWebViewWithThemeStyle: (RCUIWebViewThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUIWebViewThemeStyle *)themeStyle;

@end
