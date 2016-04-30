//
//  UIView+RCUIThemeStyle.h
//  RCSimple
//
//  Created by Nick Gao on 4/30/16.
//  Copyright © 2016 nickgao. All rights reserved.
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UIView (RCUIThemeStyle)

+ (id) uiViewWithThemeStyle: (RCUIViewThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiViewWithThemeStyle: (RCUIViewThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUIViewThemeStyle *)themeStyle;

@end
