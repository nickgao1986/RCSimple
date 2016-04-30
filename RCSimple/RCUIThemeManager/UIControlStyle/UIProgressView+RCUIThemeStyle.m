//
//  UIProgressView+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UIProgressView+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIProgressView (RCUIThemeStyle)

+ (id) uiProgressViewWithThemeStyle: (RCUIProgressViewThemeStyle *)themeStyle style: (UIProgressViewStyle)style;
{
    UIProgressView *progressView = [[[UIProgressView alloc] initWithProgressViewStyle: style] autorelease];
    [progressView uiApplyThemeStyle: themeStyle];
    return progressView;
}

- (void) uiApplyThemeStyle: (RCUIProgressViewThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIProgressViewThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIProgressViewThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.backgroundProgress)
        {
            if ([themeStyle.backgroundProgress isKindOfClass: [UIColor class]])
            {
                self.progressTintColor = (UIColor *)themeStyle.backgroundProgress;
            }
            else if ([themeStyle.backgroundProgress isKindOfClass: [UIImage class]])
            {
                self.progressImage = (UIImage *)themeStyle.backgroundProgress;
            }
            else if ([themeStyle.backgroundProgress isKindOfClass: [NSString class]])
            {
                self.progressImage = [UIImage imageNamed: (NSString *)themeStyle.backgroundProgress];
            }
        }
        
        if (themeStyle.backgroundTrack)
        {
            if ([themeStyle.backgroundTrack isKindOfClass: [UIColor class]])
            {
                self.trackTintColor = (UIColor *)themeStyle.backgroundTrack;
            }
            else if ([themeStyle.backgroundTrack isKindOfClass: [UIImage class]])
            {
                self.trackImage = (UIImage *)themeStyle.backgroundTrack;
            }
            else if ([themeStyle.backgroundTrack isKindOfClass: [NSString class]])
            {
                self.trackImage = [UIImage imageNamed: (NSString *)themeStyle.backgroundTrack];
            }
        }
    }
}

@end
