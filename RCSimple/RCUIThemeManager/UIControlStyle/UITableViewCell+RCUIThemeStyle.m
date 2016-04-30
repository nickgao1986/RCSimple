//
//  UITableViewCell+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UITableViewCell+RCUIThemeStyle.h"
#import "UIView+RCUIThemeStyle.h"
#import "RCUITableViewCellBackgroundView.h"
#import "RCUIiOS7TableViewCellBackgroundView.h"
#import <QuartzCore/QuartzCore.h>

@implementation UITableViewCell (RCUIThemeStyle)

+ (id) uiTableViewCellWithThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle cellStyle: (UITableViewCellStyle)cellStyle reuseIdentifier:(NSString *)reuseIdentifier;
{
    UITableViewCell *tableViewCell = [[[UITableViewCell alloc] initWithStyle: cellStyle reuseIdentifier: reuseIdentifier] autorelease];
    [tableViewCell uiApplyThemeStyle: themeStyle];
    return tableViewCell;
}

+ (id) uiTableViewCellWithThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle frame: (CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier;
{
    UITableViewCell *tableViewCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: reuseIdentifier] autorelease];
    [tableViewCell uiApplyThemeStyle: themeStyle];
    return tableViewCell;
}

+ (id) uiTableViewGroupCellWithThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle cellStyle: (UITableViewCellStyle)cellStyle reuseIdentifier:(NSString *)reuseIdentifier;
{
    UITableViewCell *tableViewCell = [[[UITableViewCell alloc] initWithStyle: cellStyle reuseIdentifier: reuseIdentifier] autorelease];
    [tableViewCell uiApplyGroupThemeStyle: themeStyle];
    return tableViewCell;
}

+ (id) uiTableViewGroupCellWithThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle frame: (CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier;
{
    UITableViewCell *tableViewCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: reuseIdentifier] autorelease];
    [tableViewCell uiApplyGroupThemeStyle: themeStyle];
    return tableViewCell;
}

- (void) uiApplyThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUITableViewCellThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUITableViewCellThemeStyle *)(themeStyle.style)];
    }
    else
    {
        self.backgroundColor = [UIColor clearColor];
        
        if (themeStyle.backgroundNormal)
        {
            self.backgroundView = [[[UIView alloc] init] autorelease];
            self.backgroundView.backgroundColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal];
        }
        
        if (themeStyle.backgroundHighlighted)
        {
            self.selectedBackgroundView = [[[UIView alloc] init] autorelease];
            self.selectedBackgroundView.backgroundColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted];
        }
        
        if (themeStyle.backgroundHighlighted)
        {
            self.multipleSelectionBackgroundView = [[[UIView alloc] init] autorelease];
            self.multipleSelectionBackgroundView.backgroundColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted];
        }
    }
}

- (void) uiApplyGroupThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUITableViewCellThemeStyle class]])
    {
        [self uiApplyGroupThemeStyle: (RCUITableViewCellThemeStyle *)(themeStyle.style)];
    }
    else
    {
        self.backgroundColor = [UIColor whiteColor];
        
        RCUITableViewCellBackgroundView *backgroundView = [[[RCUITableViewCellBackgroundView alloc] initWithFrame: self.frame] autorelease];
		self.backgroundView = backgroundView;
		backgroundView.borderColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.borderColorNormal];
		backgroundView.fillColor   = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal];
		
		RCUITableViewCellBackgroundView *selectedBackgroundView = [[[RCUITableViewCellBackgroundView alloc] initWithFrame: self.frame] autorelease];
		self.selectedBackgroundView = selectedBackgroundView;
		selectedBackgroundView.borderColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.borderColorHighlighted];
		selectedBackgroundView.fillColor   = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted];
    }
}

- (void) uiApplyiOS7GroupThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUITableViewCellThemeStyle class]])
    {
        [self uiApplyiOS7GroupThemeStyle: (RCUITableViewCellThemeStyle *)(themeStyle.style)];
    }
    else
    {
        self.backgroundColor = [UIColor whiteColor];
        
        RCUIiOS7TableViewCellBackgroundView *backgroundView = [[[RCUIiOS7TableViewCellBackgroundView alloc] initWithFrame: self.frame] autorelease];
        self.backgroundView = backgroundView;
        backgroundView.borderColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.borderColorNormal];
        backgroundView.fillColor   = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal];
        
        RCUIiOS7TableViewCellBackgroundView *selectedBackgroundView = [[[RCUIiOS7TableViewCellBackgroundView alloc] initWithFrame: self.frame] autorelease];
        self.selectedBackgroundView = selectedBackgroundView;
        selectedBackgroundView.borderColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.borderColorHighlighted];
        selectedBackgroundView.fillColor   = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted];
    }
}

@end
