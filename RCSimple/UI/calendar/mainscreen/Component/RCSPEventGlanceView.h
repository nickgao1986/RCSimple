//
//  RCSPEventGlanceView.h
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/19/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RCSPEvent;

@interface RCSPEventGlanceView : UIView
+ (CGFloat) heightForEvent: (RCSPEvent *)event;
- (void) updateViewWithEvent: (RCSPEvent *)event;

@end
