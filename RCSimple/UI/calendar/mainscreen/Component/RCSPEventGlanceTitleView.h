//
//  RCSPEventGlanceTitleView.h
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/19/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCSPEvent.h"
#import <UIKit/UIKit.h>

@interface RCSPEventGlanceTitleView : UIView
@property (nonatomic, assign, readonly) RCSPEventIconType type;
@property (nonatomic, retain, readonly) NSString *title;

- (void) updateTitle: (NSString *)title andType: (RCSPEventIconType)type;
- (void) setViewEnabled: (BOOL)enabled;
@end
