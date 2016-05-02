//
//  NSString+RCStringEmpty.h
//  RCFoundation
//
//  Created by Kingle Zhuang on 3/14/12.
//  Copyright 2012 RingCentral, Inc. All rights reserved.
//

#import <Foundation/NSString.h>


@interface NSString (RCStringEmpty)

+ (BOOL) stringIsEmpty: (NSString *)str;
- (BOOL) stringIsNotEmpty;

@end
