//
//  UIBarButtonItem+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UIBarButtonItem+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIBarButtonItem (RCUIThemeStyle)

+ (id) uiBarButtonItemWithThemeStyle: (RCUIBarButtonItemThemeStyle *)themeStyle
                          customView: (UIView *)customView;
{
    UIBarButtonItem *barButtonItem = [[[UIBarButtonItem alloc] initWithCustomView: customView] autorelease];
    [barButtonItem uiApplyThemeStyle: themeStyle];
    return barButtonItem;
}

+ (id) uiBarButtonItemWithThemestyle: (RCUIBarButtonItemThemeStyle *)themeStyle
                               title: (NSString *)title
                               style: (UIBarButtonItemStyle)style
                              target: (id)target
                              action: (SEL)action;
{
    UIBarButtonItem *barButtonItem = [[[UIBarButtonItem alloc] initWithTitle: title style: style target: target action: action] autorelease];
    [barButtonItem uiApplyThemeStyle: themeStyle];
    return barButtonItem;
}

- (void) uiApplyThemeStyle: (RCUIBarButtonItemThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIBarButtonItemThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIBarButtonItemThemeStyle *)(themeStyle.style)];
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
        
        if (themeStyle.backIndicatorNormal)
        {
            [self setBackButtonBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backIndicatorNormal]
                                      forState: UIControlStateNormal barMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.backIndicatorHighlighted)
        {
            [self setBackButtonBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backIndicatorHighlighted]
                                      forState: UIControlStateHighlighted barMetrics: UIBarMetricsDefault];
        }
    }
}

- (void) uiAppearanceThemeStyle: (RCUIBarButtonItemThemeStyle *)themeStyle UI_APPEARANCE_SELECTOR;
{
    
}

@end


