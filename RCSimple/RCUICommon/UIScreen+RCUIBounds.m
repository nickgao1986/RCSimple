//
//  UIScreen+RCUIBounds.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 12/24/14.
//
//

#import "UIScreen+RCUIBounds.h"

@implementation UIScreen (RCUIBounds)

- (CGRect) deviceBounds;
{
    if ([self respondsToSelector: @selector (coordinateSpace)] && [self respondsToSelector: @selector (fixedCoordinateSpace)])
    {
        id coordinateSpace = [self coordinateSpace];
        id fixedCoordinateSpace = [self fixedCoordinateSpace];
        
        if ([coordinateSpace respondsToSelector: @selector (convertRect:toCoordinateSpace:)])
        {
            return [coordinateSpace convertRect: [self bounds] toCoordinateSpace: fixedCoordinateSpace];
        }
    }
    
    return [self bounds];
}

@end
