//
//  UINavigationBar+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UINavigationBar+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UINavigationBar (RCUIThemeStyle)

+ (id) uiNavigationBarWithThemeStyle: (RCUINavigationBarThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UINavigationBar *navigationBar = [[[UINavigationBar alloc] initWithFrame: frame] autorelease];
    [navigationBar uiApplyThemeStyle: themeStyle];
    return navigationBar;
}

+ (id) uiNavigationBarWithThemeStyle: (RCUINavigationBarThemeStyle *)themeStyle;
{
    return [UINavigationBar uiNavigationBarWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUINavigationBarThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUINavigationBarThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUINavigationBarThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.barTintColor)
        {
            if ([self respondsToSelector: @selector (barTintColor)])
            {
                self.barTintColor = themeStyle.barTintColor;
            }
            else
            {
                self.tintColor = themeStyle.tintColor;
            }
        }
        
        if (themeStyle.background)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.background]
                       forBarMetrics: UIBarMetricsDefault];
        }
        
        if (themeStyle.backIndicatorNormal)
        {
            self.backIndicatorImage = [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backIndicatorNormal];
        }
        
        if (themeStyle.backIndicatorHighlighted)
        {
            self.backIndicatorTransitionMaskImage = [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backIndicatorHighlighted];
        }
        
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
        
        if (themeStyle.font)
        {
            [dictionary setObject: themeStyle.font forKey: NSFontAttributeName];
        }
        
        if (themeStyle.textColor)
        {
            [dictionary setObject: themeStyle.textColor forKey: NSForegroundColorAttributeName];
        }
        
        if ([dictionary count])
        {
            [self setTitleTextAttributes: dictionary];
        }
    }
}

@end
