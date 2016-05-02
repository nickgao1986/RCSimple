//
//  NSString+RCStringEmpty.m
//  RCFoundation
//
//  Created by Kingle Zhuang on 3/14/12.
//  Copyright 2012 RingCentral, Inc. All rights reserved.
//

#import "NSString+RCStringEmpty.h"
#import <Foundation/NSNull.h>


@implementation NSString (RCStringEmpty)

+ (BOOL) stringIsEmpty: (NSString *)str;
{
	BOOL isEmpty;
	
	if (((NSNull *)str == [NSNull null])
			|| (str == nil)
			|| ([str length] == 0))
	{
		isEmpty = YES;
	}
	else
	{
		isEmpty = NO;
	}
	
	return isEmpty;
}

- (BOOL) stringIsNotEmpty
{
	return ![NSString stringIsEmpty: self];
}

@end
