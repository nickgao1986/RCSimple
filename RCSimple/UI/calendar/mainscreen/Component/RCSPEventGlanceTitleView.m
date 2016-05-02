//
//  RCSPEventGlanceTitleView.m
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/19/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCSPEventGlanceTitleView.h"
#import "RCSPCalendarComponentFactory.h"

#define ICON_WIDTH      30
#define ICON_GAP        4

@interface RCSPEventGlanceTitleView()
@property (nonatomic, assign) RCSPEventIconType type;
@property (nonatomic, assign) UILabel *titleLabel;
@property (nonatomic, assign) UIImageView *icon;
@property (nonatomic, retain) NSString *title;
@end

@implementation RCSPEventGlanceTitleView

- (instancetype) initWithFrame: (CGRect)frame;
{
    if (self = [super initWithFrame: frame])
    {
        [self initSubViews];
    }
    return self;
}

- (void) dealloc;
{
    self.title = nil;
    [super dealloc];
}

- (void) initSubViews;
{
    [self initTitleLabel];
    [self initRightIcon];
}

- (void) initTitleLabel;
{
    CGSize size = self.frame.size;
    CGRect frame = CGRectMake(0, 0, size.width - ICON_WIDTH - ICON_GAP, size.height);
    UILabel *label = [RCSPCalendarComponentFactory labelForEventCellGlanceTitle: frame];
    [self addSubview: label];
    self.titleLabel = label;
}

- (void) initRightIcon;
{
    CGSize size = self.frame.size;
    CGRect frame = CGRectMake(size.width - ICON_WIDTH, 0, ICON_WIDTH, size.height);
    UIImageView *icon = [[[UIImageView alloc] initWithFrame: frame] autorelease];
    icon.contentMode = UIViewContentModeCenter;
    [self addSubview: icon];
    self.icon = icon;
}

- (void) updateTitle: (NSString *)title andType: (RCSPEventIconType)type;
{
    self.title = title;
    self.type = type;
    self.titleLabel.text = title;
    self.icon.hidden = type == RCSPEventIconTypeNone;
    self.icon.image = [self iconImageForType: type];
}

- (UIImage *) iconImageForType: (RCSPEventIconType)type;
{
    switch (type) {
        case RCSPEventIconTypeVideo:
            return [RCSPCalendarComponentFactory imageForEventCellVideo];
        case RCSPEventIconTypeCall:
            return [RCSPCalendarComponentFactory imageForEventCellCall];
        case RCSPEventIconTypeLocation:
            return [RCSPCalendarComponentFactory imageForEventCellLocation];
        default:
            return nil;
    }
}

- (void) layoutSubviews;
{
    [super layoutSubviews];
    CGSize size = self.frame.size;
    self.titleLabel.frame = CGRectMake(0, 0, size.width - ICON_WIDTH - ICON_GAP, size.height);
    self.icon.frame = CGRectMake(size.width - ICON_WIDTH, 0, ICON_WIDTH, size.height);
}

- (void) setViewEnabled: (BOOL)enabled;
{
    UIColor *color = enabled ? [RCSPCalendarComponentFactory darkGrayColor] : [RCSPCalendarComponentFactory lightGrayColor];
    self.titleLabel.textColor = color;
}

@end
