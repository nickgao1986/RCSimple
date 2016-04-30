//
//  ViewController.m
//  RCSimple
//
//  Created by Nick Gao on 4/29/16.
//  Copyright © 2016 nickgao. All rights reserved.
//

#import "ViewController.h"


#define CURRENT_DATE_VIEW_HEIGHT 48


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self initTopView];
    [self initContentView];
    [self initPermissionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
