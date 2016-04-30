//
//  UIPopoverBackgroundView+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UIPopoverBackgroundView (RCUIThemeStyle)

+ (id) uiPopoverBackgroundViewWithThemeStyle: (RCUIPopoverBackgroundViewThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUIPopoverBackgroundViewThemeStyle *)themeStyle;

@end
