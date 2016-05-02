//
//  RCSPEventGlanceActionView.h
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/19/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCSPEventAction.h"

@interface RCSPEventGlanceActionView : UIView
@property (nonatomic, retain, readonly) RCSPEventAction *action;
- (void) updateView: (RCSPEventAction *)action;
@end
