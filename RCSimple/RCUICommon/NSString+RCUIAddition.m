// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "NSString+RCUIAddition.h"

@implementation NSString (RCUIAddition)

- (BOOL) isWhitespaceAndNewlines;
{
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    for (NSUInteger i = 0; i < self.length; ++i)
    {
        unichar c = [self characterAtIndex: i];
        if (![whitespace characterIsMember: c])
        {
            return NO;
        }
    }
    
    return YES;
}

- (NSString *) urlEncoded;
{
    CFStringRef cfUrlEncodedString = CFURLCreateStringByAddingPercentEscapes (NULL,
                                                                             (CFStringRef)self, NULL,
                                                                             (CFStringRef)@"!#$%&'()*+,/:;=?@[]",
                                                                             kCFStringEncodingUTF8);
    
    NSString *urlEncoded = [NSString stringWithString: (NSString *)cfUrlEncodedString];
    CFRelease (cfUrlEncodedString);
    return urlEncoded;
}

- (NSComparisonResult) versionStringCompare: (NSString *)other;
{
    NSArray *oneComponents = [self componentsSeparatedByString: @"a"];
    NSArray *twoComponents = [other componentsSeparatedByString: @"a"];
    
    NSString *oneMain = [oneComponents objectAtIndex: 0];
    NSString *twoMain = [twoComponents objectAtIndex: 0];
    
    NSComparisonResult mainDiff;
    if ((mainDiff = [oneMain compare: twoMain]) != NSOrderedSame)
    {
        return mainDiff;
    }
    
    if ([oneComponents count] < [twoComponents count])
    {
        return NSOrderedDescending;
    }
    else if ([oneComponents count] > [twoComponents count])
    {
        return NSOrderedAscending;
    }
    else if ([oneComponents count] == 1)
    {
        return NSOrderedSame;
    }
    

    NSNumber *oneAlpha = [NSNumber numberWithInteger: [[oneComponents objectAtIndex: 1] integerValue]];
    NSNumber *twoAlpha = [NSNumber numberWithInteger: [[twoComponents objectAtIndex: 1] integerValue]];
    
    return [oneAlpha compare: twoAlpha];
}

@end
