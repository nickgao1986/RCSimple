//
//  RCSPCalendarSyncManager.h
//  RCSPFoundation
//
//  Created by John Wu on 4/14/16.
//
//

#import <Foundation/Foundation.h>


// notis with different types, when refreshing calendar event notis, must specify the type of noti
// and just refresh calendar events.

/*
 here are some relevant files for future reference
 RCSPPersonUtils.h
 
 RCSPAppConfigurationViewController.m
 
 RCSPCloudContactViewController
 
 */


@interface RCSPCalendarSyncManager : NSObject

+ (void) refreshAllCalendarEvents;

@end
