//
//  RCSPEventGlanceView.m
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/19/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCSPEventGlanceView.h"
#import "RCSPEventGlanceTitleView.h"
#import "RCSPEventGlanceActionView.h"
#import "RCSPEventBackgroundButton.h"
#import "RCSPCalendarComponentFactory.h"
#import "RCSPCalendarUIDefines.h"
#import "RCSPEvent.h"
#import "RCUIThemeStyleHeader.h"
#import "NSString+RCStringEmpty.h"

#define COLOR_VIEW_WIDTH    3
#define TOP_GAP             10
#define LEFT_GAP            12
#define RIGHT_GAP           7
#define TITLE_HEIGHT        20
#define DETAIL_HEIGHT       12
#define ACTION_WIDTH        62
#define ACTION_HEIGHT       25
#define ACTION_GAP          10
#define ACTION_UP_SPACE     2

@interface RCSPEventGlanceView() <RCSPEventBackgroundButtonDelegate>
@property (nonatomic, assign) BOOL isEventEnabled;
@property (nonatomic, assign) UIView *colorView;
@property (nonatomic, assign) UIView *rightPanel;
@property (nonatomic, assign) RCSPEventGlanceTitleView *glanceTitle;
@property (nonatomic, assign) UILabel *detail1;
@property (nonatomic, assign) UILabel *detail2;
@property (nonatomic, assign) RCSPEventBackgroundButton *button;
@property (nonatomic, assign) RCSPEventGlanceActionView *action1;
@property (nonatomic, assign) RCSPEventGlanceActionView *action2;
@property (nonatomic, retain) RCSPEvent *event;
@end

@implementation RCSPEventGlanceView

- (instancetype) initWithFrame: (CGRect)frame;
{
    if (self = [super initWithFrame: frame])
    {
        self.layer.cornerRadius     = COLOR_VIEW_WIDTH;
        self.layer.masksToBounds    = YES;
        self.clipsToBounds          = YES;
        self.backgroundColor        = [UIColor clearColor];
        
        [self initSubViews];
    }
    return self;
}

- (void) dealloc;
{
    self.event = nil;
    [super dealloc];
}

+ (CGFloat) heightForEvent: (RCSPEvent *)event;
{
    if (event.isAllDay)
    {
        return TITLE_HEIGHT + TOP_GAP * 2;
    }
    else if (event.isCurentHourEvent)
    {
        return TITLE_HEIGHT + TOP_GAP * 2 + DETAIL_HEIGHT * 2 + ACTION_HEIGHT + ACTION_UP_SPACE;
    }
    return TITLE_HEIGHT + TOP_GAP * 2 + DETAIL_HEIGHT * 2;
}

- (void) initSubViews;
{
    [self initColorView];
    [self initRightPanel];
    [self initTitleView];
    [self initDetailView1];
    [self initDetailView2];
    [self initButton];
    [self initActionView1];
    [self initActionView2];
}

- (void) initColorView;
{
    CGFloat height  = self.frame.size.height;
    CGRect frame    = CGRectMake(0, 0, COLOR_VIEW_WIDTH, height);
    UIView *view    = [[[UIView alloc] initWithFrame: frame] autorelease];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self addSubview: view];
    self.colorView = view;
}

- (void) initRightPanel;
{
    CGFloat height  = self.frame.size.height;
    CGFloat width   = self.frame.size.width - COLOR_VIEW_WIDTH;
    CGRect frame    = CGRectMake(COLOR_VIEW_WIDTH, 0, width, height);
    UIView *view    = [[[UIView alloc] initWithFrame: frame] autorelease];
    view.autoresizingMask       = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    view.backgroundColor        = [UIColor clearColor];
    [self addSubview: view];
    self.rightPanel = view;
}

- (void) initTitleView;
{
    CGFloat height  = TITLE_HEIGHT;
    CGFloat width   = self.rightPanel.frame.size.width - LEFT_GAP - RIGHT_GAP;
    CGRect frame    = CGRectMake(LEFT_GAP, TOP_GAP, width, height);
    RCSPEventGlanceTitleView *title = [[[RCSPEventGlanceTitleView alloc] initWithFrame: frame] autorelease];
    title.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.rightPanel addSubview: title];
    self.glanceTitle = title;
}

- (void) initDetailView1;
{
    CGFloat height  = DETAIL_HEIGHT;
    CGFloat width   = self.rightPanel.frame.size.width - LEFT_GAP - RIGHT_GAP;
    CGRect frame    = CGRectMake(LEFT_GAP, CGRectGetMaxY(self.glanceTitle.frame), width, height);
    UILabel *detail = [RCSPCalendarComponentFactory labelForEventCellGlanceDetail: frame];
    [self.rightPanel addSubview: detail];
    self.detail1 = detail;
}

- (void) initDetailView2;
{
    CGFloat height  = DETAIL_HEIGHT;
    CGFloat width   = self.rightPanel.frame.size.width - LEFT_GAP - RIGHT_GAP;
    CGRect frame    = CGRectMake(LEFT_GAP, CGRectGetMaxY(self.detail1.frame), width, height);
    UILabel *detail = [RCSPCalendarComponentFactory labelForEventCellGlanceDetail: frame];
    [self.rightPanel addSubview: detail];
    self.detail2 = detail;
}

- (void) initButton;
{
    CGFloat height  = self.rightPanel.frame.size.height;
    CGFloat width   = self.rightPanel.frame.size.width;
    CGRect frame    = CGRectMake(0, 0, width, height);
    RCSPEventBackgroundButton *button = [[[RCSPEventBackgroundButton alloc] initWithFrame: frame] autorelease];
    button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [button addTarget: self action: @selector(onButtonPressed:) forControlEvents: UIControlEventTouchUpInside];
    
    UIImage *image = [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                          fillColor: [[RCSPCalendarComponentFactory lightGrayColor] colorWithAlphaComponent: 0.1]
                                        borderColor: nil
                                             radius: 0];

    [button setBackgroundImage: image forState: UIControlStateDisabled];
    button.buttonStateDelegate = self;
    [self.rightPanel addSubview: button];
    self.button = button;
}

- (void) initActionView1;
{
    CGFloat height  = ACTION_HEIGHT;
    CGFloat width   = ACTION_WIDTH;
    CGRect frame    = CGRectMake(CGRectGetMaxX(self.glanceTitle.frame) - width, self.rightPanel.frame.size.height - TOP_GAP - height, width, height);
    RCSPEventGlanceActionView *actionView = [[[RCSPEventGlanceActionView alloc] initWithFrame: frame] autorelease];
    
    [self.rightPanel addSubview: actionView];
    self.action1 = actionView;
    
    RCSPEventAction *action = [[[RCSPEventAction alloc] initWithType: RCSPEventActionTypeDailin] autorelease];
    [self.action1 updateView: action];
}

- (void) initActionView2;
{
    CGFloat height  = ACTION_HEIGHT;
    CGFloat width   = ACTION_WIDTH;
    CGRect frame    = CGRectMake(CGRectGetMinX(self.action1.frame) - width - ACTION_GAP, CGRectGetMinY(self.action1.frame), width, height);
    RCSPEventGlanceActionView *actionView = [[[RCSPEventGlanceActionView alloc] initWithFrame: frame] autorelease];
    
    [self.rightPanel addSubview: actionView];
    self.action2 = actionView;
    
    RCSPEventAction *action = [[[RCSPEventAction alloc] initWithType: RCSPEventActionTypeJoin] autorelease];
    [self.action2 updateView: action];
}

- (void) updateViewWithEvent: (RCSPEvent *)event;
{
    //todo
    //title, location, endtime, actions
    self.event = event;
    [self.glanceTitle updateTitle: event.title andType: event.iconType];
    
    BOOL isAllDayEvent = event.isAllDay;
    BOOL isCurrentHourEvent = event.isCurentHourEvent;
    self.detail1.hidden = isAllDayEvent;
    self.detail2.hidden = isAllDayEvent;
    self.action1.hidden = !isCurrentHourEvent;
    self.action2.hidden = !isCurrentHourEvent;
    if (!isAllDayEvent)
    {
        NSString *endsTime = [self endsTimeForEvent: event];
        if ([[event location] stringIsNotEmpty])
        {
            self.detail1.text = event.location;
            self.detail2.text = endsTime;
        }
        else
        {
            self.detail1.text = endsTime;
            self.detail2.text = nil;
        }
    }
    BOOL enableView = event.isCurentUserAccepted;
    //fix it
//    enableView = false;
    
    self.colorView.backgroundColor = enableView ? event.sourceColor : [event.sourceColor colorWithAlphaComponent: 0.4];
    [self setViewEnabled: enableView];
    
}

- (void) setViewEnabled: (BOOL)enabled;
{
    self.button.shouldGrayOut = !enabled;
    UIColor *color = enabled ? [RCSPCalendarComponentFactory darkGrayColor] : [RCSPCalendarComponentFactory lightGrayColor];
    self.detail1.textColor = color;
    self.detail2.textColor = color;
    [self.glanceTitle setViewEnabled: enabled];
}

- (NSString *) endsTimeForEvent: (RCSPEvent *)event;
{
    if ([event endTime] == nil)
    {
        return nil;
    }
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    //todo this is will not show am/pm if device is set to 24h time format
    formatter.dateFormat = @"hh:mm a";
    NSString *endsAt = @"Ends at";
    NSString *result = [NSString stringWithFormat: @"%@ %@", endsAt, [formatter stringFromDate: event.endTime]];
    return result;
}

- (void) layoutSubviews;
{
    [super layoutSubviews];
    CGFloat height  = ACTION_HEIGHT;
    CGFloat width   = ACTION_WIDTH;
    CGRect frame1   = CGRectMake(CGRectGetMaxX(self.glanceTitle.frame) - width, self.rightPanel.frame.size.height - TOP_GAP - height, width, height);
    CGRect frame2   = CGRectMake(CGRectGetMinX(frame1) - width - ACTION_GAP, CGRectGetMinY(frame1), width, height);
    
    self.action1.frame = frame1;
    self.action2.frame = frame2;
}

- (void) onButtonPressed: (id)sender;
{
    [[NSNotificationCenter defaultCenter] postNotificationName: RCSPCalendarEventCellTappedNotification object: self.event];
}

#pragma mark - RCSPEventBackgroundButtonDelegate
- (void) onButtonHighlightedStateChange: (BOOL)isHighlighted;
{
    if (isHighlighted)
    {
        self.rightPanel.backgroundColor = [RCSPCalendarComponentFactory highlightedBackgroundColor];
    }
    else
    {
        self.rightPanel.backgroundColor = [UIColor whiteColor];
    }
}

@end
