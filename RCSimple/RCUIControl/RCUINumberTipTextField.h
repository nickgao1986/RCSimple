//
//  RCUINumberTipTextField.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/3/15.
//  Copyright (c) 2015 RingCentral. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RCUINumberTipTextFieldDelegate;

@interface RCUINumberTipTextField : UIView

@property (nonatomic, assign) id<RCUINumberTipTextFieldDelegate> delegate;
@property (nonatomic,   copy) NSString  *text;
@property (nonatomic, retain) UIFont    *textFont;
@property (nonatomic, retain) UIColor   *textColor;
@property (nonatomic, retain) UIFont    *residueFont;
@property (nonatomic, retain) UIColor   *residueColor;
@property (nonatomic, retain) UIColor   *residueHighlightedColor;
@property (nonatomic, assign) NSInteger numberOfResidue;
@property (nonatomic, assign) BOOL hideResidue;

- (void) setFocus: (BOOL)focus;

@end


@protocol RCUINumberTipTextFieldDelegate <NSObject>
@optional

- (void) didStartNumberTextField: (RCUINumberTipTextField *)textField;
- (void) didEndNumberTextField: (RCUINumberTipTextField *)textField;
- (void) didAlertNumberTextField: (RCUINumberTipTextField *)textField;
- (void) numberTextField: (RCUINumberTipTextField *)textField didChanged: (NSString *)text;

@end
