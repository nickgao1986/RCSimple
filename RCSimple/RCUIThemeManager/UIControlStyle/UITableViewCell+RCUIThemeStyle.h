//
//  UITableViewCell+RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import <UIKit/UIKit.h>

@interface UITableViewCell (RCUIThemeStyle)

+ (id) uiTableViewCellWithThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle cellStyle: (UITableViewCellStyle)cellStyle reuseIdentifier:(NSString *)reuseIdentifier;
+ (id) uiTableViewCellWithThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle frame: (CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier;
+ (id) uiTableViewGroupCellWithThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle cellStyle: (UITableViewCellStyle)cellStyle reuseIdentifier:(NSString *)reuseIdentifier;
+ (id) uiTableViewGroupCellWithThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle frame: (CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier;

- (void) uiApplyThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle;
- (void) uiApplyGroupThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle;
- (void) uiApplyiOS7GroupThemeStyle: (RCUITableViewCellThemeStyle *)themeStyle;

@end
