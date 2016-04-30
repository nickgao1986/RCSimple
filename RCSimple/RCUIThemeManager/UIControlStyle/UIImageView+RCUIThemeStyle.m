//
//  UIImageView+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UIImageView+RCUIThemeStyle.h"
#import "UIView+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImageView (RCUIThemeStyle)

+ (id) uiImageViewWithThemeStyle: (RCUIImageViewThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UIImageView *imageView = [[[UIImageView alloc] init] autorelease];
    [imageView uiApplyThemeStyle: themeStyle];
    return imageView;
}

+ (id) uiImageViewWithThemeStyle: (RCUIImageViewThemeStyle *)themeStyle;
{
    return [UIImageView uiImageViewWithThemeStyle: themeStyle frame: CGRectZero];
}

+ (id) uiImageViewWithThemeStyle: (RCUIImageViewThemeStyle *)themeStyle bannerEdge: (UIEdgeInsets)insets;
{
    UIImageView *imageView = [[[UIImageView alloc] init] autorelease];
    [imageView uiApplyThemeStyle: themeStyle bannerEdge: insets];
    return imageView;
}

- (void) uiApplyThemeStyle: (RCUIImageViewThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIImageViewThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIImageViewThemeStyle *)(themeStyle.style)];
    }
    else
    {
        [super uiApplyThemeStyle: themeStyle];
        
        if (themeStyle.image)
        {
            self.image = [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.image];
        }
        
        if (themeStyle.imageHighlighted)
        {
            self.highlightedImage = [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageHighlighted];
        }
    }
}

- (void) uiApplyThemeStyle: (RCUIImageViewThemeStyle *)themeStyle bannerEdge: (UIEdgeInsets)insets;
{
    if ([themeStyle.style isKindOfClass: [RCUIImageViewThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIImageViewThemeStyle *)(themeStyle.style) bannerEdge: insets];
    }
    else
    {
        if ([themeStyle.background isKindOfClass: [UIColor class]] && themeStyle.borderColor)
        {
            self.image = [UIImage uiImageWithBannerColor: (UIColor *)themeStyle.background lineColor: themeStyle.borderColor lineEdge: insets];
        }
    }
}

- (void) freeMemory;
{
    if (self.isAnimating)
    {
        [self stopAnimating];
    }
    self.image           = nil;
    self.animationImages = nil;
}

- (void) uiApplyAnimationThemeStyle: (RCUIImageViewThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIImageViewThemeStyle class]])
    {
        [self uiApplyAnimationThemeStyle: (RCUIImageViewThemeStyle *)(themeStyle.style)];
    }
    else
    {
        [self freeMemory];
        
        if (!themeStyle.images)
        {}
        else if ([themeStyle.images count] == 1)
        {
            self.image = (UIImage *)[themeStyle.images objectAtIndex: 0];
        }
        else if ([themeStyle.images count] > 1)
        {
            [self setAnimationImages: themeStyle.images];
            [self setAnimationDuration: 1];
            [self setAnimationRepeatCount: 0];
            [self startAnimating];
        }
    }
}

- (void) uiApplyArrowInCircleThemeStyle: (RCUIImageViewThemeStyle *)themeStyle direction: (RCUIArrowDirection)direction radius: (CGFloat)radius;
{
    if (themeStyle.image)
    {
        [self setImage: [UIImage uiImageWithAccessoryRadius: radius direction: direction borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.image]]];
    }
    
    if (themeStyle.imageHighlighted)
    {
        [self setHighlightedImage: [UIImage uiImageWithAccessoryRadius: radius direction: direction borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]];
    }
}

- (void) uiApplyArrowThemeStyle: (RCUIImageViewThemeStyle *)themeStyle direction: (RCUIArrowDirection)direction;
{
    if (themeStyle.image)
    {
        [self setImage: [UIImage uiImageWithArrowColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.image] direction: direction lineWidth: 1.f]];
    }
}

- (void) uiApplyCheckThemeStyle: (RCUIImageViewThemeStyle *)themeStyle;
{
    if (themeStyle.image)
    {
        [self setImage: [UIImage uiImageWithCheckColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.image] lineWidth: 2.f]];
    }
    
    if (themeStyle.imageHighlighted)
    {
        [self setHighlightedImage: [UIImage uiImageWithCheckColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted] lineWidth: 2.f]];
    }
}

- (void) uiApplyBezierThemeStyle: (RCUIImageViewThemeStyle *)themeStyle bezierType: (RCUIBezierType)type;
{
    if (themeStyle.image)
    {
        [self setImage: [UIImage uiImageWithBezierType: type fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.image] radius: 5.f]];
    }
    
    if (themeStyle.imageHighlighted)
    {
        [self setHighlightedImage: [UIImage uiImageWithBezierType: type fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted] radius: 5.f]];
    }
}

@end

