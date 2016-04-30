// Copyright (c) 2013 Ben Vogelzang
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "RCUISwitch.h"
#import <QuartzCore/QuartzCore.h>

static NSString *kRCUISwitchCodingOnTintColorKey      = @"RCUISwitchCodingOnTintColorKey";
static NSString *kRCUISwitchCodingTintColorKey        = @"RCUISwitchCodingTintColorKey";
static NSString *kRCUISwitchCodingActiveColorKey      = @"RCUISwitchCodingActiveColorKey";
static NSString *kRCUISwitchCodingBorderColorKey      = @"RCUISwitchCodingBorderColorKey";
static NSString *kRCUISwitchCodingThumbTintColorKey   = @"RCUISwitchCodingThumbTintColorKey";
static NSString *kRCUISwitchCodingThumbShadowColorKey = @"RCUISwitchCodingThumbShadowColorKey";
static NSString *kRCUISwitchCodingOnImageKey          = @"RCUISwitchCodingOnImageKey";
static NSString *kRCUISwitchCodingOffImageKey         = @"RCUISwitchCodingOffImageKey";
static NSString *kRCUISwitchCodingOnKey               = @"RCUISwitchCodingOnKey";

@interface RCUISwitch ()

@property (nonatomic, retain) UIView        *backgroundView;
@property (nonatomic, retain) UIView        *thumbView;
@property (nonatomic, retain) UIImageView   *onImageView;
@property (nonatomic, retain) UIImageView   *offImageView;
@property (nonatomic, assign) BOOL          currentValue;
@property (nonatomic, assign) BOOL          isStartTracking;
@property (nonatomic, assign) BOOL          didChangeWhileTracking;
@property (nonatomic, assign) BOOL          isAnimating;

- (void) showOn: (BOOL)animated;
- (void) showOff: (BOOL)animated;
- (void) configuration;

@end

@implementation RCUISwitch

- (id) init;
{
    self = [super initWithFrame: CGRectMake (0, 0, 50, 30)];
    
    if (self)
    {
        [self configuration];
    }
    
    return self;
}

- (id) initWithFrame: (CGRect)frame;
{
    if (CGRectIsEmpty (frame))
    {
        frame = CGRectMake (0, 0, 50, 30);
    }
    
    self = [super initWithFrame: frame];
    
    if (self)
    {
        [self configuration];
    }
    
    return self;
}

- (id) initWithCoder: (NSCoder *)aDecoder;
{
    self = [super initWithCoder: aDecoder];
    
    if (self)
    {
        self.onTintColor        = [aDecoder decodeObjectForKey: kRCUISwitchCodingOnTintColorKey];
        self.tintColor          = [aDecoder decodeObjectForKey: kRCUISwitchCodingTintColorKey];
        self.activeColor        = [aDecoder decodeObjectForKey: kRCUISwitchCodingActiveColorKey];
        self.borderColor        = [aDecoder decodeObjectForKey: kRCUISwitchCodingBorderColorKey];
        self.thumbTintColor     = [aDecoder decodeObjectForKey: kRCUISwitchCodingThumbTintColorKey];
        self.thumbShadowColor   = [aDecoder decodeObjectForKey: kRCUISwitchCodingThumbShadowColorKey];
        self.onImage            = [aDecoder decodeObjectForKey: kRCUISwitchCodingOnImageKey];
        self.offImage           = [aDecoder decodeObjectForKey: kRCUISwitchCodingOffImageKey];
        self.on                 = [aDecoder decodeBoolForKey: kRCUISwitchCodingOnKey];
        [self configuration];
    }
    
    return self;
}

- (void) encodeWithCoder: (NSCoder *)aCoder;
{
    [super encodeWithCoder: aCoder];
    
    [aCoder encodeObject: self.onTintColor forKey: kRCUISwitchCodingOnTintColorKey];
    [aCoder encodeObject: self.tintColor forKey: kRCUISwitchCodingTintColorKey];
    [aCoder encodeObject: self.activeColor forKey: kRCUISwitchCodingActiveColorKey];
    [aCoder encodeObject: self.borderColor forKey: kRCUISwitchCodingBorderColorKey];
    [aCoder encodeObject: self.thumbTintColor forKey: kRCUISwitchCodingThumbTintColorKey];
    [aCoder encodeObject: self.thumbShadowColor forKey: kRCUISwitchCodingThumbShadowColorKey];
    [aCoder encodeObject: self.onImage forKey: kRCUISwitchCodingOnImageKey];
    [aCoder encodeObject: self.offImage forKey: kRCUISwitchCodingOffImageKey];
    [aCoder encodeBool: self.on forKey: kRCUISwitchCodingOnKey];
}

- (void) configuration;
{
    self.isAccessibilityElement = YES;
    self.on = NO;
    self.onTintColor        = [UIColor colorWithRed: 0.30f green: 0.85f blue: 0.39f alpha: 0.f];
    self.tintColor          = [UIColor clearColor];
    self.activeColor        = [UIColor colorWithRed: 0.89f green: 0.89f blue: 0.89f alpha: 0.f];
    self.borderColor        = [UIColor colorWithRed: 0.89f green: 0.89f blue: 0.91f alpha: 0.f];
    self.thumbTintColor     = [UIColor whiteColor];
    self.thumbShadowColor   = [UIColor grayColor];
    
    self.currentValue       = NO;
    self.isAnimating        = NO;
    
    self.backgroundView = [[[UIView alloc] initWithFrame: self.frame] autorelease];
    self.backgroundView.backgroundColor = [UIColor clearColor];
    self.backgroundView.layer.cornerRadius = self.frame.size.height * 0.5;
    self.backgroundView.layer.borderColor  = self.borderColor.CGColor;
    self.backgroundView.layer.borderWidth  = 1.f;
    self.backgroundView.userInteractionEnabled = NO;
    self.backgroundView.clipsToBounds = YES;
    [self addSubview: self.backgroundView];
    
    self.onImageView = [[[UIImageView alloc] initWithFrame: self.frame] autorelease];
    self.onImageView.alpha = 0;
    self.onImageView.contentMode = UIViewContentModeCenter;
    [self.backgroundView addSubview: self.onImageView];
    
    self.offImageView = [[[UIImageView alloc] initWithFrame: self.frame] autorelease];
    self.offImageView.alpha = 1.f;
    self.offImageView.contentMode = UIViewContentModeCenter;
    [self.backgroundView addSubview: self.offImageView];
    
    self.thumbView = [[[UIView alloc] initWithFrame: CGRectMake (1, 1, self.frame.size.height - 2, self.frame.size.height - 2)] autorelease];
    self.thumbView.backgroundColor = self.thumbTintColor;
    self.thumbView.layer.cornerRadius = (self.frame.size.height * 0.5) - 1;

    if (self.thumbShadowColor)
    {
        self.thumbView.layer.shadowColor = self.thumbShadowColor.CGColor;
        self.thumbView.layer.shadowRadius = 1;
        self.thumbView.layer.shadowOpacity = 0.4f;
        self.thumbView.layer.shadowOffset = CGSizeMake (0, 1);
        self.thumbView.layer.shadowPath =  [UIBezierPath bezierPathWithRoundedRect: self.thumbView.bounds cornerRadius: self.thumbView.layer.cornerRadius].CGPath;
    }
    
    self.thumbView.layer.masksToBounds = NO;
    self.thumbView.userInteractionEnabled = NO;
    [self addSubview: self.thumbView];
}

- (BOOL) beginTrackingWithTouch: (UITouch *)touch withEvent: (UIEvent *)event;
{
    [super beginTrackingWithTouch: touch withEvent: event];

    self.isStartTracking = self.on;
    self.didChangeWhileTracking = NO;
    
    CGFloat largerThumbWidth = self.bounds.size.height - 2 + 5;
    self.isAnimating = YES;
    
    [UIView animateWithDuration: 0.3
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                     animations:
     ^{
        if (self.on)
        {
            self.thumbView.frame = CGRectMake (self.bounds.size.width - (largerThumbWidth + 1), self.thumbView.frame.origin.y, largerThumbWidth, self.thumbView.frame.size.height);
            self.backgroundView.backgroundColor = self.onTintColor;
        }
        else
        {
            self.thumbView.frame = CGRectMake (self.thumbView.frame.origin.x, self.thumbView.frame.origin.y, largerThumbWidth, self.thumbView.frame.size.height);
            self.backgroundView.backgroundColor = self.activeColor;
        }
     }
                     completion: ^(BOOL finished)
    {
        self.isAnimating = NO;
    }];
    
    return YES;
}

- (BOOL) continueTrackingWithTouch: (UITouch *)touch withEvent: (UIEvent *)event;
{
    [super continueTrackingWithTouch: touch withEvent: event];
    
    CGPoint lastPoint = [touch locationInView: self];
    if (lastPoint.x > self.bounds.size.width * 0.5)
    {
        [self showOn: YES];
        if (!self.isStartTracking)
        {
            self.didChangeWhileTracking = YES;
        }
    }
    else
    {
        [self showOff: YES];
        if (self.isStartTracking)
        {
            self.didChangeWhileTracking = YES;
        }
    }
    
    return YES;
}

- (void) endTrackingAction;
{
    BOOL shouldChange = YES;
    
    if ([self.delegate respondsToSelector: @selector(swichControlShouldBeginChange)])
    {
        shouldChange = [self.delegate swichControlShouldBeginChange];
    }
    
    if (shouldChange)
    {
        BOOL previousValue = self.on;
        
        if (self.didChangeWhileTracking)
        {
            [self setOn: self.currentValue animated: YES];
        }
        else
        {
            [self setOn: !self.on animated: YES];
        }
        
        if (previousValue != self.on)
        {
            [self sendActionsForControlEvents: UIControlEventValueChanged];
        }
    }
}

- (void) endTrackingWithTouch: (UITouch *)touch withEvent: (UIEvent *)event;
{
    [super endTrackingWithTouch: touch withEvent: event];
    [self endTrackingAction];
}

- (void) cancelTrackingWithEvent: (UIEvent *)event;
{
    [super cancelTrackingWithEvent: event];
    [self endTrackingAction];
}

- (void) setOn: (BOOL)on;
{
    [self setOn: on animated: NO];
}

- (void) setOn: (BOOL)on animated: (BOOL)animated;
{
    _on = on;
    
    if (on)
    {
        [self showOn: animated];
    }
    else
    {
        [self showOff: animated];
    }
}

- (void) showOn: (BOOL)animated;
{
    CGFloat thumbWidth = self.bounds.size.height - 2;
    CGFloat largerThumbWidth = thumbWidth + 5;
    
    if (animated)
    {
        self.isAnimating = YES;
        [UIView animateWithDuration: 0.3
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                         animations:
         ^{
                             
            if (self.tracking)
            {
                self.thumbView.frame = CGRectMake (self.bounds.size.width - (largerThumbWidth + 1), self.thumbView.frame.origin.y, largerThumbWidth, self.thumbView.frame.size.height);
            }
            else
            {
                self.thumbView.frame = CGRectMake (self.bounds.size.width - (thumbWidth + 1), self.thumbView.frame.origin.y, thumbWidth, self.thumbView.frame.size.height);
            }
            self.backgroundView.backgroundColor = self.onTintColor;
            self.backgroundView.layer.borderColor = self.borderColor.CGColor;
            self.onImageView.alpha = 1.0;
            self.offImageView.alpha = 0;
         }
                         completion: ^(BOOL finished)
        {
            self.isAnimating = NO;
        }];
    }
    else
    {
        if (self.tracking)
        {
            self.thumbView.frame = CGRectMake (self.bounds.size.width - (largerThumbWidth + 1), self.thumbView.frame.origin.y, largerThumbWidth, self.thumbView.frame.size.height);
        }
        else
        {
            self.thumbView.frame = CGRectMake (self.bounds.size.width - (thumbWidth + 1), self.thumbView.frame.origin.y, thumbWidth, self.thumbView.frame.size.height);
        }
        self.backgroundView.backgroundColor = self.onTintColor;
        self.backgroundView.layer.borderColor = self.borderColor.CGColor;
        self.onImageView.alpha = 1.0;
        self.offImageView.alpha = 0;
    }
    
    self.currentValue = YES;
}

- (void) showOff: (BOOL)animated;
{
    CGFloat thumbWidth = self.bounds.size.height - 2;
    CGFloat largerThumbWidth = thumbWidth + 5;
    
    if (animated)
    {
        self.isAnimating = YES;
        [UIView animateWithDuration: 0.3
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState
                         animations:
         ^{
             
             if (self.tracking)
             {
                 self.thumbView.frame = CGRectMake (1, self.thumbView.frame.origin.y, largerThumbWidth, self.thumbView.frame.size.height);
                 self.backgroundView.backgroundColor = self.activeColor;
             }
             else
             {
                 self.thumbView.frame = CGRectMake (1, self.thumbView.frame.origin.y, thumbWidth, self.thumbView.frame.size.height);
                 self.backgroundView.backgroundColor = self.tintColor;
             }
             self.backgroundView.layer.borderColor = self.borderColor.CGColor;
             self.onImageView.alpha = 0;
             self.offImageView.alpha = 1.0;
         }
                         completion: ^(BOOL finished)
         {
             self.isAnimating = NO;
         }];
    }
    else
    {
        if (self.tracking)
        {
            self.thumbView.frame = CGRectMake (1, self.thumbView.frame.origin.y, largerThumbWidth, self.thumbView.frame.size.height);
            self.backgroundView.backgroundColor = self.activeColor;
        }
        else
        {
            self.thumbView.frame = CGRectMake (1, self.thumbView.frame.origin.y, thumbWidth, self.thumbView.frame.size.height);
            self.backgroundView.backgroundColor = self.tintColor;
        }
        self.backgroundView.layer.borderColor = self.borderColor.CGColor;
        self.onImageView.alpha = 0;
        self.offImageView.alpha = 1.0;
    }
    
    self.currentValue = NO;
}

- (void) layoutSubviews;
{
    [super layoutSubviews];
    
    if (!self.isAnimating)
    {
        self.backgroundView.frame = self.bounds;
        self.onImageView.frame = self.backgroundView.bounds;
        self.offImageView.frame = self.backgroundView.bounds;
        CGFloat thumbWidth = self.bounds.size.height - 2;
        
        if (self.on)
        {
            self.thumbView.frame = CGRectMake (self.bounds.size.width - (thumbWidth + 1), 1, self.bounds.size.height - 2, thumbWidth);
        }
        else
        {
            self.thumbView.frame = CGRectMake (1, 1, thumbWidth, thumbWidth);
        }
    }
}

- (void) setOnTintColor: (UIColor *)onTintColor;
{
    if (_onTintColor != onTintColor)
    {
        [_onTintColor release];
        _onTintColor = [onTintColor retain];
        
        if (self.on && !self.isTracking)
        {
            self.backgroundView.backgroundColor = onTintColor;
        }
    }
}

- (void) setTintColor: (UIColor *)tintColor;
{
    if (_tintColor != tintColor)
    {
        [_tintColor release];
        _tintColor = [tintColor retain];
        
        if (!self.on && !self.isTracking)
        {
            self.backgroundView.backgroundColor = tintColor;
        }
    }
}

- (void) setBorderColor: (UIColor *)borderColor;
{
    if (_borderColor != borderColor)
    {
        [_borderColor release];
        _borderColor = [borderColor retain];
        
        if (!self.on)
        {
            self.backgroundView.layer.borderColor = borderColor.CGColor;
        }
    }
}

- (void) setThumbTintColor: (UIColor *)thumbTintColor;
{
    if (_thumbTintColor != thumbTintColor)
    {
        [_thumbTintColor release];
        _thumbTintColor = [thumbTintColor retain];
        self.thumbView.backgroundColor = thumbTintColor;
    }
}

- (void) setThumbShadowColor: (UIColor *)thumbShadowColor;
{
    if (_thumbShadowColor != thumbShadowColor)
    {
        [_thumbShadowColor release];
        _thumbShadowColor = [thumbShadowColor retain];
        self.thumbView.layer.shadowColor = thumbShadowColor.CGColor;
    }
}

- (void) setOnImage: (UIImage *)onImage;
{
    if (_onImage != onImage)
    {
        [_onImage release];
        _onImage = [onImage retain];
        self.onImageView.image = onImage;
    }
}

- (void) setOffImage: (UIImage *)offImage;
{
    if (_offImage != offImage)
    {
        [_offImage release];
        _offImage = [offImage retain];
        self.offImageView.image = offImage;
    }
}

- (void) dealloc;
{
    self.delegate = nil;
    self.onTintColor        = nil;
    self.tintColor          = nil;
    self.activeColor        = nil;
    self.borderColor        = nil;
    self.thumbTintColor     = nil;
    self.thumbShadowColor   = nil;
    self.onImage            = nil;
    self.offImage           = nil;
    
    self.backgroundView     = nil;
    self.thumbView          = nil;
    self.onImageView        = nil;
    self.offImageView       = nil;
    
    [super dealloc];
}

@end
