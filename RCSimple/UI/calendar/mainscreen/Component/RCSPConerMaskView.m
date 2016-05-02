//
//  RCSPConerMaskView.m
//  RCSoftPhoneAppKit
//
//  Created by John Wu on 4/19/16.
//  Copyright © 2016 RingCentral, Inc. All rights reserved.
//

#import "RCSPConerMaskView.h"

@implementation RCSPConerMaskView

- (instancetype) initWithFrame: (CGRect)frame;
{
    if (self = [super initWithFrame: frame])
    {
        _rectConer = UIRectCornerAllCorners;
        _cornerRadii = CGSizeZero;
        _borderWidth = 0;
    }
    return self;
}

- (void) setFrame: (CGRect)frame;
{
    [super setFrame: frame];    
    [self updateMask];
}

- (void) setRectConer: (UIRectCorner)rectConer;
{
    _rectConer = rectConer;
    [self updateMask];
}

- (void) setCornerRadii: (CGSize)cornerRadii;
{
    _cornerRadii = cornerRadii;
    [self updateMask];
}

- (void) setBorderWidth: (CGFloat)borderWidth;
{
    if (borderWidth >= 0)
    {
        _borderWidth = borderWidth;
    }
    else
    {
        _borderWidth = 0;
    }
    [self updateMask];
}

- (void) updateMask;
{
    CALayer *mask = [[self layer] mask];
    CAShapeLayer *shapedMask = nil;
    if (mask == nil || ![mask isKindOfClass: [CAShapeLayer class]])
    {
        shapedMask = [[[CAShapeLayer alloc] init] autorelease];
    }
    else
    {
        shapedMask = (CAShapeLayer *)mask;
    }
    CGFloat border = 0;
    if (self.borderWidth > 0)
    {
        border = self.borderWidth;
    }
    CGRect innerFrame = CGRectInset(self.bounds, border, border);
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect: innerFrame byRoundingCorners: self.rectConer cornerRadii: self.cornerRadii];
    shapedMask.frame = innerFrame;
    shapedMask.path  = maskPath.CGPath;
    self.layer.mask = shapedMask;
}
@end
