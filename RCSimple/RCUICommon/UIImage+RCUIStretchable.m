//
//  UIImage+RCUIStretchable.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 2/26/13.
//  Copyright (c) 2013 RingCentral. All rights reserved.
//

#import "UIImage+RCUIStretchable.h"

@implementation UIImage (RCUIStretchable)

- (UIImage *) stretchableImageWithCapInsets: (UIEdgeInsets)insets;
{
    if ([self respondsToSelector: @selector (resizableImageWithCapInsets:)])
    {
        return [self resizableImageWithCapInsets: insets];
    }
    else if ([self respondsToSelector: @selector (stretchableImageWithLeftCapWidth:topCapHeight:)])
    {
        return [self stretchableImageWithLeftCapWidth: insets.left topCapHeight: insets.top];
    }
    
    return self;
}

@end
