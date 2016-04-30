//
//  UIBadge+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 4/3/14.
//
//

#import "UIBadge+RCUIThemeStyle.h"
#import "UIView+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation RCUIBadge (RCUIThemeStyle)

+ (id) uiBadgeViewWithThemeStyle: (RCUIBadgeThemeStyle *)themeStyle;
{
    RCUIBadge *badge = [[[RCUIBadge alloc] initWithFrame: CGRectZero] autorelease];
    [badge uiApplyThemeStyle: themeStyle];
    return badge;
}

- (void) uiApplyThemeStyle: (RCUIBadgeThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIBadgeThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIBadgeThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.font)
        {
            self.font = themeStyle.font;
        }
        
        if (themeStyle.textColor)
        {
            self.textColor = themeStyle.textColor;
        }
        
        if (themeStyle.tintColor)
        {
            self.badgeColor = themeStyle.tintColor;
        }
        
        if (themeStyle.shadowColor)
        {
            self.shadowColor = themeStyle.shadowColor;
        }
        
        if (themeStyle.shadowOffset)
        {
            self.shadowOffset = [themeStyle.shadowOffset CGSizeValue];
        }
        else
        {
            self.shadowOffset = CGSizeZero;
        }
        
        if (themeStyle.shadowRadius)
        {
            self.shadowBlur = [themeStyle.shadowRadius floatValue];
        }
        else
        {
            self.shadowBlur = 0.f;
        }
    }
}

@end

