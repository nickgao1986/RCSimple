//
//  RCSPEventAction.h
//  RCSPFoundation
//
//  Created by John Wu on 4/14/16.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>

typedef NS_ENUM (NSInteger, RCSPEventActionType)
{
    RCSPEventActionTypeJoin,
    RCSPEventActionTypeDailin,
    RCSPEventActionTypeCall,
};

@interface RCSPEventAction : NSObject
@property (nonatomic, assign, readonly) RCSPEventActionType type;

- (instancetype) initWithType: (RCSPEventActionType)type;

- (NSString *) actionName;
@end
