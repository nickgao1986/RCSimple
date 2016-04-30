//
//  RCSPLaunchView.h
//  RCSimple
//
//  Created by Nick Gao on 4/30/16.
//  Copyright © 2016 nickgao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RCSPLaunchView;

@protocol RCSPLaunchViewDelegate <NSObject>

- (void) launchViewLaunchButtonClicked: (RCSPLaunchView *)launchView;

@end

@interface RCSPLaunchView : UIView

@property (nonatomic, retain) UIButton *launchButton;
@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UILabel *detailLabel;
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, assign) NSObject<RCSPLaunchViewDelegate> *delegate;

- (id) initWithFrame: (CGRect)frame buttonTitle: (NSString*)title;

@end
