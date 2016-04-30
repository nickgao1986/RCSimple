//
//  UISegmentedControl+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UISegmentedControl (RCUIThemeStyle)

+ (id) uiSegmentedControlWithThemeStyle: (RCUISegmentedControlThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiSegmentedControlWithThemeStyle: (RCUISegmentedControlThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUISegmentedControlThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUISegmentedControlThemeStyle *)themeStyle radius: (CGFloat)radius;

@end
