//
//  RCSPEventAction.m
//  RCSPFoundation
//
//  Created by John Wu on 4/14/16.
//
//

#import "RCSPEventAction.h"
//#import <RCSPFoundation/RCSPLocalization.h>

@interface RCSPEventAction()
@property (nonatomic, assign) RCSPEventActionType type;
@end

@implementation RCSPEventAction

- (instancetype) initWithType: (RCSPEventActionType)type;
{
    if (self = [super init])
    {
        self.type = type;
    }
    return self;
}

- (NSString *) actionName;
{
    switch (self.type)
    {
        case RCSPEventActionTypeJoin:
            return @"Join";
        case RCSPEventActionTypeDailin:
            return @"Dial-in";
        case RCSPEventActionTypeCall:
            return @"Call";
    }
}

@end
