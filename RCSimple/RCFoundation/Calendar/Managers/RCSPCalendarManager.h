//
//  RCSPCalendarManager.h
//  RCSPFoundation
//
//  Created by John Wu on 4/14/16.
//
//

#import "RCNSStringImpBody.h"
#import <EventKit/EKEventStore.h>
#import <EventKit/EKSource.h>
#import <EventKit/EKEvent.h>
#import <EventKit/EKCalendar.h>

RC_DECL_STRING (RCSPSelectCalendarChangedNotification);

@class RCSPEvent;
@class RCSPTimePeriod;

@interface RCSPCalendarManager : NSObject
@property (nonatomic, retain, readonly) EKEventStore *eventStore;
@property (nonatomic, assign, readonly) BOOL isPermissionGranted;
@property (nonatomic, assign, readonly) EKAuthorizationStatus authorizationStatus;
@property (nonatomic, assign, readonly) EKEntityType type;

+ (instancetype) sharedManager;

#pragma mark - Mailbox biding
- (void) bindMailBoxID: (NSString *)mailboxID;
- (void) cleanMailBoxID;
- (BOOL) isUserBinded;

#pragma mark - Request for permission
- (void) requestPermission: (void (^)(BOOL granted))completion;


//- (void) refreshCalendars;


#pragma mark - Data request
- (NSArray <EKSource *> *) allSources;
- (BOOL) isAllCalendarsHidden;

- (RCSPEvent *) fetchEventByID: (NSString *)identifier;

//sync way to fetch events by given info
- (NSArray <RCSPEvent *> *) fetchEventsForDate: (NSDate *)date
                                      isSorted: (BOOL)sorted;

- (NSArray <RCSPEvent *> *) fetchEventsFromDate: (NSDate *)startDate
                                         toDate: (NSDate *)endDate
                                       isSorted: (BOOL)sorted;

//async way to fetch events by given info
- (void) fetchEventsForDate: (NSDate *)date
                   isSorted: (BOOL)sorted
                 completion: (void (^)(NSArray <RCSPEvent *> *sortedEvents))completion;

- (void) fetchEventsFromDate: (NSDate *)startDate
                      toDate: (NSDate *)endDate
                    isSorted: (BOOL)sorted
                  completion: (void (^)(NSArray <RCSPEvent *> *sortedEvents))completion;


#pragma mark - Free Time Calulation
- (NSArray <RCSPTimePeriod *> *) calculateFreeTime: (NSArray <RCSPEvent *> *)events forDate: (NSDate *)date;

@end
