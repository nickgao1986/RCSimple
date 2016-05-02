//
//  RCUITableViewiOS7GroupStyleCell.m
//  RCUIKit
//
//  Created by Jackie Karira on 9/15/14.
//
//

#import "RCUITableViewiOS7GroupStyleCell.h"
#import "RCUIThemeStyleHeader.h"
#import "UITableView+RCUICategory.h"

@implementation RCUITableViewiOS7GroupStyleCell

- (void) applyTableViewCellSkin;
{
    [self uiApplyiOS7GroupThemeStyle: [RCUI_THEME_STYLE () tableViewCellThemeWithStyleName: RCTableViewGroupCellDefaultBackground]];
}

- (void) layoutSubviews;
{
    [super layoutSubviews];
    
    if (!RCUIIsIOSSDKVersionAbove7 () && (self.tableView.style == UITableViewStyleGrouped))
    {
        self.contentView.frame = self.bounds;
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
