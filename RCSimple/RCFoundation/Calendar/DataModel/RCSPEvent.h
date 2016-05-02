//
//  RCSPEvent.h
//  RCSPFoundation
//
//  Created by John Wu on 4/14/16.
//
//

#import <UIKit/UIColor.h>
#import <EventKit/EKEvent.h>

typedef NS_ENUM (NSInteger, RCSPEventType)
{
    RCSPEventTypeRCMeeting,
    RCSPEventTypeAudioConference,
    RCSPEventTypeCalendar,
};

typedef NS_ENUM (NSInteger, RCSPEventIconType)
{
    RCSPEventIconTypeNone,
    RCSPEventIconTypeVideo,
    RCSPEventIconTypeCall,
    RCSPEventIconTypeLocation,
};

@class RCSPEventAction;

@interface RCSPEvent : NSObject
@property (nonatomic, assign) RCSPEventIconType iconType;
@property (nonatomic, assign, readonly) RCSPEventType type;
@property (nonatomic, assign, readonly) BOOL isAllDay;
@property (nonatomic, assign, readonly) BOOL isCurentHourEvent;
@property (nonatomic, assign, readonly) BOOL isCurentUserAccepted;
@property (nonatomic, retain, readonly) NSArray <RCSPEventAction *> *actions;
@property (nonatomic, retain, readonly) NSString *title;
@property (nonatomic, retain, readonly) NSString *location;
@property (nonatomic, retain, readonly) NSString *notes;
@property (nonatomic, retain, readonly) NSDate *startTime;
@property (nonatomic, retain, readonly) NSDate *endTime;
@property (nonatomic, retain, readonly) UIColor *sourceColor;

- (instancetype) initCalendarEventWithEvnet: (EKEvent *)event;
- (EKEvent *) getEKEvent;

+ (instancetype) testEventWithEndDate: (NSDate *)endDate;
- (void) testSetAllDayEvent;
@end
