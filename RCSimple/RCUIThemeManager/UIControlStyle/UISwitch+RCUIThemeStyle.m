//
//  UISwitch+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UISwitch+RCUIThemeStyle.h"
#import "UIImage+RCUIPathCategory.h"
#import <QuartzCore/QuartzCore.h>

@implementation UISwitch (RCUIThemeStyle)

+ (id) uiSwitchWithThemeStyle: (RCUISwitchThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UISwitch *uiSwitch = [[[UISwitch alloc] initWithFrame: frame] autorelease];
    [uiSwitch uiApplyThemeStyle: themeStyle];
    return uiSwitch;
}

+ (id) uiSwitchWithThemeStyle: (RCUISwitchThemeStyle *)themeStyle;
{
    return [UISwitch uiSwitchWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUISwitchThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUISwitchThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUISwitchThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.backgroundThumb)
        {
            self.thumbTintColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundThumb];
        }
        
        if (themeStyle.backgroundOn)
        {
            if ([themeStyle.backgroundOn isKindOfClass: [UIColor class]])
            {
                self.onTintColor = (UIColor *)themeStyle.backgroundOn;
            }
            else if ([themeStyle.backgroundOn isKindOfClass: [UIImage class]])
            {
                self.onImage = (UIImage *)themeStyle.backgroundOn;
            }
            else if ([themeStyle.backgroundOn isKindOfClass: [NSString class]])
            {
                self.onImage = [UIImage imageNamed: (NSString *)themeStyle.backgroundOn];
            }
        }
        
        if (themeStyle.backgroundOff)
        {
            if ([themeStyle.backgroundOff isKindOfClass: [UIColor class]])
            {
                self.tintColor = (UIColor *)themeStyle.backgroundOff;
            }
            else if ([themeStyle.backgroundOff isKindOfClass: [UIImage class]])
            {
                self.offImage = (UIImage *)themeStyle.backgroundOff;
            }
            else if ([themeStyle.backgroundOff isKindOfClass: [NSString class]])
            {
                self.offImage = [UIImage imageNamed: (NSString *)themeStyle.backgroundOff];
            }
        }
    }
}

@end



@implementation RCUISwitch (RCUIThemeStyle)

+ (id) uiSwitchWithThemeStyle: (RCUISwitchThemeStyle *)themeStyle frame: (CGRect)frame;
{
    RCUISwitch *uiSwitch = [[[RCUISwitch alloc] initWithFrame: frame] autorelease];
    [uiSwitch uiApplyThemeStyle: themeStyle];
    return uiSwitch;
}

+ (id) uiSwitchWithThemeStyle: (RCUISwitchThemeStyle *)themeStyle;
{
    return [RCUISwitch uiSwitchWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUISwitchThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUISwitchThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUISwitchThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.backgroundThumb)
        {
            self.thumbTintColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundThumb];
        }
        
        if (themeStyle.thumbShadowColor)
        {
            self.thumbShadowColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.thumbShadowColor];
        }
        
        if (themeStyle.backgroundOn)
        {
            [self setOnImage: [UIImage uiImageWithSwitchON: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundOn]
                                               borderColor: themeStyle.activeColor
                                               borderWidth: 2.
                                                      size: self.frame.size]];
        }
        
        if (themeStyle.backgroundOff)
        {
            [self setOffImage: [UIImage uiImageWithSwitchOFF: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundOff]
                                                 borderColor: themeStyle.borderColor
                                                 circleWidth: 2.
                                                        size: self.frame.size]];
        }
    }
}

@end



