//
//  RCSPCalendarManager.m
//  RCSPFoundation
//
//  Created by John Wu on 4/14/16.
//
//

#import "RCSPCalendarManager.h"
#import "NSDate+RCCalendarUtil.h"
#import "RCSPEvent.h"
#import "RCSPTimePeriod.h"
//#import <RCSPFoundation/RCSPAccountPropertyList.h>

RC_DEF_STRING (RCSPSelectCalendarChangedNotification);

@interface RCSPCalendarManager ()
@property (nonatomic, retain) EKEventStore *eventStore;
@property (nonatomic, retain) NSString *mailBoxID;
@property (nonatomic, assign) EKEntityType type;
@property (nonatomic, assign) BOOL isPermissionGranted;
@property (nonatomic, assign) EKAuthorizationStatus authorizationStatus;

@end

@implementation RCSPCalendarManager

+ (instancetype) sharedManager;
{
    static dispatch_once_t once;
    static RCSPCalendarManager *sharedManager = nil;
    dispatch_once (&once, ^
                   {
                       sharedManager = [[RCSPCalendarManager alloc] init];
                   });
    return sharedManager;
}

#pragma mark - Initialization
- (instancetype) init;
{
    if (self = [super init])
    {
        self.eventStore = [EKEventStore new];
        self.type = EKEntityTypeEvent;
        [self addListener];
    }
    return self;
}

- (void) dealloc;
{
    self.eventStore = nil;
    self.mailBoxID = nil;
    [super dealloc];
}

- (EKAuthorizationStatus) authorizationStatus
{
    return [EKEventStore authorizationStatusForEntityType: self.type];
}

- (BOOL) isPermissionGranted
{
    return ([EKEventStore authorizationStatusForEntityType: self.type] == EKAuthorizationStatusAuthorized);
}

#pragma mark - Change Notificaion
- (void) addListener;
{
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(storeChanged:)
                                                 name: EKEventStoreChangedNotification
                                               object: nil];
}

- (void) storeChanged: (NSNotification *)notification;
{
    //todo do modification according to change notification
    NSLog(@"==== storeChanged: %@", notification);    
}

#pragma mark - Mailbox biding
- (void) bindMailBoxID: (NSString *)mailboxID;
{
    self.mailBoxID = mailboxID;
}

- (void) cleanMailBoxID;
{
    self.mailBoxID = nil;
}

- (BOOL) isUserBinded;
{
    return self.mailBoxID != nil;
}

#pragma mark - Request for permission
- (void) requestPermission: (void (^)(BOOL granted))completion;
{
    EKAuthorizationStatus authorizationStatus = [EKEventStore authorizationStatusForEntityType: self.type];
    switch (authorizationStatus) {
        case EKAuthorizationStatusDenied:
        case EKAuthorizationStatusRestricted: {
            [self handleRequestCompletion: completion result: NO];
            break;
        }
        case EKAuthorizationStatusAuthorized:
            [self handleRequestCompletion: completion result: YES];
            break;
        case EKAuthorizationStatusNotDetermined: {
            [self requestAccess: completion];
            break;
        }
    }
}

- (void) requestAccess: (void (^)(BOOL granted))completion;
{
    __block RCSPCalendarManager *weakSelf = self;
    [self.eventStore requestAccessToEntityType: self.type
                                    completion: ^(BOOL granted, NSError *error) {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            if (weakSelf)
                                            {
                                                [weakSelf handleRequestCompletion: completion result: granted];
                                            }
                                        });
                                    }];
    
}

- (void) handleRequestCompletion: (void (^)(BOOL granted))completion result: (BOOL) result;
{
    self.isPermissionGranted = result;
    if (completion)
    {
        completion(result);
    }
}

#pragma mark - Data request
- (NSArray <EKSource *> *) allSources;
{
    // based on settings;
    if ([self isUserBinded] && self.isPermissionGranted)
    {
        return self.eventStore.sources;
    }
    return nil;
}

- (BOOL) isAllCalendarsHidden;
{
    BOOL isAllHidden = NO;
    NSArray <EKCalendar *> *calArr = [self availabelCalendars];
    isAllHidden = calArr.count > 0 ? NO : YES;
    return isAllHidden;
}

- (RCSPEvent *) fetchEventByID: (NSString *)identifier;
{
    if ([self isUserBinded] && self.isPermissionGranted)
    {
        EKEvent *event = [self.eventStore eventWithIdentifier: identifier];
        RCSPEvent *newEvent = [[[RCSPEvent alloc] initCalendarEventWithEvnet: event] autorelease];
        return newEvent;
    }
    return nil;
}

- (NSArray <RCSPEvent *> *) fetchEventsForDate: (NSDate *)date
                                      isSorted: (BOOL)sorted;
{
    return [self fetchEventsFromDate: [date startOfDay] toDate: [date endOfDay] isSorted: sorted];
}

- (NSArray <RCSPEvent *> *) fetchEventsFromDate: (NSDate *)startDate
                                         toDate: (NSDate *)endDate
                                       isSorted: (BOOL)sorted;
{
    if ([self isUserBinded] && self.isPermissionGranted)
    {
        NSArray <EKEvent *> *events = [self eventFromDate: startDate toDate: endDate];
        if (sorted)
        {
            events = [self sortEvents: events];
        }
        NSArray <RCSPEvent *> *convertedEvents = [self convertEvent: events];
        return convertedEvents;
    }
    else
    {
        return nil;
    }
}

- (void) fetchEventsForDate: (NSDate *)date
                   isSorted: (BOOL)sorted
                 completion: (void (^)(NSArray <RCSPEvent *> *sortedEvents))completion;
{
    [self fetchEventsFromDate: [date startOfDay] toDate: [date endOfDay] isSorted: sorted completion: completion];
}

- (void) fetchEventsFromDate: (NSDate *)startDate
                      toDate: (NSDate *)endDate
                    isSorted: (BOOL)sorted
                  completion: (void (^)(NSArray <RCSPEvent *> *sortedEvents))completion;
{
    if ([self isUserBinded] && self.isPermissionGranted)
    {
        dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(globalQueue, ^{
            NSArray <RCSPEvent *> *convertedEvents = [self fetchEventsFromDate: startDate toDate: endDate isSorted: YES];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (completion)
                {
                    completion(convertedEvents);
                }
            });
        });
    }
    else
    {
        if (completion)
        {
            completion(nil);
        }
    }
}

- (NSArray <EKCalendar *> *) availabelCalendars;
{
    NSMutableArray <EKCalendar *> *calArr = [NSMutableArray new];
    
//    NSArray *uncheckedArr = [RCSPAccountPropertyList selectCalendarUncheckedIdentifiers];
//    if (!uncheckedArr.count)
//    {
//        return nil;
//    }
    
    NSArray <EKSource *> *allSources = [self allSources];
    for (NSUInteger i = 0; i < allSources.count; i ++)
    {
        EKSource *aSource = allSources[i];
        NSSet<EKCalendar *> *calendarsSet = [aSource calendarsForEntityType: [RCSPCalendarManager sharedManager].type];
        if (calendarsSet.count == 0)
        {
            continue;
        }
        
        NSArray<EKCalendar *> *calendarsArr = [calendarsSet allObjects];
        
        for (NSUInteger j = 0; j < calendarsArr.count; j ++)
        {
            EKCalendar *aCalendar = calendarsArr[j];
//            if (![uncheckedArr containsObject: aCalendar.calendarIdentifier])
//            {
//                [calArr addObject: aCalendar];
//            }
            [calArr addObject:aCalendar];
        }
    }
    
    return calArr;
}

- (NSArray <EKEvent *> *) eventFromDate: (NSDate *)start toDate: (NSDate *)end;
{
    NSDate *startDate = [start startOfDay];
    NSDate *endDate = [end endOfDay];
    
    NSPredicate *predicate = [self.eventStore predicateForEventsWithStartDate: startDate
                                                                      endDate: endDate
                                                                    calendars: [self availabelCalendars]];
    NSMutableArray *allEvents = [NSMutableArray array];
    [self.eventStore enumerateEventsMatchingPredicate: predicate usingBlock:^(EKEvent * _Nonnull event, BOOL * _Nonnull stop) {
        [allEvents addObject: event];
    }];
    return allEvents;
}

- (NSArray <EKEvent *> *) sortEvents: (NSArray <EKEvent *> *)events;
{
    NSMutableArray <EKEvent *>*result = [events mutableCopy];
    [result sortUsingSelector: @selector(compareStartDateWithEvent:)];
    return result;
}

- (NSArray <RCSPEvent *> *) convertEvent: (NSArray <EKEvent *> *)events;
{
    if (events && events.count > 0)
    {
        NSMutableArray *newList = [NSMutableArray arrayWithCapacity: events.count];
        for (EKEvent *event in events)
        {
            RCSPEvent *newEvent = [[[RCSPEvent alloc] initCalendarEventWithEvnet: event] autorelease];
            if (newEvent)
            {
                [newList addObject: newEvent];
            }
        }
        return newList;
    }
    return nil;
}

#pragma mark - Free Time Calulation
- (NSArray <RCSPTimePeriod *> *) calculateFreeTime: (NSArray <RCSPEvent *> *)events forDate: (NSDate *)date;
{
    NSMutableArray <RCSPTimePeriod *> *result = [NSMutableArray array];
    NSMutableArray <RCSPTimePeriod *> *allNormalTimePeriod = [NSMutableArray array];
    for (RCSPEvent *event in events)
    {
        if (!event.isAllDay)
        {
            RCSPTimePeriod *timePeriod = [[[RCSPTimePeriod alloc] init] autorelease];
            timePeriod.startTime = event.startTime;
            timePeriod.endTime = event.endTime;
            [allNormalTimePeriod addObject: timePeriod];
        }
    }
    if ([allNormalTimePeriod count] > 0)
    {
        RCSPTimePeriod *allDay = [RCSPTimePeriod periodForDate: date];
        [result addObject: allDay];
        while ([allNormalTimePeriod count] > 0)
        {
            RCSPTimePeriod *target = [allNormalTimePeriod firstObject];
            NSMutableArray <RCSPTimePeriod *> * removedList = [self removeTimePeriod: target fromTimeList: result];
            result = removedList;
            [allNormalTimePeriod removeObject: target];
        }
    }    
    return result;
}

- (NSMutableArray <RCSPTimePeriod *> *) removeTimePeriod: (RCSPTimePeriod *)timePeriod fromTimeList: (NSArray <RCSPTimePeriod *> *)timePeriodList;
{
    NSMutableArray <RCSPTimePeriod *> *result = [NSMutableArray arrayWithArray: timePeriodList];
    for (RCSPTimePeriod *period in timePeriodList)
    {
        NSArray <RCSPTimePeriod *> *newPeriodList = [period removeTimePeriod: timePeriod];
        if (newPeriodList)
        {
            NSUInteger index = [result indexOfObject: period];
            for (RCSPTimePeriod *newPeriod in newPeriodList)
            {
                [result insertObject: newPeriod atIndex: index];
                index++;
            }
            [result removeObject: period];
            return result;
        }
    }
    return result;
}
@end
