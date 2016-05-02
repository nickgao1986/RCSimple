//
//  RCSPEventBackgroundButton.m
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/20/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCSPEventBackgroundButton.h"
#import "RCSPCalendarComponentFactory.h"

@implementation RCSPEventBackgroundButton

- (void) setHighlighted: (BOOL)highlighted;
{
    [super setHighlighted: highlighted];
    if (self.buttonStateDelegate && [self.buttonStateDelegate respondsToSelector: @selector(onButtonHighlightedStateChange:)])
    {
        [self.buttonStateDelegate onButtonHighlightedStateChange: highlighted];
    }
}

- (void) drawRect: (CGRect)rect;
{
    if (self.shouldGrayOut)
    {
        UIColor *color = [[RCSPCalendarComponentFactory lightGrayColor] colorWithAlphaComponent: 0.4];
        [RCSPCalendarComponentFactory drawGradientLineInRect: rect color: color];
    }
    [super drawRect: rect];
}
@end
