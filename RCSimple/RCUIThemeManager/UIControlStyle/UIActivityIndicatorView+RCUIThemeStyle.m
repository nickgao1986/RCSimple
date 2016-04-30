//
//  UIActivityIndicatorView+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UIActivityIndicatorView+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIActivityIndicatorView (RCUIThemeStyle)

+ (id) uiActivityIndicatorViewWithThemeStyle: (RCUIActivityIndicatorViewThemeStyle *)themeStyle style: (UIActivityIndicatorViewStyle)style;
{
    UIActivityIndicatorView *indicatorView = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: style] autorelease];
    [indicatorView uiApplyThemeStyle: themeStyle];
    return indicatorView;
}

- (void) uiApplyThemeStyle: (RCUIActivityIndicatorViewThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIActivityIndicatorViewThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIActivityIndicatorViewThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.backgroundColor)
        {
            self.color = themeStyle.backgroundColor;
        }
    }
}

@end
