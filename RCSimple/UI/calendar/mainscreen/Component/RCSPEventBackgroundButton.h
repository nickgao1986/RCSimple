//
//  RCSPEventBackgroundButton.h
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/20/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import <UIKit/UIButton.h>

@protocol RCSPEventBackgroundButtonDelegate <NSObject>
@optional
- (void) onButtonHighlightedStateChange: (BOOL)isHighlighted;
@end

@interface RCSPEventBackgroundButton : UIButton
@property (nonatomic, assign) BOOL shouldGrayOut;
@property (nonatomic, assign) id<RCSPEventBackgroundButtonDelegate> buttonStateDelegate;
@end
