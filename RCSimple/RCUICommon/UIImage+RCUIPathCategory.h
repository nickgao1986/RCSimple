//
//  UIImage+RCUIPathCategory.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/11/14.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, RCUIArrowDirection)
{
    RCUIArrowDirectionLeft,
    RCUIArrowDirectionRight,
    RCUIArrowDirectionUp,
    RCUIArrowDirectionDown,
};

typedef NS_ENUM (NSInteger, RCUIBezierType)
{
    RCUIBezierTypeNone,
    RCUIBezierTypeLeft,
    RCUIBezierTypeRight,
    RCUIBezierTypeTop,
    RCUIBezierTypeBottom,
    RCUIBezierTypeTopLeft,
    RCUIBezierTypeBottomLeft,
    RCUIBezierTypeTopRight,
    RCUIBezierTypeBottomRight,
    RCUIBezierTypeAll,
};

@interface UIImage (RCUIPathCategory)

+ (UIImage *) uiLineImageWithColor: (UIColor *)color;
+ (UIImage *) uiImageWithColor: (UIColor *)color;
+ (UIImage *) uiEmptyImageWithSize: (CGSize)size;
+ (UIImage *) uiImageWithColors: (NSArray *)colors rect: (CGRect)rect;
+ (UIImage *) uiCircleImageWithImage: (UIImage *)image withCornerRadius: (CGFloat)raduis;

+ (UIImage *) uiImageWithBackIndicatorColor: (UIColor *)color lineWidth: (CGFloat)lineWidth;
+ (UIImage *) uiImageWithMenuIndicatorColor: (UIColor *)color lineWidth: (CGFloat)lineWidth;
+ (UIImage *) uiImageWithPopoverIndicatorColor: (UIColor *)color lineWidth: (CGFloat)lineWidth;
+ (UIImage *) uiImageWithCheckColor: (UIColor *)color lineWidth: (CGFloat)lineWidth;
+ (UIImage *) uiImageWithCloseColor: (UIColor *)color lineWidth: (CGFloat)lineWidth;
+ (UIImage *) uiImageWithEllipsesColor: (UIColor *)color;

+ (UIImage *) uiImageWithArrowColor: (UIColor *)color direction: (RCUIArrowDirection)direction lineWidth: (CGFloat)lineWidth size: (CGSize)size;
+ (UIImage *) uiImageWithArrowColor: (UIColor *)color direction: (RCUIArrowDirection)direction lineWidth: (CGFloat)lineWidth;
+ (UIImage *) uiImageWithArrowColor: (UIColor *)color direction: (RCUIArrowDirection)direction;

+ (UIImage *) uiImageWithAccessoryRadius: (CGFloat)radius direction: (RCUIArrowDirection)direction fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
+ (UIImage *) uiImageWithAccessoryRadius: (CGFloat)radius direction: (RCUIArrowDirection)direction fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithAccessoryRadius: (CGFloat)radius direction: (RCUIArrowDirection)direction fillColor: (UIColor *)fillColor;
+ (UIImage *) uiImageWithAccessoryRadius: (CGFloat)radius direction: (RCUIArrowDirection)direction borderColor: (UIColor *)borderColor;

+ (UIImage *) uiImageWithAddRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
+ (UIImage *) uiImageWithAddRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithAddRadius: (CGFloat)radius fillColor: (UIColor *)fillColor;
+ (UIImage *) uiImageWithAddRadius: (CGFloat)radius borderColor: (UIColor *)borderColor;

+ (UIImage *) uiImageWithDeleteRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
+ (UIImage *) uiImageWithDeleteRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithDeleteRadius: (CGFloat)radius fillColor: (UIColor *)fillColor;
+ (UIImage *) uiImageWithDeleteRadius: (CGFloat)radius borderColor: (UIColor *)borderColor;

+ (UIImage *) uiImageWithCheckRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
+ (UIImage *) uiImageWithCheckRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithCheckRadius: (CGFloat)radius fillColor: (UIColor *)fillColor;
+ (UIImage *) uiImageWithCheckRadius: (CGFloat)radius borderColor: (UIColor *)borderColor;

+ (UIImage *) uiImageWithCloseRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
+ (UIImage *) uiImageWithCloseRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithCloseRadius: (CGFloat)radius fillColor: (UIColor *)fillColor;
+ (UIImage *) uiImageWithCloseRadius: (CGFloat)radius borderColor: (UIColor *)borderColor;

+ (UIImage *) uiImageWithBannerColor: (UIColor *)bannerColor lineColor: (UIColor *)lineColor lineEdge: (UIEdgeInsets)insets;

+ (UIImage *) uiImageWithBezierType: (RCUIBezierType)bezierType fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor radius: (CGFloat)radius;
+ (UIImage *) uiImageWithBezierType: (RCUIBezierType)bezierType fillColor: (UIColor *)fillColor radius: (CGFloat)radius;
+ (UIImage *) uiImageWithBezierType: (RCUIBezierType)bezierType borderColor: (UIColor *)borderColor radius: (CGFloat)radius;
+ (UIImage *) uiImageWithBezierType: (RCUIBezierType)bezierType fillColors: (NSArray *)fillColors borderColor: (UIColor *)borderColor radius: (CGFloat)radius size: (CGSize)size;
+ (UIImage *) uiImageWithBezierType: (RCUIBezierType)bezierType fillColors: (NSArray *)fillColors radius: (CGFloat)radius size: (CGSize)size;

+ (UIImage *) uiImageWithBezierCircle: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
+ (UIImage *) uiImageWithCircle: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
+ (UIImage *) uiImageWithCircle: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithCircle: (CGFloat)radius fillColor: (UIColor *)fillColor;
+ (UIImage *) uiImageWithCircle: (CGFloat)radius borderColor: (UIColor *)borderColor;

+ (UIImage *) uiImageWithDashLine: (CGFloat)width lengths: (CGFloat *)pattern count: (NSInteger)count lineColor: (UIColor *)lineColor lineWidth: (CGFloat)lineWidth;
+ (UIImage *) uiImageWithDashLine: (CGFloat)width lengths: (CGFloat *)pattern count: (NSInteger)count lineColor: (UIColor *)lineColor;

+ (UIImage *) uiImageWithSwitchON: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth size: (CGSize)size;
+ (UIImage *) uiImageWithSwitchOFF: (UIColor *)fillColor borderColor: (UIColor *)borderColor circleWidth: (CGFloat)circleWidth size: (CGSize)size;

+ (UIImage *) uiImageWithRadius: (CGFloat)radius title: (NSString *)title subtitle: (NSString *)subtitle
                      fontTitle: (UIFont *)fontTitle fontSubTitle: (UIFont *)fontSubTitle
                      fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
+ (UIImage *) uiImageWithKeypad1: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithKeypad2: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithKeypad3: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithKeypad4: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithKeypad5: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithKeypad6: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithKeypad7: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithKeypad8: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithKeypad9: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithKeypad0: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
+ (UIImage *) uiImageWithKeypadPaund: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;

- (UIImage *) uiGrayImage;

@end
