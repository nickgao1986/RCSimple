//
//  RCUITableViewiOS6GroupStyleCell.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 4/9/14.
//
//

#import "RCUITableViewiOS6GroupStyleCell.h"
#import "RCUIThemeStyleHeader.h"
#import "UITableView+RCUICategory.h"

@implementation RCUITableViewiOS6GroupStyleCell

- (void) applyTableViewCellSkin;
{
    [self uiApplyGroupThemeStyle: [RCUI_THEME_STYLE () tableViewCellThemeWithStyleName: RCTableViewGroupCellDefaultBackground]];
}

- (void) setFrame: (CGRect)frame;
{
    if (RCUIIsIOSSDKVersionAbove7 () && (self.tableView.style == UITableViewStyleGrouped))
    {
        frame.origin.x += [self.tableView tableCellMargin];
        frame.size.width -= [self.tableView tableCellMargin] * 2;
    }
    
    [super setFrame: frame];
}

- (void) layoutSubviews;
{
    [super layoutSubviews];
    
    if (!RCUIIsIOSSDKVersionAbove7 ())
    {
        return;
    }
    
    if (self.backgroundView)
    {
        self.backgroundView.frame = self.bounds;
    }
    
    if (self.selectedBackgroundView)
    {
        self.selectedBackgroundView.frame = self.bounds;
    }
}

@end
