//
//  RCUIOrientationSupportedViewController.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 2/26/13.
//  Copyright (c) 2013 RingCentral. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCUIOrientationSupportedViewController : UIViewController

@property (nonatomic, assign) BOOL forbiddenEditingKVO;

- (void) configViewControllerExtendLayoutForIOS7: (BOOL)extend;
- (void) pushSwipeUtilityButtonsStateForTableView:(UITableView *)tableView;
- (void) popSwipeUtilityButtonsStateForTableView:(UITableView *)tableView;
- (void) clearSwipeUtilityButtonsState;

@end


@interface UIViewController (RCUICategory)
@property (nonatomic, retain) UIViewController *superViewController;
- (BOOL) preferredStatusBarLightStyle;
@end


@interface UIViewController (RCUIFlurry)
@property (nonatomic,   copy) NSString *flurryText;
@end


@interface UIViewController (RCUIBadge)

- (NSInteger) badgeNumber;

@end
