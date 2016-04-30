//
//  UITableView+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UITableView+RCUIThemeStyle.h"
#import "UIView+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UITableView (RCUIThemeStyle)

+ (id) uiTableViewWithThemeStyle: (RCUITableViewThemeStyle *)themeStyle style: (UITableViewStyle)style frame: (CGRect)frame;
{
    UITableView *tableView = [[[UITableView alloc] initWithFrame: frame style: style] autorelease];
    [tableView uiApplyThemeStyle: themeStyle];
    return tableView;
}

+ (id) uiTableViewWithThemeStyle: (RCUITableViewThemeStyle *)themeStyle style: (UITableViewStyle)style;
{
    return [UITableView uiTableViewWithThemeStyle: themeStyle style: style frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUITableViewThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUITableViewThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUITableViewThemeStyle *)(themeStyle.style)];
    }
    else
    {
        [super uiApplyThemeStyle: themeStyle];
        
        if (themeStyle.background && [self respondsToSelector: @selector (setTintColor:)])
        {
            self.backgroundColor = themeStyle.background;
        }
        
        if (themeStyle.sectionIndexColor && [self respondsToSelector: @selector (sectionIndexColor)])
        {
            self.sectionIndexColor = themeStyle.sectionIndexColor;
        }
        
        if (themeStyle.sectionIndexBackgroundColor && [self respondsToSelector: @selector (sectionIndexBackgroundColor)])
        {
            self.sectionIndexBackgroundColor = themeStyle.sectionIndexBackgroundColor;
        }
        
        if (themeStyle.sectionIndexTrackingBackgroundColor && [self respondsToSelector: @selector (sectionIndexTrackingBackgroundColor)])
        {
            self.sectionIndexTrackingBackgroundColor = themeStyle.sectionIndexTrackingBackgroundColor;
        }
        
        if (themeStyle.separatorColor)
        {
            self.separatorColor = themeStyle.separatorColor;
        }
    }
}

@end
