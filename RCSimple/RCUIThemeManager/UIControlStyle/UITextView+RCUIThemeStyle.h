//
//  UITextView+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Maxim Kershengolts on 11/03/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UITextView (RCUIThemeStyle)

+ (id) uiTextViewWithThemeStyle: (RCUITextViewThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiTextViewWithThemeStyle: (RCUITextViewThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUITextViewThemeStyle *)themeStyle;

@end
