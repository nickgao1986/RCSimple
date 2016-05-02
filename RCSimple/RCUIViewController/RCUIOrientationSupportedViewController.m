//
//  RCUIOrientationSupportedViewController.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 2/26/13.
//  Copyright (c) 2013 RingCentral. All rights reserved.
//

#import "RCUIOrientationSupportedViewController.h"
#import "RCUIGlobalCommon.h"
//#import "RCApplicationDelegate.h"
//#import <RCUIKit/UIDevice+RCFlexibleInterfaceOrientation.h>
//#import <RCUIKit/CMPopTipView.h>
//#import <RCUIKit/RCTutorialOverlayViewController.h>
//#import <RCUIKit/RCApplicationDelegate.h>
//#import "SWTableViewCell.h"
//#import <objc/runtime.h>

@interface RCUIOrientationSupportedViewController ()

@property (nonatomic, retain) NSIndexPath *swipeIndexPath;
//@property (nonatomic, assign) SWCellState swipeCellState;

@end

@implementation RCUIOrientationSupportedViewController

- (id) initWithNibName: (NSString *)nibNameOrNil bundle: (NSBundle *)nibBundleOrNil;
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    
    if (self)
    {
        self.forbiddenEditingKVO = NO;
    }
    
    return self;
}

- (BOOL) shouldAutorotate;
{
  //  return [[UIDevice currentDevice] isFlexibleInterfaceOrientationPreferred];
    return false;
}

- (UIInterfaceOrientationMask) supportedInterfaceOrientations;
{
//    if ([[UIDevice currentDevice] isFlexibleInterfaceOrientationPreferred])
//    {
//        return UIInterfaceOrientationMaskAll;
//    }
    
    return UIInterfaceOrientationMaskPortrait;
}

- (void) viewDidLoad;
{
    [super viewDidLoad];
    [self configViewControllerExtendLayoutForIOS7: NO];
}

- (void) configViewControllerExtendLayoutForIOS7: (BOOL)extend;
{
    if (!extend)
    {
        if ([self respondsToSelector: @selector (setEdgesForExtendedLayout:)])
        {
            [self setEdgesForExtendedLayout: UIRectEdgeNone];
        }
        
        if ([self respondsToSelector: @selector (setAutomaticallyAdjustsScrollViewInsets:)])
        {
            [self setAutomaticallyAdjustsScrollViewInsets: NO];
        }
        
        if ([self respondsToSelector: @selector (setExtendedLayoutIncludesOpaqueBars:)])
        {
            [self setExtendedLayoutIncludesOpaqueBars: NO];
        }
    }
    else
    {
        if ([self respondsToSelector: @selector (setEdgesForExtendedLayout:)])
        {
            [self setEdgesForExtendedLayout: UIRectEdgeAll];
        }
        
        if ([self respondsToSelector: @selector (setAutomaticallyAdjustsScrollViewInsets:)])
        {
            [self setAutomaticallyAdjustsScrollViewInsets: YES];
        }
        
        if ([self respondsToSelector: @selector (setExtendedLayoutIncludesOpaqueBars:)])
        {
            [self setExtendedLayoutIncludesOpaqueBars: YES];
        }
    }
}

- (void) viewWillAppear: (BOOL)animated;
{
    [super viewWillAppear: animated];
//    [RCApplicationDelegate sharedApplicationDelegate].isLightStatusBarPreferred = [self preferredStatusBarLightStyle];
}

- (void) viewDidAppear: (BOOL)animated;
{
    [super viewDidAppear: animated];
//    [[RCApplicationDelegate sharedApplicationDelegate] showOverlay: self];
}

- (void) viewWillDisappear: (BOOL)animated;
{
//    [[RCApplicationDelegate sharedApplicationDelegate] dismissOverlay: self];
    [super viewWillDisappear: animated];
}

- (void) setEditing: (BOOL)editing animated: (BOOL)animated;
{
    if (!self.forbiddenEditingKVO)
    {
        [self willChangeValueForKey: @"editing"];
    }
    
    [super setEditing: editing animated: animated];
    
    if (!self.forbiddenEditingKVO)
    {
        [self didChangeValueForKey: @"editing"];
    }
}

- (void) pushSwipeUtilityButtonsStateForTableView:(UITableView *)tableView
{
//    for (UITableViewCell *cell in tableView.visibleCells)
//    {
//        if ([cell isKindOfClass:[SWTableViewCell class]])
//        {
//            SWTableViewCell *swipeCell = (SWTableViewCell *)cell;
//            if (swipeCell.cellState != kCellStateCenter)
//            {
//                self.swipeIndexPath = [tableView indexPathForCell:swipeCell];
//                self.swipeCellState = swipeCell.cellState;
//                break;
//            }
//        }
//    }
}

- (void) popSwipeUtilityButtonsStateForTableView:(UITableView *)tableView
{
//    for (NSIndexPath *indexPath in tableView.indexPathsForVisibleRows)
//    {
//        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//        if ([cell isKindOfClass:[SWTableViewCell class]])
//        {
//            SWTableViewCell *swipeCell = (SWTableViewCell *)cell;
//            if ([indexPath isEqual:self.swipeIndexPath])
//            {
//                switch (self.swipeCellState) {
//                    case kCellStateLeft:
//                        [swipeCell showLeftUtilityButtonsAnimated:NO];
//                        break;
//                    case kCellStateRight:
//                        [swipeCell showRightUtilityButtonsAnimated:NO];
//                        break;
//                    default:
//                        break;
//                }
//            }
//            else
//            {
//                [swipeCell hideUtilityButtonsAnimated:NO];
//            }
//        }
//    }
}

- (void) clearSwipeUtilityButtonsState
{
    self.swipeIndexPath = nil;
}

- (void) dealloc;
{
    self.flurryText = nil;
    [super dealloc];
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
static NSMutableDictionary *gSuperControllers = nil;

@implementation UIViewController (RCUICategory)

- (BOOL) preferredStatusBarLightStyle;
{
    return YES;
}

- (UIViewController *) superViewController;
{
    UIViewController *parent = self.parentViewController;
    
    if (nil != parent)
    {
        return parent;
    }
    else
    {
        NSString *key = [NSString stringWithFormat: @"%lu", (unsigned long)self.hash];
        return [gSuperControllers objectForKey: key];
    }
}

- (void) setSuperViewController: (UIViewController *)superViewController;
{
    NSString *key = [NSString stringWithFormat: @"%lu", (unsigned long)self.hash];
    
    if (superViewController != nil)
    {
        if (gSuperControllers == nil)
        {
            gSuperControllers = RCUICreateNonRetainDictionary ();
        }
        
        [gSuperControllers setObject: superViewController forKey: key];
    }
    else
    {
        [gSuperControllers removeObjectForKey: key];
    }
}

@end


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
static const char *RCUIFlurryTextForViewController = "RCUIFlurryTextForViewController";

@implementation UIViewController (RCUIFlurry)

- (void) setFlurryText: (NSString *)flurryText;
{
//    objc_setAssociatedObject (self, (void *)RCUIFlurryTextForViewController, flurryText, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *) flurryText;
{
//    return RC_KCAST (NSString, objc_getAssociatedObject (self, (void *)RCUIFlurryTextForViewController));
    return nil;
}

@end


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation UIViewController (RCUIBadge)

- (NSInteger) badgeNumber;
{
    return 0;
}

@end
