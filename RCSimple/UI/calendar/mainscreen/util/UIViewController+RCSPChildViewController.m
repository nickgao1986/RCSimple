//
//  UIViewController+RCSPChildViewController.m
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/21/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "UIViewController+RCSPChildViewController.h"

@implementation UIViewController (RCSPChildViewController)

#pragma mark - add/remove sub view controler
- (UIView *) addViewFromController: (UIViewController *)controller toSubView: (UIView *)view;
{
    if (controller == nil || [controller view] == nil)
    {
        return nil;
    }
    UIView *targetView = view;
    if ([view superview] != self.view)
    {
        targetView = self.view;
    }
    UIView *content = controller.view;
    [self addChildViewController: controller];
    content.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    content.frame = CGRectMake(0, 0, targetView.frame.size.width, targetView.frame.size.height);
    [targetView addSubview: content];
    [controller didMoveToParentViewController: self];
    return content;
}

- (void) removeViewOfController: (UIViewController *)controller;
{
    [controller willMoveToParentViewController: nil];
    [[controller view] removeFromSuperview];
    [controller removeFromParentViewController];
}
@end
