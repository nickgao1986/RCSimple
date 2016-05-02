//
//  NSDate+RCCalendarUtil.h
//  RCSPFoundation
//
//  Created by John Wu on 4/14/16.
//
//

#import <Foundation/NSDate.h>

@interface NSDate (RCCalendarUtil)
- (NSDate *) startOfDay;
- (NSDate *) endOfDay;

- (BOOL) isMidnight;

- (NSDate *) previousDay;
- (NSDate *) nextDay;
@end
