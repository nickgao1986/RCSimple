//
//  UISegmentedControl+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UISegmentedControl+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+RCUIPathCategory.h"

@implementation UISegmentedControl (RCUIThemeStyle)

+ (id) uiSegmentedControlWithThemeStyle: (RCUISegmentedControlThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UISegmentedControl *segmentedControl = [[[UISegmentedControl alloc] initWithFrame: frame] autorelease];
    [segmentedControl uiApplyThemeStyle: themeStyle];
    return segmentedControl;
}

+ (id) uiSegmentedControlWithThemeStyle: (RCUISegmentedControlThemeStyle *)themeStyle;
{
    return [UISegmentedControl uiSegmentedControlWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUISegmentedControlThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUISegmentedControlThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUISegmentedControlThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.backgroundNormal)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundNormal]
                            forState: UIControlStateNormal barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.backgroundHighlighted)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundHighlighted]
                            forState: UIControlStateHighlighted barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.backgroundDisable)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundDisable]
                            forState: UIControlStateDisabled barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.backgroundSelected)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundSelected]
                            forState: UIControlStateSelected barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.dividerNormalNormal)
        {
            [self setDividerImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.dividerNormalNormal]
              forLeftSegmentState: UIControlStateNormal rightSegmentState: UIControlStateNormal barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.dividerNormalSelected)
        {
            [self setDividerImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.dividerNormalSelected]
              forLeftSegmentState: UIControlStateNormal rightSegmentState: UIControlStateSelected barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.dividerSelectedNormal)
        {
            [self setDividerImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.dividerSelectedNormal]
              forLeftSegmentState: UIControlStateSelected rightSegmentState: UIControlStateNormal barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.tintColor)
        {
            [self setTintColor:themeStyle.tintColor];
        }        
    }
}

- (void) uiApplyThemeStyle: (RCUISegmentedControlThemeStyle *)themeStyle radius: (CGFloat)radius;
{
    if ([themeStyle.style isKindOfClass: [RCUISegmentedControlThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUISegmentedControlThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.backgroundNormal)
        {
            UIImage *img = [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                 fillColor: nil
                               borderColor: (UIColor *)themeStyle.backgroundNormal
                                                   radius: radius];

            [self setBackgroundImage: img
                            forState: UIControlStateNormal barMetrics: UIBarMetricsDefault];
            
        }
        
        if (themeStyle.backgroundHighlighted)
        {
            UIImage *img = [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                fillColor: (UIColor *)themeStyle.backgroundHighlighted
                                              borderColor: (UIColor *)themeStyle.backgroundHighlighted
                                                   radius: radius];
            [self setBackgroundImage: img
                            forState: UIControlStateHighlighted barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.backgroundDisable)
        {
            UIImage *img = [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                fillColor: (UIColor *)themeStyle.backgroundDisable
                                              borderColor: (UIColor *)themeStyle.backgroundDisable
                                                   radius: radius];
            
            [self setBackgroundImage:img
                            forState: UIControlStateDisabled barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.backgroundSelected)
        {
            UIImage *img = [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                fillColor: (UIColor *)themeStyle.backgroundSelected
                                              borderColor: (UIColor *)themeStyle.backgroundSelected
                                                   radius: radius];
            
            [self setBackgroundImage: img
                            forState: UIControlStateSelected barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.backgroundSelectedHighlighted)
        {
            UIImage *img = [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                fillColor: (UIColor *)themeStyle.backgroundSelectedHighlighted
                                              borderColor: (UIColor *)themeStyle.backgroundSelectedHighlighted
                                                   radius: radius];
            
            [self setBackgroundImage: img
                            forState: UIControlStateSelected | UIControlStateHighlighted barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.dividerNormalNormal)
        {
            [self setDividerImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.dividerNormalNormal]
              forLeftSegmentState: UIControlStateNormal rightSegmentState: UIControlStateNormal barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.dividerNormalSelected)
        {
            [self setDividerImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.dividerNormalSelected]
              forLeftSegmentState: UIControlStateNormal rightSegmentState: UIControlStateSelected barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.dividerSelectedNormal)
        {
            [self setDividerImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.dividerSelectedNormal]
              forLeftSegmentState: UIControlStateSelected rightSegmentState: UIControlStateNormal barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.titleTextAttributesNormal)
        {
            [self setTitleTextAttributes:themeStyle.titleTextAttributesNormal forState:UIControlStateNormal];
        }
        
        if (themeStyle.titleTextAttributesDisable)
        {
            [self setTitleTextAttributes:themeStyle.titleTextAttributesDisable forState:UIControlStateDisabled];
        }

        if (themeStyle.titleTextAttributesSelected)
        {
            [self setTitleTextAttributes:themeStyle.titleTextAttributesSelected forState:UIControlStateSelected];
        }
        
        if (themeStyle.titleTextAttributesHighlighted)
        {
            [self setTitleTextAttributes:themeStyle.titleTextAttributesHighlighted forState:UIControlStateHighlighted];
        }
        
        if (themeStyle.titleTextAttributesSelectedHighlighted)
        {
            [self setTitleTextAttributes:themeStyle.titleTextAttributesSelectedHighlighted forState:UIControlStateSelected | UIControlStateHighlighted];
        }
        
        if (themeStyle.tintColor)
        {
            [self setTintColor:themeStyle.tintColor];
        }
    }
}

@end


