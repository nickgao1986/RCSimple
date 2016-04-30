//
//  UIPageControl+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 7/18/14.
//
//

#import "UIPageControl+RCUIThemeStyle.h"

@implementation UIPageControl (RCUIThemeStyle)

+ (id) uiPageControlWithThemeStyle: (RCUIPageControlThemeStyle *)themeStyle;
{
    UIPageControl *pageControl = [[[UIPageControl alloc] init] autorelease];
    [pageControl uiApplyThemeStyle: themeStyle];
    return pageControl;
}

- (void) uiApplyThemeStyle: (RCUIPageControlThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIPageControlThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIPageControlThemeStyle *)(themeStyle.style)];
    }
    else
    {
        self.backgroundColor = [UIColor clearColor];
        
        if (themeStyle.circleIndicatorColor)
        {
            self.pageIndicatorTintColor = themeStyle.circleIndicatorColor;
        }
        
        if (themeStyle.pageIndicatorColor)
        {
            self.currentPageIndicatorTintColor = themeStyle.pageIndicatorColor;
        }
    }
}

@end

@implementation RCUIPageControl (RCUIThemeStyle)

+ (id) uiPageControlWithThemeStyle: (RCUIPageControlThemeStyle *)themeStyle;
{
    RCUIPageControl *pageControl = [[[RCUIPageControl alloc] initWithType: RCUIPageControlTypeEmpty] autorelease];
    [pageControl uiApplyThemeStyle: themeStyle];
    return pageControl;
}

- (void) uiApplyThemeStyle: (RCUIPageControlThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIPageControlThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIPageControlThemeStyle *)(themeStyle.style)];
    }
    else
    {
        self.backgroundColor = [UIColor clearColor];
        
        if (themeStyle.circleIndicatorColor)
        {
            self.pageIndicatorTintColor = themeStyle.circleIndicatorColor;
        }
        
        if (themeStyle.pageIndicatorColor)
        {
            self.currentPageIndicatorTintColor = themeStyle.pageIndicatorColor;
        }
    }
}

@end
