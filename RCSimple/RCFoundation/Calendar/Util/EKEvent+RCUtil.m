//
//  EKEvent+RCUtil.m
//  RCEventKit
//
//  Created by John Wu on 3/30/16.
//  Copyright © 2016 John Wu. All rights reserved.
//

#import "EKEvent+RCUtil.h"

@implementation EKEvent (RCUtil)
- (EKParticipantStatus) currentUserAcceptance;
{
    for (EKParticipant *participant in self.attendees) {
        if (participant.isCurrentUser)
        {
            return participant.participantStatus;
        }
    }
    return EKParticipantStatusUnknown;
}
@end
