//
//  UISwitch+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import "RCUISwitch.h"
#import <UIKit/UIKit.h>

@interface UISwitch (RCUIThemeStyle)

+ (id) uiSwitchWithThemeStyle: (RCUISwitchThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiSwitchWithThemeStyle: (RCUISwitchThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUISwitchThemeStyle *)themeStyle;

@end


@interface RCUISwitch (RCUIThemeStyle)

+ (id) uiSwitchWithThemeStyle: (RCUISwitchThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiSwitchWithThemeStyle: (RCUISwitchThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUISwitchThemeStyle *)themeStyle;

@end
