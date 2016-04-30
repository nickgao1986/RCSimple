//
//  ViewController.h
//  RCSimple
//
//  Created by Nick Gao on 4/29/16.
//  Copyright © 2016 nickgao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCSPLaunchView.h"
@interface ViewController : UIViewController


@property (nonatomic, assign) BOOL isAnmiationInProgress;
@property (nonatomic, assign) BOOL showEventDetail;
@property (nonatomic, assign) UIView *contentView;
@property (nonatomic, assign) UIView *topView;
@property (nonatomic, assign) UIView *permissionView;
@property (nonatomic, retain) RCSPLaunchView *launchView;


@end

