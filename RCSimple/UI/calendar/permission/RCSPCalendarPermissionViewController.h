//
//  RCSPCalendarPermissionViewController.h
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/14/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCUIOrientationSupportedViewController.h"

#define RCSPCalendarPermissionEntrySettings     @"My Application Settings"
#define RCSPCalendarPermissionEntryDrawer       @"Drawer Menu"

@protocol RCSPCalendarPermissionViewControllerDelegate;

@interface RCSPCalendarPermissionViewController : RCUIOrientationSupportedViewController
@property (nonatomic, assign) id <RCSPCalendarPermissionViewControllerDelegate> delegate;
@property (nonatomic, copy) NSString * entryName;   // see defines above
@end

@protocol RCSPCalendarPermissionViewControllerDelegate <NSObject>

- (void) calendarPermissionViewController: (RCSPCalendarPermissionViewController *)controller
                didPermissionStateChanged: (BOOL)granted;

@end
