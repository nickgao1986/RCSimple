//
//  UIView+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UIView+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (RCUIThemeStyle)

+ (id) uiViewWithThemeStyle: (RCUIViewThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UIView *view = [[[UIView alloc] initWithFrame: frame] autorelease];
    [view uiApplyThemeStyle: themeStyle];
    return view;
}

+ (id) uiViewWithThemeStyle: (RCUIViewThemeStyle *)themeStyle;
{
    return [UIView uiViewWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUIViewThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIViewThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIViewThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.background)
        {
            self.backgroundColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.background];
        }
        
        if (themeStyle.alpha)
        {
            self.alpha = [themeStyle.alpha floatValue];
        }
        
        if (themeStyle.cornerRadius)
        {
            self.layer.cornerRadius = [themeStyle.cornerRadius floatValue];
        }
        
        if (themeStyle.borderColor)
        {
            self.layer.borderColor = themeStyle.borderColor.CGColor;
        }
        
        if (themeStyle.borderWidth)
        {
            self.layer.borderWidth = [themeStyle.borderWidth floatValue];
        }
        
        if (themeStyle.shadowColor)
        {
            self.layer.shadowColor = [themeStyle.shadowColor CGColor];
        }
        
        if (themeStyle.shadowOpacity)
        {
            self.layer.shadowOpacity = [themeStyle.shadowOpacity floatValue];
        }
        
        if (themeStyle.shadowRadius)
        {
            self.layer.shadowRadius = [themeStyle.shadowRadius floatValue];
        }
        
        if (themeStyle.shadowOffset)
        {
            self.layer.shadowOffset = [themeStyle.shadowOffset CGSizeValue];
        }
    }
}

@end




