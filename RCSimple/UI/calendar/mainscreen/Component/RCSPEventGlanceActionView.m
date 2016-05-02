//
//  RCSPEventGlanceActionView.m
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/19/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCSPEventGlanceActionView.h"
#import "RCSPCalendarComponentFactory.h"
#import "UIImage+RCUIPathCategory.h"
#import "RCUIThemeStyleHeader.h"

@interface RCSPEventGlanceActionView()
@property (nonatomic, retain) RCSPEventAction *action;
@property (nonnull, assign) UIButton *button;
@end

@implementation RCSPEventGlanceActionView
- (instancetype) initWithFrame: (CGRect)frame;
{
    if (self = [super initWithFrame: frame])
    {
        self.layer.cornerRadius = self.frame.size.height / 2;
        self.clipsToBounds = YES;
        [self initSubViews];
    }
    return self;
}

- (void) dealloc;
{
    self.action = nil;
    [super dealloc];
}

- (void) initSubViews;
{
    [self initButton];
}

- (void) initButton;
{
    CGSize size = self.frame.size;
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    UIButton *button = [RCSPCalendarComponentFactory buttonForEventCellGlanceAction: frame];
    [button addTarget: self action: @selector(onButton:) forControlEvents: UIControlEventTouchUpInside];
    [self addSubview: button];
    self.button = button;
}

- (void) updateView: (RCSPEventAction *)action;
{
    self.action = action;
    [self.button setTitle: action.actionName forState: UIControlStateNormal];
    [self.button setTitle: action.actionName forState: UIControlStateHighlighted];
    if (action.type == RCSPEventActionTypeJoin)
    {
        [self.button uiApplyThemeStyle: [RCUI_THEME_STYLE() buttonThemeWithStyleName: RCCalendarGlancePrimaryButton]];
    }
    else
    {
        [self.button uiApplyThemeStyle: [RCUI_THEME_STYLE() buttonThemeWithStyleName: RCCalendarGlanceSecondaryButton]];
    }
}

- (void) onButton: (id)sender;
{
    NSLog(@"onButton");
}
@end
