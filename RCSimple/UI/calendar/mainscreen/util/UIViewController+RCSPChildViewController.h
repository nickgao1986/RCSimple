//
//  UIViewController+RCSPChildViewController.h
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/21/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import <UIKit/UIViewController.h>

@interface UIViewController (RCSPChildViewController)

- (UIView *) addViewFromController: (UIViewController *)controller toSubView: (UIView *)view;
- (void) removeViewOfController: (UIViewController *)controller;

@end
