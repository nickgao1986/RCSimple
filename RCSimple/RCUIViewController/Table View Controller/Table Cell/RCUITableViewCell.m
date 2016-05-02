// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "RCUITableViewCell.h"
#import "RCUIThemeStyleHeader.h"
#import "UITableView+RCUICategory.h"

@implementation RCUITableViewCell

- (id) initWithStyle: (UITableViewCellStyle)style reuseIdentifier: (NSString *)reuseIdentifier;
{
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
	
    if (self)
	{
        self.backgroundColor = [UIColor clearColor];
        [self applyTableViewCellSkin];
    }
	
    return self;
}

+ (CGFloat) tableView: (UITableView *)tableView rowHeightForObject: (id)object;
{
    return [tableView tableCellHeight];
}

+ (CGFloat) tableView: (UITableView *)tableView separatorInsetForObject: (id)object;
{
    return 16.f;
}

- (id) object;
{
    return nil;
}

- (void) setObject: (id)object;
{}

- (void) applyTableViewCellSkin;
{
    [self uiApplyThemeStyle: [RCUI_THEME_STYLE () tableViewCellThemeWithStyleName: RCTableViewPlainCellDefaultBackground]];
}

- (void) prepareForMoveSnapshot;
{}

- (void) prepareForMove;
{}

- (void) didTransitionToState: (UITableViewCellStateMask)state
{
    [super didTransitionToState: state];
    [self customizeCellEditControl];
}

- (void) setHighlighted: (BOOL)highlighted animated: (BOOL)animated;
{
    [super setHighlighted: highlighted animated: animated];
    
    if (self.editing)
    {
        [self customizeCellEditControl];
    }
}

- (void) setSelected: (BOOL)selected animated: (BOOL)animated;
{
    [super setSelected: selected animated: animated];
    
    if (self.editing)
    {
        [self customizeCellEditControl];
    }
}

- (void) setEditing: (BOOL)editing animated: (BOOL)animated;
{
    [super setEditing: editing animated: animated];
    
    if (editing)
    {
        [self customizeCellEditControl];
    }
}

- (void) customizeCellEditControl;
{
    NSArray *subviews = self.subviews;
    if (RCUIIsIOSSDKVersionAbove7 () && (!RCUIIsIOSSDKVersionAbove8 ()))
    {
        subviews = [self.subviews[0] subviews];
    }
    
    BOOL allowCustomize = self.editingStyle == (UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete);
    for (UIView *editControl in subviews)
    {
        if ([editControl isKindOfClass: NSClassFromString (@"UITableViewCellEditControl")] && allowCustomize)
        {
            for (UIView *imageView in editControl.subviews)
            {
                if ([imageView isKindOfClass: [UIImageView class]])
                {
                    if (self.selected || self.highlighted)
                    {
                        [(UIImageView *)imageView setImage: [UIImage imageNamed: @"RCSPIOS7TableViewCellCheckSelected"]];
                    }
                    else
                    {
                        [(UIImageView *)imageView setImage: [UIImage imageNamed: @"RCSPIOS7TableViewCellCheckNormal"]];
                    }
                }
            }
        }
    }
}

- (void) prepareForReuse;
{
    self.object                 = nil;
    self.textLabel.text         = nil;
    self.detailTextLabel.text   = nil;
    self.imageView.image        = nil;
    
    [super prepareForReuse];
}

- (void) dealloc;
{
    self.object = nil;
    [super dealloc];
}

@end
