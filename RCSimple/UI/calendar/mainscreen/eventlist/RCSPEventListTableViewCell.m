//
//  RCSPEventListTableViewCell.m
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/15/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCSPEventListTableViewCell.h"
#import "RCSPEventListItem.h"
#import "RCSPCalendarComponentFactory.h"
#import "RCSPEventGlanceView.h"
#import "RCUIThemeStyleHeader.h"


#define LEFT_PANEL_WIDTH    56
#define TOP_GAP             4
#define RIGHT_GAP           6
#define SHADOW_GAP          4

@interface RCSPEventListTableViewCell()
@property (nonatomic, assign) UIView *leftPanel;
@property (nonatomic, assign) UIView *rightPanel;
@property (nonatomic, assign) UILabel *startTimeLabel;
@property (nonatomic, assign) RCSPEventGlanceView *glanceView;
@property (nonatomic, assign) UIImageView *backgroundImage;
@property (nonatomic, retain) RCSPEvent *event;
@end

@implementation RCSPEventListTableViewCell
- (id) initWithStyle: (UITableViewCellStyle)style reuseIdentifier: (NSString *)reuseIdentifier;
{
    self = [super initWithStyle: UITableViewCellStyleDefault reuseIdentifier: reuseIdentifier];
    
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubViews];
    }
    
    return self;
}

- (void) dealloc;
{
    self.event = nil;
    [super dealloc];
}

+ (CGFloat) tableView: (UITableView *)tableView rowHeightForObject: (id)object;
{
    if (object && [object isKindOfClass: [RCSPEventListItem class]])
    {
        RCSPEvent *event = ((RCSPEventListItem *)object).event;
        CGFloat height = [RCSPEventGlanceView heightForEvent: event] + TOP_GAP * 2;
        return height;
    }
    return 0;
}

- (void) initSubViews;
{
    [self initLeftPanel];
    [self initRightPanel];
    [self initBackgroundImage];
    [self initStartTimeLabel];
    [self initEventGlanceView];
}

- (void) initLeftPanel;
{
    CGFloat height = self.frame.size.height;
    CGRect frame = CGRectMake(0, 0, LEFT_PANEL_WIDTH, height);
    UIView *view = [[[UIView alloc] initWithFrame: frame] autorelease];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//    view.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:0.5];
    [self addSubview: view];
    self.leftPanel = view;
}

- (void) initRightPanel;
{
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width - LEFT_PANEL_WIDTH;
    CGRect frame = CGRectMake(LEFT_PANEL_WIDTH, 0, width, height);
    UIView *view = [[[UIView alloc] initWithFrame: frame] autorelease];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    view.backgroundColor = [UIColor colorWithRed:1 green:1 blue:0 alpha:0.5];
    [self addSubview: view];
    self.rightPanel = view;
}

- (void) initBackgroundImage;
{
    CGSize rightPanelSize = self.rightPanel.frame.size;
    CGFloat offsetX = RIGHT_GAP - SHADOW_GAP;
    CGRect frame = CGRectMake(offsetX, 0, rightPanelSize.width - offsetX * 2, rightPanelSize.height);
    UIImageView *imageView = [[[UIImageView alloc] initWithFrame: frame] autorelease];
//    imageView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent: 0.5];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    UIImage *normalImage = [UIImage imageNamed: @"Calendar_Cell_Background"];
    CGFloat gap = 8;
    UIImage *strechedImage = [normalImage resizableImageWithCapInsets: UIEdgeInsetsMake(gap, gap, gap, gap)];
    imageView.image = strechedImage;
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.rightPanel addSubview: imageView];
    self.backgroundImage = imageView;
}

- (void) initStartTimeLabel;
{
    CGRect frame = CGRectMake(0, TOP_GAP, LEFT_PANEL_WIDTH, 14);
    UILabel *startTimeLabel = [RCSPCalendarComponentFactory labelForEventCellStartTime: frame];    
//    startTimeLabel.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    [self.leftPanel addSubview: startTimeLabel];
    self.startTimeLabel = startTimeLabel;
}

- (void) initEventGlanceView;
{
    CGFloat height = self.rightPanel.frame.size.height - TOP_GAP * 2;
    CGFloat width = self.rightPanel.frame.size.width - RIGHT_GAP * 2;
    CGRect frame = CGRectMake(RIGHT_GAP, TOP_GAP, width, height);
    RCSPEventGlanceView *glanceView = [[[RCSPEventGlanceView alloc] initWithFrame: frame] autorelease];
    glanceView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    glanceView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.5];
    [self.rightPanel addSubview: glanceView];
    self.glanceView = glanceView;
}

- (void) setObject: (id)object;
{
    if (_object != object)
    {
        [_object release];
        _object = [object retain];
        
        RCSPEventListItem *item = (RCSPEventListItem *)object;
        [self updateViewWithEvent: item.event];
    }
}

- (void) updateViewWithEvent: (RCSPEvent *)event;
{
    self.event = event;
    [self updateStartTimeLabel: event];
    [self.glanceView updateViewWithEvent: event];
}

- (void) updateStartTimeLabel: (RCSPEvent *)event;
{
    if (event.isAllDay)
    {
        self.startTimeLabel.text = @"ALL DAY";
    }
    else
    {
        NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
        //todo this is will not show am/pm if device is set to 24h time format
        formatter.dateFormat = @"hh:mm a";
        self.startTimeLabel.text = [formatter stringFromDate: event.startTime];
    }
}

@end
