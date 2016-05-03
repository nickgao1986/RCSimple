//
//  ViewController.m
//  RCSimple
//
//  Created by Nick Gao on 4/29/16.
//  Copyright © 2016 nickgao. All rights reserved.
//

#import "ViewController.h"
#import "RCSPEventListViewController.h"
#import "RCSPCalendarPermissionViewController.h"

#define CURRENT_DATE_VIEW_HEIGHT 48


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    [self initTopView];
//    [self initContentView];
//    [self initPermissionView];
    
  //  [self initLaunchView];
    
//    RCSPEventListViewController* controller = [[RCSPEventListViewController alloc] initWithNibName:nil bundle:nil];
//    [self presentViewController:controller animated:true completion:nil];
    
    
    RCSPCalendarPermissionViewController* controller = [[RCSPCalendarPermissionViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:controller animated:true completion:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(void)refreshVieWithCalendarPermission() {
//    
//}



-(void)launchViewLaunchButtonClicked:(RCSPLaunchView *)launchView{
    if (self.delegate && [self.delegate respondsToSelector:@selector(noCalendarSelectedViewControllerSelectBtnClicked:)])
    {
        [self.delegate noCalendarSelectedViewControllerSelectBtnClicked:self];
    }
}

-(void)initLaunchView{
    self.launchView = [[[RCSPLaunchView alloc] initWithFrame: self.view.bounds
                                                 buttonTitle: @"Get Started"] autorelease];
    [self.view addSubview: self.launchView];
    
    self.launchView.delegate = self;
    self.launchView.imageView.image     = [UIImage imageNamed: @"Calendar_Permission"];
    self.launchView.label.text          = @"Join meetings quickly with one tap.";
    self.launchView.detailLabel.text    = @"You can enable access in Settings -> Privacy -> Calendars.";
}


- (void) initTopView;
{
    CGSize viewSize = self.view.frame.size;
    CGRect frame = CGRectMake(0, 0, viewSize.width,  CURRENT_DATE_VIEW_HEIGHT);
    
    UIView *topView = [[UIView alloc] initWithFrame: frame];
    topView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview: topView];
    self.topView = topView;
}


- (void) initContentView;
{
    CGSize viewSize = self.view.frame.size;
    CGRect frame = CGRectMake(0, CURRENT_DATE_VIEW_HEIGHT, viewSize.width,  viewSize.height - CURRENT_DATE_VIEW_HEIGHT);
    
    UIView *contentView = [[UIView alloc] initWithFrame: frame];
    contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    contentView.clipsToBounds = YES;
    [self.view addSubview: contentView];
    self.contentView = contentView;
}



- (void) initPermissionView;
{
    CGSize viewSize = self.view.frame.size;
    CGRect frame = CGRectMake(0, 0, viewSize.width,  viewSize.height);
    
    UIView *permissionView = [[UIView alloc] initWithFrame: frame];
    permissionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview: permissionView];
    self.permissionView = permissionView;
}


@end
