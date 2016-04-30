//
//  UIStepper+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UIStepper (RCUIThemeStyle)

+ (id) uiStepperWithThemeStyle: (RCUIStepperThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiStepperWithThemeStyle: (RCUIStepperThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUIStepperThemeStyle *)themeStyle;

@end
