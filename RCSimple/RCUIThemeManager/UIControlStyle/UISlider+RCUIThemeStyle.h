//
//  UISlider+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UISlider (RCUIThemeStyle)

+ (id) uiSliderWithThemeStyle: (RCUISliderThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiSliderWithThemeStyle: (RCUISliderThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUISliderThemeStyle *)themeStyle;

@end
