//
//  RCSPCalendarPermissionViewController.m
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/14/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCSPCalendarPermissionViewController.h"

#import "RCSPLaunchView.h"
#import "RCSPCalendarManager.h"
#import "RCUIGlobalCommon.h"
#import "RCUIGlobalStyle.h"

@interface RCSPCalendarPermissionViewController ()<RCSPLaunchViewDelegate>
@property (nonatomic, retain) RCSPLaunchView *launchView;
@end

@implementation RCSPCalendarPermissionViewController

- (NSString*) recheckButtonTitle;
{
    NSString *title = @"Get Started";;
    RCSPCalendarManager *cManager = [RCSPCalendarManager sharedManager];
    if (!cManager.isPermissionGranted)
    {
        if (cManager.authorizationStatus == EKAuthorizationStatusNotDetermined)
        {
            title =@"Get Started";
        }
        else
        {
            title = @"Enabled";
        }
    }

    return title;
}

- (NSString*) recheckDetailLabelText;
{
    NSString *title = @"";
    RCSPCalendarManager *cManager = [RCSPCalendarManager sharedManager];
    if (!cManager.isPermissionGranted)
    {
        if (cManager.authorizationStatus == EKAuthorizationStatusNotDetermined)
        {
        }
        else
        {
            title = @"You can enable access in Settings -> Privacy -> Calendars.";
        }
    }
    
    return title;
}

- (void) viewDidLoad;
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.launchView = [[[RCSPLaunchView alloc] initWithFrame: self.view.bounds
                                                 buttonTitle: [self recheckButtonTitle]] autorelease];
    [self.view addSubview: self.launchView];
    
    self.launchView.delegate = self;
    self.launchView.imageView.image     = [UIImage imageNamed: @"Calendar_Permission"];
    self.launchView.label.text          = @"Join meetings quickly with one tap.";
    self.launchView.detailLabel.text    = [self recheckDetailLabelText];
}

- (void) refreshLanuchButtonTitle;
{
    self.launchView.detailLabel.text    = [self recheckDetailLabelText];
    
    NSString *launchButtonTitle = [self recheckButtonTitle];
    [self.launchView.launchButton setTitle: launchButtonTitle forState: UIControlStateNormal];
    [self.launchView.launchButton setTitle: launchButtonTitle forState: UIControlStateHighlighted];
    
    [self.launchView layoutSubviews];
}

- (void) viewDidAppear: (BOOL)animated;
{
    [super viewDidAppear: animated];
    
    [self refreshLanuchButtonTitle];
}

#pragma mark-

- (void) launchViewLaunchButtonClicked: (RCSPLaunchView *)launchView;
{
    [self onLaunch: launchView.launchButton];
}

- (void) onLaunch: (id)sender;
{
    RCSPCalendarManager *cManager = [RCSPCalendarManager sharedManager];
    if (!cManager.isPermissionGranted)
    {
        if (cManager.authorizationStatus == EKAuthorizationStatusNotDetermined)
        {
            [self getStartedBtnClicked];
        }
        else
        {
            [self enableBtnClicked];
        }
    }
}

- (void) viewWillLayoutSubviews;
{
    [super viewWillLayoutSubviews];
    
    self.launchView.frame = self.view.bounds;
}

- (void) dealloc;
{
    self.launchView = nil;
    
    [super dealloc];
}

- (void) getStartedBtnClicked;
{
    __block __typeof__(self) weakSelf = self;
    [[RCSPCalendarManager sharedManager] requestPermission:^(BOOL granted)
    {
        [weakSelf permissionChanged:granted];
        
        // data tracking
        if (self.entryName)
        {
           
        }
    }];
}

- (void) permissionChanged: (BOOL)granted;
{
    if (granted)
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(calendarPermissionViewController:didPermissionStateChanged:)])
        {
            [self.delegate calendarPermissionViewController:self didPermissionStateChanged:granted];
        }
    }
    else
    {
        [self refreshLanuchButtonTitle];
    }
}

- (void)enableBtnClicked;
{
    if (RCUIOSVersion() >= 8.0)
    {
        UIApplication *app = [UIApplication sharedApplication];
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([app canOpenURL:settingsURL])
        {
            [app openURL:settingsURL];
        }
    }
}

@end
