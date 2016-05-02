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

#import "RCUITableViewHeaderView.h"
//#import "RCUITableViewPositonConstMacros.h"
//#import <RCUIKit/RCUIKitResources.h>
//#import <RCUIKit/RCUIKitDefaults.h>
#import "RCUIThemeStyleHeader.h"
//#import <RCBase/RCVariableDeclarations.h>
#import <CoreGraphics/CGGeometry.h>
#import <UIKit/UIKit.h>

#define RCUI_TABLEVIEW_SIMPLE_CELL_LEFT_MARGIN_PHONE				12


@implementation RCUITableViewHeaderView

- (id) initWithTitle: (NSString *)title;
{
	self = [super init];
	
	if (self)
	{
        [self uiApplyThemeStyle: [RCUI_THEME_STYLE () viewThemeWithStyleName: RCTableViewSectionBackground]];
        
        
        
		self.label = [[[UILabel alloc] init] autorelease];
		self.label.text = title;
		[self.label uiApplyThemeStyle: [RCUI_THEME_STYLE () labelThemeWithStyleName: RCTableViewSectionLabel]];
        self.label.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
		self.label.lineBreakMode = NSLineBreakByTruncatingMiddle;
		self.label.numberOfLines = 1;
		
		[self addSubview: self.label];
	}
	
	return self;
}

- (void) layoutSubviews;
{
    
    CGSize size = [_label sizeThatFits:CGSizeMake(self.bounds.size.width
                                               - RCUI_TABLEVIEW_SIMPLE_CELL_LEFT_MARGIN_PHONE, self.bounds.size.height)];
    
    CGPoint point = CGPointMake (RCUI_TABLEVIEW_SIMPLE_CELL_LEFT_MARGIN_PHONE, (self.bounds.size.height - size.height) / 2.f);
    
    self.label.frame = CGRectMake (point.x, point.y, self.bounds.size.width - RCUI_TABLEVIEW_SIMPLE_CELL_LEFT_MARGIN_PHONE * 2, size.height);
}

- (void) dealloc;
{
	self.label = nil;
	
    [super dealloc];
}

@end
