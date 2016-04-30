//
//  UIBadge+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 4/3/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import "RCUIBadge.h"
#import <UIKit/UIKit.h>

@interface RCUIBadge (RCUIThemeStyle)

+ (id) uiBadgeViewWithThemeStyle: (RCUIBadgeThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUIBadgeThemeStyle *)themeStyle;

@end

