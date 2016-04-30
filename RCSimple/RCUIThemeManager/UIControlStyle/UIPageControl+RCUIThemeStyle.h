//
//  UIPageControl+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 7/18/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import "RCUIPageControl.h"
#import <UIKit/UIKit.h>

@interface UIPageControl (RCUIThemeStyle)

+ (id) uiPageControlWithThemeStyle: (RCUIPageControlThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUIPageControlThemeStyle *)themeStyle;

@end

@interface RCUIPageControl (RCUIThemeStyle)

+ (id) uiPageControlWithThemeStyle: (RCUIPageControlThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUIPageControlThemeStyle *)themeStyle;

@end
