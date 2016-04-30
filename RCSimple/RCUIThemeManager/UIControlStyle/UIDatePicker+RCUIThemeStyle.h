//
//  UIDatePicker+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UIDatePicker (RCUIThemeStyle)

+ (id) uiDatePickerWithThemeStyle: (RCUIDatePickerThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiDatePickerWithThemeStyle: (RCUIDatePickerThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUIDatePickerThemeStyle *)themeStyle;

@end
