//
//  RCSPNoCalendarSelectedViewController.h
//  RCSoftPhoneAppKit
//
//  Created by Will Wei on 4/29/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RCSPNoCalendarSelectedViewControllerDelegate;

@interface RCSPNoCalendarSelectedViewController : RCUIOrientationSupportedViewController
@property (nonatomic, assign) id <RCSPNoCalendarSelectedViewControllerDelegate> delegate;
@end

@protocol RCSPNoCalendarSelectedViewControllerDelegate <NSObject>

- (void) noCalendarSelectedViewControllerSelectBtnClicked: (RCSPNoCalendarSelectedViewController *)controller;

@end
