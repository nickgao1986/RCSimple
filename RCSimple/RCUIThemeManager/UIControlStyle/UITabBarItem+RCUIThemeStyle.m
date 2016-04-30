//
//  UITabBarItem+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UITabBarItem+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UITabBarItem (RCUIThemeStyle)

+ (id) uiTabBarItemWithThemeStyle: (RCUITabBarItemThemeStyle *)themeStyle;
{
    UITabBarItem *tabBarItem = [[[UITabBarItem alloc] init] autorelease];
    [tabBarItem uiApplyThemeStyle: themeStyle];
    return tabBarItem;
}

- (void) uiApplyThemeStyle: (RCUITabBarItemThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUITabBarItemThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUITabBarItemThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.imageUnselected)
        {
            self.image = [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageUnselected];
        }
        
        if (themeStyle.imageSelected)
        {
            self.selectedImage = [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageSelected];
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
            [self setTitleTextAttributes: dictionary forState: UIControlStateNormal];
        }
    }
}

@end
