//
//  RCSPTimePeriod.h
//  RCSPFoundation
//
//  Created by John Wu on 4/20/16.
//
//

#import <Foundation/Foundation.h>

@interface RCSPTimePeriod : NSObject
@property (nonatomic, copy) NSDate *startTime;
@property (nonatomic, copy) NSDate *endTime;

+ (instancetype) periodForDate: (NSDate *)date;

- (NSTimeInterval) timeDuration;

- (BOOL) containsDate: (NSDate *)date;
- (BOOL) containsTimePeriod: (RCSPTimePeriod *)timePeriod;

- (NSArray <RCSPTimePeriod *> *) removeTimePeriod: (RCSPTimePeriod *)timePeriod;
@end
