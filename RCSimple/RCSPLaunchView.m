//
//  RCSPLaunchView.m
//  RCSimple
//
//  Created by Nick Gao on 4/30/16.
//  Copyright © 2016 nickgao. All rights reserved.
//

#import "RCSPLaunchView.h"
//#import "RCUIGlobalCommon.h”
//#import "RCUIGlobalStyle.h”
#import "RCUIThemeStyleDefined.h"
#import "UIImage+RCUIPathCategory.h"
#import "UIView+RCUIThemeStyle.h"
#import "RCExtern.h"
#import "RCUIThemeStyleManager.h"
#import "RCUIThemeStyle.h"

@implementation RCSPLaunchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id) initWithFrame: (CGRect)frame buttonTitle: (NSString*)title;
{
    self = [super initWithFrame: frame];
    
    if (self)
    {
        [self loadLaunchButton: title];
        [self loadLabel];
        [self loadDetailLabel];
        [self loadImageView];
    }
    
    return self;
}

- (id) initWithFrame: (CGRect)frame;
{
    return [self initWithFrame: frame buttonTitle: @""];
}

- (void) loadLabel;
{
    self.label = [[[UILabel alloc] init] autorelease];
    [self.label uiApplyThemeStyle: [RCUI_THEME_STYLE () labelThemeWithStyleName: @"rc.meeting.label.title"]];
    [self addSubview: self.label];
    self.label.numberOfLines = 0;
    self.label.textAlignment = NSTextAlignmentCenter;
}

- (void) loadDetailLabel;
{
    self.detailLabel = [[[UILabel alloc] init] autorelease];
    [self.detailLabel uiApplyThemeStyle: [RCUI_THEME_STYLE () labelThemeWithStyleName: @"rc.meeting.label.title"]];
    [self addSubview: self.detailLabel];
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.textAlignment = NSTextAlignmentCenter;
}

- (void) loadImageView;
{
    UIImage *image = nil;
    self.imageView = [[[UIImageView alloc] initWithImage: image] autorelease];
    [self addSubview: self.imageView];
}

- (void) loadLaunchButton: (NSString*)title;
{
    self.launchButton = [UIButton buttonWithType: UIButtonTypeCustom];
//    [self.launchButton uiApplyiOS7ThemeStyle: [RCUI_THEME_STYLE () buttonThemeWithStyleName: RCMeetingButtonJoin] radius: RCUI_TABLEVIEW_CELL_RADIUS];
  //  self.launchButton.titleLabel.font = RCUIMediumSystemFont(20);
    [self.launchButton setTitle: title forState: UIControlStateNormal];
    [self.launchButton setTitle: title forState: UIControlStateHighlighted];
    [self.launchButton addTarget: self action: @selector (launchAction:) forControlEvents: UIControlEventTouchUpInside];
    [self addSubview: self.launchButton];
}

- (void) launchAction: (id)sender;
{
    if ([self.delegate respondsToSelector: @selector(launchViewLaunchButtonClicked:)])
    {
        [self.delegate launchViewLaunchButtonClicked: self];
    }
}

#define kDefaultTextHLMargin            16
#define kDefaultButtonHeight            51
#define kDefaultButtonVBMargin          kDefaultTextHLMargin
#define kVerticalGap                    45
#define kHorizontalGap                  29

- (void) layoutSubviews;
{
    [super layoutSubviews];
    
    CGRect buttonFrame = CGRectMake (kDefaultTextHLMargin, CGRectGetHeight (self.bounds) - kDefaultButtonHeight - kDefaultButtonVBMargin,
                                     CGRectGetWidth (self.bounds) -  2 * kDefaultTextHLMargin, kDefaultButtonHeight);
    self.launchButton.frame = buttonFrame;
    
    CGSize labeSize = [self.label sizeThatFits: CGSizeMake (self.bounds.size.width - kHorizontalGap * 2., 1000)];
    [self.imageView sizeToFit];
    
    CGRect imageViewFrame = self.imageView.frame;
    
    CGFloat vh = labeSize.height + kVerticalGap + imageViewFrame.size.height;
    CGFloat topMargin = (CGRectGetMinY(self.launchButton.frame) - vh) / 2.0;
    
    self.imageView.frame = CGRectMake ((self.bounds.size.width - imageViewFrame.size.width) / 2., topMargin, imageViewFrame.size.width, imageViewFrame.size.height);
    self.label.frame = CGRectMake((self.bounds.size.width - labeSize.width) / 2., CGRectGetMaxY(self.imageView.frame) + kVerticalGap, labeSize.width, labeSize.height);
    
    CGSize detailLabeSize = [self.detailLabel sizeThatFits: CGSizeMake (self.bounds.size.width - kHorizontalGap * 2., 1000)];
    self.detailLabel.frame = CGRectMake((self.bounds.size.width - detailLabeSize.width) / 2, self.label.frame.origin.y + self.label.frame.size.height + 5, detailLabeSize.width, detailLabeSize.height);
}

- (void) dealloc;
{
    self.launchButton = nil;
    self.label = nil;
    self.detailLabel = nil;
    self.imageView = nil;
    self.delegate = nil;
    
    [super dealloc];
}


@end
