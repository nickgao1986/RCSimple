//
//  UITableViewCell+RCUIGroupStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 1/23/14.
//
//

#import "UITableViewCell+RCUIGroupStyle.h"
#import <RCUIKit/RCUIThemeStyleHeader.h>

@implementation UITableViewCell (RCUIGroupStyle)

- (void) styleFillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor position: (RCUITableViewGroupCellPosition)position;
{
    RCUITableViewCellBackgroundView *backgroundStyle = [[[RCUITableViewCellBackgroundView alloc] initWithFrame: self.frame] autorelease];
    self.backgroundView = backgroundStyle;
    backgroundStyle.borderColor = borderColor;
    backgroundStyle.fillColor   = fillColor;
    backgroundStyle.position    = position;
}

- (void) selectedStyleFillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor position: (RCUITableViewGroupCellPosition)position;
{
    RCUITableViewCellBackgroundView *backgroundStyle = [[[RCUITableViewCellBackgroundView alloc] initWithFrame: self.frame] autorelease];
    self.selectedBackgroundView = backgroundStyle;
    backgroundStyle.borderColor = borderColor;
    backgroundStyle.fillColor   = fillColor;
    backgroundStyle.position    = position;
}

- (void) defaultBackgroundStyle: (RCUITableViewGroupCellPosition)position;
{
    RCUITableViewCellThemeStyle *themeStyle = [RCUI_THEME_STYLE () tableViewCellThemeWithStyleName: RCTableViewGroupCellDefaultBackground];
    [self styleFillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
             borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.borderColorNormal]
                position: position];
}

- (void) defaultSelectedBackgroundStyle: (RCUITableViewGroupCellPosition)position;
{
    RCUITableViewCellThemeStyle *themeStyle = [RCUI_THEME_STYLE () tableViewCellThemeWithStyleName: RCTableViewGroupCellDefaultBackground];
    [self selectedStyleFillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                     borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.borderColorHighlighted]
                        position: position];
}

@end
