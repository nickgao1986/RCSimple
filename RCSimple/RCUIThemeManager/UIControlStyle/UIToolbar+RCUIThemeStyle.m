//
//  UIToolbar+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UIToolbar+RCUIThemeStyle.h"
#import "UIView+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIToolbar (RCUIThemeStyle)

+ (id) uiToolbarWithThemeStyle: (RCUIToolBarThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UIToolbar *toolBar = [[[UIToolbar alloc] initWithFrame: frame] autorelease];
    [toolBar uiApplyThemeStyle: themeStyle];
    return toolBar;
}

+ (id) uiToolbarWithThemeStyle: (RCUIToolBarThemeStyle *)themeStyle;
{
    return [UIToolbar uiToolbarWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUIToolBarThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIToolBarThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIToolBarThemeStyle *)(themeStyle.style)];
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
        
        if (themeStyle.background)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.background]
                  forToolbarPosition: UIBarPositionAny barMetrics: UIBarMetricsDefault];
        }
    }
}

@end

