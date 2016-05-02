//
//  RCSPConerMaskView.h
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/19/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCSPConerMaskView : UIView
@property (nonatomic, assign) UIRectCorner rectConer;
@property (nonatomic, assign) CGSize cornerRadii;
@property (nonatomic, assign) CGFloat borderWidth;
@end
