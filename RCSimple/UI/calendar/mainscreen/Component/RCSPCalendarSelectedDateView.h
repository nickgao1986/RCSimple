//
//  RCSPCalendarSelectedDateView.h
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/15/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import <UIKit/UIView.h>

@interface RCSPCalendarSelectedDateView : UIView
@property (nonatomic, retain, readonly) NSDate *currentDate;

- (void) updateCurrentDate: (NSDate *)date;
@end
