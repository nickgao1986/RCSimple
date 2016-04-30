//
//  UIWebView+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UIWebView+RCUIThemeStyle.h"
#import "UIView+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIWebView (RCUIThemeStyle)

+ (id) uiWebViewWithThemeStyle: (RCUIWebViewThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UIWebView *webView = [[[UIWebView alloc] initWithFrame: frame] autorelease];
    [webView uiApplyThemeStyle: themeStyle];
    return webView;
}

+ (id) uiWebViewWithThemeStyle: (RCUIWebViewThemeStyle *)themeStyle;
{
    return [UIWebView uiWebViewWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUIWebViewThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIWebViewThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIWebViewThemeStyle *)(themeStyle.style)];
    }
    else
    {
        [super uiApplyThemeStyle: themeStyle];
        
        if (themeStyle.background)
        {
            self.layer.backgroundColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.background].CGColor;
        }
    }
}

@end
