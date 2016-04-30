//
//  UIImageView+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import "UIImage+RCUIPathCategory.h"
#import <UIKit/UIKit.h>

@interface UIImageView (RCUIThemeStyle)

+ (id) uiImageViewWithThemeStyle: (RCUIImageViewThemeStyle *)themeStyle frame: (CGRect)frame;
+ (id) uiImageViewWithThemeStyle: (RCUIImageViewThemeStyle *)themeStyle;
+ (id) uiImageViewWithThemeStyle: (RCUIImageViewThemeStyle *)themeStyle bannerEdge: (UIEdgeInsets)insets;
- (void) uiApplyThemeStyle: (RCUIImageViewThemeStyle *)themeStyle;
- (void) uiApplyThemeStyle: (RCUIImageViewThemeStyle *)themeStyle bannerEdge: (UIEdgeInsets)insets;
- (void) uiApplyAnimationThemeStyle: (RCUIImageViewThemeStyle *)themeStyle;
- (void) uiApplyArrowInCircleThemeStyle: (RCUIImageViewThemeStyle *)themeStyle direction: (RCUIArrowDirection)direction radius: (CGFloat)radius;
- (void) uiApplyArrowThemeStyle: (RCUIImageViewThemeStyle *)themeStyle direction: (RCUIArrowDirection)direction;
- (void) uiApplyCheckThemeStyle: (RCUIImageViewThemeStyle *)themeStyle;
- (void) uiApplyBezierThemeStyle: (RCUIImageViewThemeStyle *)themeStyle bezierType: (RCUIBezierType)type;

@end
