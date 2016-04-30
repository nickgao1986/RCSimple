//
//  RCUIBadge.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 12/26/14.
//  Copyright (c) 2014 RingCentral. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCUIBadge : UIControl

@property (nonatomic,   copy) NSString *text;
@property (nonatomic, retain) UIFont   *font;
@property (nonatomic, retain) UIColor  *textColor;
@property (nonatomic, retain) UIColor  *badgeColor;
@property (nonatomic, retain) UIColor  *shadowColor;
@property (nonatomic, assign) CGSize   shadowOffset;
@property (nonatomic, assign) CGFloat  shadowBlur;

@end
