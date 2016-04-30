//
//  UITextField+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUINumberTipTextField.h"
#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UITextField (RCUIThemeStyle)

+ (id) uiTextFieldWithThemeStyle: (RCUITextFieldThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiTextFieldWithThemeStyle: (RCUITextFieldThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUITextFieldThemeStyle *)themeStyle;

@end


@interface RCUINumberTipTextField (RCUIThemeStyle)

+ (id) uiNumberTextFieldWithThemeStyle: (RCUINumberTextFieldThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUINumberTextFieldThemeStyle *)themeStyle;

@end
