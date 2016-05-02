//
//  RCSPCalendarSyncManager.m
//  RCSPFoundation
//
//  Created by John Wu on 4/14/16.
//
//

#import "RCSPCalendarSyncManager.h"
//#import "RCVariableDeclarations.h"
#import "RCNSStringImpBody.h"
#import "RCSPEvent.h"
#import <EventKit/EKEventStore.h>
#import <UIKit/UIKit.h>


RC_DECL_STRING (RCSPLocalNotificationTypeCalendar);
RC_DECL_STRING (RCSPLocalNotificationTypeKey);

RC_DEF_STRING (RCSPLocalNotificationTypeCalendar);
RC_DEF_STRING (RCSPLocalNotificationTypeKey);


@implementation RCSPCalendarSyncManager

+ (void) refreshAllCalendarEvents;
{
//    NSLog(@"noti count old: %d", [UIApplication sharedApplication].scheduledLocalNotifications.count);

    // delete all scheduled calendar events notis
    NSArray<UILocalNotification *> *oldNotiArr = [[UIApplication sharedApplication] scheduledLocalNotifications];
    
    
    NSMutableArray* newNotiArr = [NSMutableArray arrayWithCapacity:0];
    [newNotiArr addObjectsFromArray:oldNotiArr];

//    RC_V (newNotiArr, RC_NEW (NSMutableArray));
//    [newNotiArr addObjectsFromArray:oldNotiArr];
    
    for (UILocalNotification *aNoti in oldNotiArr)
    {
        NSDictionary *userInfo = aNoti.userInfo;
        if ([userInfo[RCSPLocalNotificationTypeKey] isEqualToString:RCSPLocalNotificationTypeCalendar])
        {
            [newNotiArr removeObject:aNoti];
        }
    }

    // add new calendar events notis
//    RC_V (aDate, RC_NEW (NSDate));
    
    NSDate* aDate = [[NSDate alloc] init];
    
    for (NSInteger i = 0; i < 100; i ++)
    {
        NSDate *newDate = [NSDate dateWithTimeInterval:i*20 sinceDate:aDate];
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = newDate;
        localNotification.alertBody = [NSString stringWithFormat:@"Alert msg:%ld", (long)(i+1)];
        localNotification.userInfo = @{
                                       RCSPLocalNotificationTypeKey : RCSPLocalNotificationTypeCalendar
                                       };
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        [newNotiArr addObject:localNotification];
    }
    [UIApplication sharedApplication].scheduledLocalNotifications = newNotiArr;
    
//    NSLog(@"noti count new: %d", [UIApplication sharedApplication].scheduledLocalNotifications.count);
}

@end
