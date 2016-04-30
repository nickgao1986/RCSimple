// Copyright (c) 2013 Ben Vogelzang
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>

@protocol RCUISwitchDelegate <NSObject>

@optional

- (BOOL) swichControlShouldBeginChange;

@end

@interface RCUISwitch : UIControl <NSCoding>

@property (nonatomic, retain) UIColor *onTintColor          UI_APPEARANCE_SELECTOR;
@property (nonatomic, retain) UIColor *tintColor            UI_APPEARANCE_SELECTOR;
@property (nonatomic, retain) UIColor *activeColor          UI_APPEARANCE_SELECTOR;
@property (nonatomic, retain) UIColor *borderColor          UI_APPEARANCE_SELECTOR;
@property (nonatomic, retain) UIColor *thumbTintColor       UI_APPEARANCE_SELECTOR;
@property (nonatomic, retain) UIColor *thumbShadowColor     UI_APPEARANCE_SELECTOR;
@property (nonatomic, retain) UIImage *onImage              UI_APPEARANCE_SELECTOR;
@property (nonatomic, retain) UIImage *offImage             UI_APPEARANCE_SELECTOR;
@property (nonatomic, getter = isOn) BOOL on;
@property (nonatomic, assign) NSObject<RCUISwitchDelegate> *delegate;

- (id) initWithFrame: (CGRect)frame;
- (void) setOn: (BOOL)on animated: (BOOL)animated;

@end
