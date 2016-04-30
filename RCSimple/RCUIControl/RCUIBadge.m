//
//  RCUIBadge.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 12/26/14.
//  Copyright (c) 2014 RingCentral. All rights reserved.
//

#import "RCUIBadge.h"
#import "RCUIGlobalCommon.h"
#import "RCUIGlobalStyle.h"
#import <CoreGraphics/CoreGraphics.h>

@implementation RCUIBadge

- (void) _configure;
{
    self.backgroundColor = [UIColor clearColor];
    
    if (self.textColor == nil)
    {
        self.textColor = [UIColor whiteColor];
    }
    
    if (self.font == nil)
    {
        self.font = RCUIRegularSystemFont(12);
    }
    
    if (self.badgeColor == nil)
    {
        self.badgeColor = [UIColor redColor];
    }
}

- (id) initWithFrame: (CGRect)frame;
{
    self = [super initWithFrame: frame];
    
    if (self)
    {
        [self _configure];
    }
    
    return self;
}

#define kDefaultMaxHeight           15.
#define kDefaultHorizontalMargin    8.
- (CGSize) sizeThatFits: (CGSize)size;
{
    CGSize stringSize = [self.text sizeWithAttributes:@{NSFontAttributeName: self.font}];
    
    return CGSizeMake (MAX (kDefaultMaxHeight, ceil (stringSize.width) + kDefaultHorizontalMargin) + 2, kDefaultMaxHeight + 2);
}

- (CGSize) intrinsicContentSize;
{
    return [self sizeThatFits: self.bounds.size];
}

- (void) setText: (NSString *)text;
{
    [_text release];
    _text = [text copy];
    [self setNeedsDisplay];
    
    if ([self respondsToSelector: @selector (invalidateIntrinsicContentSize)])
    {
        [self invalidateIntrinsicContentSize];
    }
}

- (void) setFont: (UIFont *)font;
{
    [_font release];
    _font = [font retain];
    [self setNeedsDisplay];
    
    if ([self respondsToSelector: @selector (invalidateIntrinsicContentSize)])
    {
        [self invalidateIntrinsicContentSize];
    }
}

- (void) setTextColor: (UIColor *)textColor;
{
    [_textColor release];
    _textColor = [textColor retain];
    [self setNeedsDisplay];
}

- (void) setBadgeColor: (UIColor *)badgeColor;
{
    [_badgeColor release];
    _badgeColor = [badgeColor retain];
    [self setNeedsDisplay];
}

- (void) setShadowColor: (UIColor *)shadowColor;
{
    [_shadowColor release];
    _shadowColor = [shadowColor retain];
    self.layer.shadowColor = _shadowColor.CGColor;
    self.layer.shadowOpacity = .5;
}

- (void) setShadowBlur: (CGFloat)shadowBlur;
{
    if (!FLOAT_EQUAL (_shadowBlur, shadowBlur))
    {
        _shadowBlur = shadowBlur;
        self.layer.shadowRadius = _shadowBlur;
    }
}

- (void) setShadowOffset: (CGSize)shadowOffset;
{
    if (!CGSizeEqualToSize (_shadowOffset, shadowOffset))
    {
        _shadowOffset = shadowOffset;
        self.layer.shadowOffset = _shadowOffset;
    }
}

- (void) drawRect: (CGRect)rect;
{
    CGContextRef context = UIGraphicsGetCurrentContext ();
    
    CGContextSaveGState (context);
    rect = CGRectMake (1, 1, rect.size.width - 2, rect.size.height - 2);
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: rect.size.height / 2];
    [self.badgeColor setFill];
    [bezierPath fill];
    
    CGContextRestoreGState (context);
    
    CGSize textSize = [self.text sizeWithAttributes:@{NSFontAttributeName: self.font}];
    [self.textColor set];
    [self.text drawAtPoint: CGPointMake (floor ((rect.size.width - textSize.width) / 2.f) + 1, floor ((rect.size.height - textSize.height) / 2.f) + 1)
            withAttributes: @{NSFontAttributeName: self.font, NSForegroundColorAttributeName: self.textColor}];
}

- (void) dealloc;
{
    self.text           = nil;
    self.font           = nil;
    self.textColor      = nil;
    self.badgeColor     = nil;
    self.shadowColor    = nil;
    
    [super dealloc];
}

@end
