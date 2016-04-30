//
//  UIButton+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import "UIImage+RCUIPathCategory.h"
#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, RCUIKeypad)
{
    RCUIKeypad_1,
    RCUIKeypad_2,
    RCUIKeypad_3,
    RCUIKeypad_4,
    RCUIKeypad_5,
    RCUIKeypad_6,
    RCUIKeypad_7,
    RCUIKeypad_8,
    RCUIKeypad_9,
    RCUIKeypad_0,
    RCUIKeypad_P,
    RCUIKeypad_S,
    RCUIKeypad_Call
};

@interface UIButton (RCUIThemeStyle)

+ (id) uiButtonWithThemeStyle: (RCUIButtonThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiButtonWithThemeStyle: (RCUIButtonThemeStyle *)themeStyle;
+ (id) uiButtonWithiOS7ThemeStyle: (RCUIButtonThemeStyle *)themeStyle frame: (CGRect)frame radius: (CGFloat)radius;
+ (id) uiButtonWithiOS7ThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;

- (void) uiApplyThemeStyle: (RCUIButtonThemeStyle *)themeStyle;
- (void) uiApplyiOS7ThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
- (void) uiApplyiOS7BorderThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
- (void) uiApplyiOS7TextThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
- (void) uiApplyiOS7ImageThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
- (void) uiApplyPlusInCircleThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
- (void) uiApplyDeleteInCircleThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
- (void) uiApplyArrowInCircleThemeStyle: (RCUIButtonThemeStyle *)themeStyle direction: (RCUIArrowDirection)direction radius: (CGFloat)radius;
- (void) uiApplyBackIndicatorThemeStyle: (RCUIButtonThemeStyle *)themeStyle;
- (void) uiApplyPopupIndicatorThemeStyle: (RCUIButtonThemeStyle *)themeStyle;
- (void) uiApplyiOS7ArrowThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
- (void) uiApplyKeypadNumberThemeStyle: (RCUIButtonThemeStyle *)themeStyle keypad: (RCUIKeypad)key radius: (CGFloat)radius;

@end
