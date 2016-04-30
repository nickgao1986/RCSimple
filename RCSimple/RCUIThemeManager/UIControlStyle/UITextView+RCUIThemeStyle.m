//
//  UITextView+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Maxim Kershengolts on 11/03/14.
//
//

#import "UITextView+RCUIThemeStyle.h"
#import "UIView+RCUIThemeStyle.h"
#import "RCUIGlobalCommon.h"
#import <QuartzCore/QuartzCore.h>

@implementation UITextView (RCUIThemeStyle)

+ (id) uiTextViewWithThemeStyle: (RCUITextViewThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UITextView *textView = [[[UITextView alloc] initWithFrame: frame] autorelease];
    [textView uiApplyThemeStyle: themeStyle];
    return textView;
}

+ (id) uiTextViewWithThemeStyle: (RCUITextViewThemeStyle *)themeStyle;
{
    return [UITextView uiTextViewWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUITextViewThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUITextViewThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUITextViewThemeStyle *)(themeStyle.style)];
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

        if (RCUIIsIPAD () && (themeStyle.fontIPadLandscape || themeStyle.fontIPad))
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
    }
}

@end
