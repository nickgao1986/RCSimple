//
//  RCSPNoCalendarSelectedViewController.m
//  RCSoftPhoneAppKit
//
//  Created by Will Wei on 4/29/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCSPNoCalendarSelectedViewController.h"

#import "UIViewController+RCSPMenuBarButtonItem.h"
#import "RCSPLaunchView.h"
#import "RCSPSelectCalendarViewController.h"
#import <RCSoftPhoneAppKit/RCSPApplicationDelegate.h>
#import <RCSoftPhoneAppKit/RCSPAppKitResources.h>
#import <RCSoftPhoneAppKit/RCSPVideoConferenceLoadingViewController.h>
#import <RCSPCommunicationKit/RCSPBackendEntry.h>
#import <RCSPCommunicationKit/RCSPBackendEntry+BackendManager.h>
#import <RCSPFoundation/RCSPLocalization.h>
#import <RCSPFoundation/RCSPStatisticsController.h>
#import <RCSPFoundation/RCSPCalendarManager.h>
#import <RCUIKit/RCUIKitDefaults.h>
#import <RCUIKit/RCUIGlobalCommon.h>
#import <RCUIKit/RCUIGlobalStyle.h>
#import <RCUIKit/UIView+RCUINavigationBarButtonItemView.h>
#import <RCUIKit/UILabel+RCUINavigationBarTitleView.h>
#import <RCUIKit/RCSPSoftPhoneAppKitSkinCommonMacros.h>

@interface RCSPNoCalendarSelectedViewController ()<RCSPLaunchViewDelegate>
@property (nonatomic, retain) RCSPLaunchView *launchView;
@end

@implementation RCSPNoCalendarSelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupMenuBarButtonItem];
    
    self.launchView = [[[RCSPLaunchView alloc] initWithFrame: self.view.bounds
                                                 buttonTitle: RCSPLocalizedString (@"Select", )] autorelease];
    [self.view addSubview: self.launchView];
    
    self.launchView.delegate = self;
    self.launchView.imageView.image     = [UIImage imageNamed: @"Calendar_Permission"];
    self.launchView.label.text          = RCSPLocalizedString (@"Select a calendar to view yur events here.", );
}

#pragma mark-

- (void) launchViewLaunchButtonClicked: (RCSPLaunchView *)launchView;
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(noCalendarSelectedViewControllerSelectBtnClicked:)])
    {
        [self.delegate noCalendarSelectedViewControllerSelectBtnClicked:self];
    }
}

- (void) viewWillLayoutSubviews;
{
    [super viewWillLayoutSubviews];
    
    self.launchView.frame = self.view.bounds;
}

- (void) dealloc;
{
    self.menuBarButtonItem = nil;
    self.launchView = nil;
    
    [super dealloc];
}

@end
