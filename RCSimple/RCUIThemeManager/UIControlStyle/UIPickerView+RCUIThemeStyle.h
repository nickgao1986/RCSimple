//
//  UIPickerView+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UIPickerView (RCUIThemeStyle)

+ (id) uiPickerViewWithThemeStyle: (RCUIPickerViewThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiPickerViewWithThemeStyle: (RCUIPickerViewThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUIPickerViewThemeStyle *)themeStyle;

@end
