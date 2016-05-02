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

#import "NSObject+RCUICategory.h"

@implementation NSObject (RCUICategory)

- (id) performSelector: (SEL)selector withObject: (id)p1 withObject: (id)p2 withObject: (id)p3;
{
    NSMethodSignature *sig = [self methodSignatureForSelector: selector];
    if (sig != nil)
    {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature: sig];
        [invocation setTarget: self];
        [invocation setSelector: selector];
        [invocation setArgument: &p1 atIndex: 2];
        [invocation setArgument: &p2 atIndex: 3];
        [invocation setArgument: &p3 atIndex: 4];
        [invocation invoke];
        
        if (sig.methodReturnLength)
        {
            id result;
            [invocation getReturnValue: &result];
            return result;
        }
    }
    
    return nil;
}

- (id) performSelector: (SEL)selector withValue: (NSInteger)value;
{
    NSMethodSignature *sig = [self methodSignatureForSelector: selector];
    if (sig != nil)
    {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature: sig];
        [invocation setTarget: self];
        [invocation setSelector: selector];
        [invocation setArgument: &value atIndex: 2];
        [invocation invoke];
        
        if (sig.methodReturnLength)
        {
            id result;
            [invocation getReturnValue: &result];
            return result;
        }
    }
    
    return nil;
}

- (id) performSelector: (SEL)selector withValue: (NSInteger)value1 withValue: (NSInteger)value2;
{
    NSMethodSignature *sig = [self methodSignatureForSelector: selector];
    if (sig != nil)
    {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature: sig];
        [invocation setTarget: self];
        [invocation setSelector: selector];
        [invocation setArgument: &value1 atIndex: 2];
        [invocation setArgument: &value2 atIndex: 3];
        [invocation invoke];
        
        if (sig.methodReturnLength)
        {
            id result;
            [invocation getReturnValue: &result];
            return result;
        }
    }
    
    return nil;
}

- (id) performSelector: (SEL)selector withObject: (id)object withValue: (NSInteger)value;
{
    NSMethodSignature *sig = [self methodSignatureForSelector: selector];
    if (sig != nil)
    {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature: sig];
        [invocation setTarget: self];
        [invocation setSelector: selector];
        [invocation setArgument: &object atIndex: 2];
        [invocation setArgument: &value atIndex: 3];
        [invocation invoke];
        
        if (sig.methodReturnLength)
        {
            id result;
            [invocation getReturnValue: &result];
            return result;
        }
    }
    
    return nil;
}

@end
