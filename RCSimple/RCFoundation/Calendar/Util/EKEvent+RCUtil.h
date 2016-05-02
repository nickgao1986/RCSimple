//
//  EKEvent+RCUtil.h
//  RCEventKit
//
//  Created by John Wu on 3/30/16.
//  Copyright © 2016 John Wu. All rights reserved.
//

#import <EventKit/EventKit.h>

@interface EKEvent (RCUtil)
- (EKParticipantStatus) currentUserAcceptance;
@end
