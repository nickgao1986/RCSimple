//
//  UITabBar+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UITabBar+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UITabBar (RCUIThemeStyle)

+ (id) uiTabBarWithThemeStyle: (RCUITabBarThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UITabBar *tabBar = [[[UITabBar alloc] initWithFrame: frame] autorelease];
    [tabBar uiApplyThemeStyle: themeStyle];
    return tabBar;
}

+ (id) uiTabBarWithThemeStyle: (RCUITabBarThemeStyle *)themeStyle;
{
    return [UITabBar uiTabBarWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUITabBarThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUITabBarThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUITabBarThemeStyle *)(themeStyle.style)];
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
                self.tintColor = themeStyle.barTintColor;
            }
        }
        
        if (themeStyle.selectedTintColor)
        {
            self.selectedImageTintColor = themeStyle.selectedTintColor;
        }
        
        if (themeStyle.background)
        {
            self.backgroundImage = [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.background];
        }
        
        if (themeStyle.backgroundSelectionIndicator)
        {
            self.selectionIndicatorImage = [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundSelectionIndicator];
        }
    }
}

@end

