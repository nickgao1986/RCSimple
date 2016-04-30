//
//  UIPopoverBackgroundView+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UIPopoverBackgroundView+RCUIThemeStyle.h"
#import "UIView+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIPopoverBackgroundView (RCUIThemeStyle)

+ (id) uiPopoverBackgroundViewWithThemeStyle: (RCUIPopoverBackgroundViewThemeStyle *)themeStyle;
{
    UIPopoverBackgroundView *popoverBackgroundView = [[[UIPopoverBackgroundView alloc] init] autorelease];
    [popoverBackgroundView uiApplyThemeStyle: themeStyle];
    return popoverBackgroundView;
}

- (void) uiApplyThemeStyle: (RCUIPopoverBackgroundViewThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIPopoverBackgroundViewThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIPopoverBackgroundViewThemeStyle *)(themeStyle.style)];
    }
    else
    {
        [super uiApplyThemeStyle: themeStyle];
    }
}

@end
