//
//  RCSearchBar.m
//  RCSoftPhoneAppKit
//
//  Created by Roger on 2/27/14.
//  Copyright (c) 2014 RingCentral, Inc. All rights reserved.
//

#import "RCUISearchBar.h"
#import "RCUIGlobalCommon.h"

static const NSInteger RCUISearchBarHeight = 44;

@implementation RCUISearchBar

- (id) initWithFrame: (CGRect)frame
{
    self = [super initWithFrame: frame];
    
    if (self)
    {}
    
    return self;
}

- (void) setFrame: (CGRect)frame;
{
    if (ABS(frame.size.height - RCUISearchBarHeight) > 0.0001f)
    {
        frame.size.height = RCUISearchBarHeight;
    }
    
    [super setFrame: frame];
}

- (void) layoutSubviews;
{
    [super layoutSubviews];
    
    if (RCUIIsIOSSDKVersionAbove7 ())
    {
        for (UIView *subView in self.subviews)
        {
            subView.clipsToBounds = NO;
        }
    }
}

@end
