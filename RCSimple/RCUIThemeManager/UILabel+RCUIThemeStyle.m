//
//  UILabel+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UILabel+RCUIThemeStyle.h"
#import "UIView+RCUIThemeStyle.h"
#import "RCUIGlobalCommon.h"
#import <QuartzCore/QuartzCore.h>

#define RCUI_THEME_STYLE()      [[RCUIThemeStyleManager sharedThemeStyleManager] themeStyle]


@implementation UILabel (RCUIThemeStyle)

+ (id) uiLabelWithThemeStyle: (RCUILabelThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UILabel *label = [[[UILabel alloc] initWithFrame: frame] autorelease];
    [label uiApplyThemeStyle: themeStyle];
    return label;
}

+ (id) uiLabelWithThemeStyle: (RCUILabelThemeStyle *)themeStyle;
{
    return [UILabel uiLabelWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUILabelThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUILabelThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUILabelThemeStyle *)(themeStyle.style)];
    }
    else
    {
        [super uiApplyThemeStyle: themeStyle];
        
        if (themeStyle.background)
        {
            self.backgroundColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.background];
        }
        else
        {
            self.backgroundColor = [UIColor clearColor];
        }

        if (RCUIIsIPAD() && (themeStyle.fontIPadLandscape || themeStyle.fontIPad))
        {
            self.font = (RCUIIsOrientationLandscapeSupported () ? themeStyle.fontIPadLandscape : themeStyle.fontIPad);
        }
        else if (themeStyle.font)
        {
            self.font = themeStyle.font;
        }
        
        if (themeStyle.textColor)
        {
            self.textColor = themeStyle.textColor;
        }
        
        if (themeStyle.textColorHighlighted)
        {
            self.highlightedTextColor = themeStyle.textColorHighlighted;
        }
    }
}

@end
