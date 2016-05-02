//
//  RCSPEvent.m
//  RCSPFoundation
//
//  Created by John Wu on 4/14/16.
//
//

#import "RCSPEvent.h"
#import "EKEvent+RCUtil.h"
#import <EventKit/EKCalendar.h>

#define HALF_HOUR    1800

@interface RCSPEvent ()
@property (nonatomic, assign) RCSPEventType type;
@property (nonatomic, assign) BOOL isAllDay;
@property (nonatomic, assign) BOOL isCurentHourEvent;
@property (nonatomic, assign) BOOL isCurentUserAccepted;
@property (nonatomic, retain) EKEvent *event;
@property (nonatomic, retain) NSArray <RCSPEventAction *> *actions;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *location;
@property (nonatomic, retain) NSString *notes;
@property (nonatomic, retain) NSDate *startTime;
@property (nonatomic, retain) NSDate *endTime;
@property (nonatomic, retain) UIColor *sourceColor;
@end

@implementation RCSPEvent

+ (instancetype) testEventWithEndDate: (NSDate *)endDate;
{
    RCSPEvent *event = [[[RCSPEvent alloc] init] autorelease];
    event.type = RCSPEventTypeCalendar;
    event.title = @"Active Direct Meeting";
    event.location = @"A test location in XMN";
    event.startTime = [NSDate new];
    event.endTime = endDate;
    event.sourceColor = [UIColor blueColor];
    return event;
}

- (void) testSetAllDayEvent;
{
    self.isAllDay = YES;
    self.iconType = RCSPEventIconTypeNone;
}

- (instancetype) initCalendarEventWithEvnet: (EKEvent *)event;
{
    if (self = [super init])
    {
        self.type = RCSPEventTypeCalendar;
        [self updateWithEvent: event];
    }
    return self;
}

- (void) updateWithEvent: (EKEvent *)event;
{
    self.event = event;
    self.isAllDay = event.isAllDay;
    self.title = event.title;
    self.sourceColor = [UIColor colorWithCGColor: event.calendar.CGColor];
    self.startTime = event.startDate;
    self.endTime = event.endDate;
    self.location = event.location;
    self.notes = event.notes;
    self.isCurentHourEvent = [self updateCurentHourEvent];
    self.isCurentUserAccepted = [self updateCurrentUserAccepted];
    //todo update icon according to event
    self.iconType = (RCSPEventIconType)(random() % 4);
}

- (EKEvent *) getEKEvent;
{
    return self.event;
}

- (BOOL) updateCurentHourEvent;
{
    BOOL result = NO;
    if (!self.isAllDay && self.startTime)
    {
        NSDate *now = [NSDate date];
        NSTimeInterval difference = fabs([self.startTime timeIntervalSinceDate: now]);
        if (difference <= HALF_HOUR)
        {
            result = YES;
        }
    }    
    return result;
}

- (BOOL) updateCurrentUserAccepted;
{
    EKParticipantStatus status = [self.event currentUserAcceptance];
    return status != EKParticipantStatusDeclined && status != EKParticipantStatusPending;
}

- (void) dealloc;
{
    self.event = nil;
    self.actions = nil;
    self.title = nil;
    self.location = nil;
    self.notes = nil;
    self.startTime = nil;
    self.endTime = nil;
    self.sourceColor = nil;
    [super dealloc];
}

@end
