//
//  UIImage+RCUIPathCategory.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/11/14.
//
//

#import "UIImage+RCUIPathCategory.h"
#import "UIImage+RCUIStretchable.h"
#import "UIFont+RCUILineHeight.h"
#import "RCUIGlobalCommon.h"
#import "RCUIGlobalStyle.h"
#import <CoreText/CoreText.h>

#define kDefaultKeypadTitleFont             RCUIThinSystemFont( (RCUIIsIPAD () ? (RCUIIsOrientationLandscapeSupported() ? 40 : 46) : RCUIIsIPHONE4 () ? 31 : 34) )
#define kDefaultKeypadSubTitleFont          RCUIMediumSystemFont( (RCUIIsIPAD () ? (RCUIIsOrientationLandscapeSupported() ? 9 : 11) : RCUIIsIPHONE4 () ? 9 : 10) )
#define kPlusKeypadSubTitleFont             RCUIMediumSystemFont( (RCUIIsIPAD () ? (RCUIIsOrientationLandscapeSupported() ? 17 : 20) : RCUIIsIPHONE4 () ? 13 : 16) )
#define kDefaultKeypadStarTitleFont         RCUIUltraLightSystemFont( (RCUIIsIPAD () ? (RCUIIsOrientationLandscapeSupported() ? 69 : 77) : RCUIIsIPHONE4 () ? 53 : 59) )

@implementation UIImage (RCUIPathCategory)

+ (UIImage *) uiLineImageWithColor: (UIColor *)color;
{
    CGRect rect= CGRectMake (0.f, 0.f, 10.f, 1.f);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetFillColorWithColor (context, [color CGColor]);
    CGContextFillRect (context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithColor: (UIColor *)color;
{
    CGRect rect= CGRectMake (0.0f, 0.0f, 10.0f, 10.0f);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetFillColorWithColor (context, [color CGColor]);
    CGContextFillRect (context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (1, 1, 1, 1)];
}

+ (UIImage *) uiEmptyImageWithSize: (CGSize)size;
{
    CGRect rect= CGRectMake (0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions (size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetFillColorWithColor (context, [[UIColor clearColor] CGColor]);
    CGContextFillRect (context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithColors: (NSArray *)colors rect: (CGRect)rect;
{
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    
    CGContextSaveGState (context);
    CGContextClipToRect (context, rect);
    
    NSUInteger colorCount = colors.count;
    NSUInteger numOfComponents = 4;
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB ();
    CGFloat colorComponents[colorCount * numOfComponents];
    for (NSUInteger i = 0; i < colorCount; i++)
    {
        UIColor *color = colors[i];
        CGColorRef temcolorRef = color.CGColor;
        const CGFloat *components = CGColorGetComponents(temcolorRef);
        for (NSUInteger j = 0; j < numOfComponents; ++j)
        {
            colorComponents[i * numOfComponents + j] = components[j];
        }
    }
    
    CGGradientRef gradient =  CGGradientCreateWithColorComponents (rgb, colorComponents, NULL, colorCount);
    CGColorSpaceRelease (rgb);
    CGPoint startPoint = rect.origin;
    CGPoint endPoint = CGPointMake (CGRectGetMinX (rect), CGRectGetMaxY (rect));
    CGContextDrawLinearGradient (context, gradient, startPoint, endPoint, kCGGradientDrawsAfterEndLocation);
    CGGradientRelease (gradient);
    CGContextRestoreGState (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiCircleImageWithImage: (UIImage *)image withCornerRadius: (CGFloat)raduis;
{
    UIGraphicsBeginImageContextWithOptions (image.size, NO, 0.0);
    CGRect bounds = (CGRect){ CGPointZero, image.size };
    [[UIBezierPath bezierPathWithRoundedRect: bounds
                                cornerRadius: raduis] addClip];
    [image drawInRect: bounds];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    
    return theImage;
}

+ (UIImage *) uiImageWithBackIndicatorColor: (UIColor *)color lineWidth: (CGFloat)lineWidth;
{
    CGRect rect = CGRectMake (0, 0, 12, 24);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetStrokeColorWithColor (context, color.CGColor);
    CGContextSetLineWidth (context, lineWidth);
    CGContextSetLineJoin (context, kCGLineJoinMiter);
    CGContextSetLineCap  (context, kCGLineCapRound);
    
    CGContextMoveToPoint (context, rect.size.width - 1.f, rect.origin.y + 3.f);
    CGContextAddLineToPoint (context, rect.origin.x + 1.f, rect.size.height / 2);
    CGContextAddLineToPoint (context, rect.size.width - 1.f, rect.size.height - 3.f);
    
    CGContextStrokePath (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithMenuIndicatorColor: (UIColor *)color lineWidth: (CGFloat)lineWidth;
{
    CGRect rect = CGRectMake (0, 0, 22, 22);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetStrokeColorWithColor (context, color.CGColor);
    CGContextSetLineWidth (context, lineWidth);
    
    CGContextMoveToPoint (context, rect.origin.x, rect.origin.y + 4);
    CGContextAddLineToPoint (context, rect.size.width, rect.origin.y + 4);
    
    CGContextMoveToPoint (context, rect.origin.x, rect.origin.y + 10);
    CGContextAddLineToPoint (context, rect.size.width, rect.origin.y + 10);
    
    CGContextMoveToPoint (context, rect.origin.x, rect.origin.y + 16);
    CGContextAddLineToPoint (context, rect.size.width, rect.origin.y + 16);
    
    CGContextStrokePath (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithPopoverIndicatorColor: (UIColor *)color lineWidth: (CGFloat)lineWidth;
{
    CGRect rect = CGRectMake (0, 0, 24, 12);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetStrokeColorWithColor (context, color.CGColor);
    CGContextSetLineWidth (context, lineWidth);
    CGContextSetLineJoin (context, kCGLineJoinMiter);
    CGContextSetLineCap  (context, kCGLineCapRound);
    
    CGContextMoveToPoint (context, rect.origin.x + 3.f, rect.origin.y + 1.f);
    CGContextAddLineToPoint (context, rect.size.width / 2, rect.size.height - 2.f);
    CGContextAddLineToPoint (context, rect.size.width - 3.f, rect.origin.y + 1.f);
    
    CGContextStrokePath (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithCheckColor: (UIColor *)color lineWidth: (CGFloat)lineWidth;
{
    CGRect rect = CGRectMake (0, 0, 18, 12);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetStrokeColorWithColor (context, color.CGColor);
    CGContextSetLineWidth (context, lineWidth);
    CGContextSetLineJoin (context, kCGLineJoinMiter);
    CGContextSetLineCap  (context, kCGLineCapRound);
    
    CGContextMoveToPoint (context, rect.origin.x + 3.f, rect.origin.y + 8.f);
    CGContextAddLineToPoint (context, rect.size.width / 2 - 3.f, rect.size.height - 1.f);
    CGContextAddLineToPoint (context, rect.size.width - 4.f, rect.origin.y + 3.f);
    
    CGContextStrokePath (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithCloseColor: (UIColor *)color lineWidth: (CGFloat)lineWidth;
{
    CGRect rect = CGRectMake (0, 0, 10, 10);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetStrokeColorWithColor (context, color.CGColor);
    CGContextSetLineWidth (context, lineWidth);
    CGContextSetLineJoin (context, kCGLineJoinRound);
    CGContextSetLineCap  (context, kCGLineCapRound);
    
    CGContextMoveToPoint (context, rect.origin.x, rect.origin.y);
    CGContextAddLineToPoint (context, rect.size.width, rect.size.height);
    CGContextMoveToPoint (context, rect.origin.x, rect.size.height);
    CGContextAddLineToPoint (context, rect.size.width, rect.origin.y);
    
    CGContextStrokePath (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithEllipsesColor: (UIColor *)color;
{
    CGRect rect = CGRectMake (0, 0, 11, 25);
    
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);

    CGFloat radius = 5.f;
    UIBezierPath *ellipseBezierPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake ((rect.size.width - radius) / 2, 1, radius, radius) cornerRadius: radius / 2];
    [color setFill];
    [ellipseBezierPath fill];
    
    ellipseBezierPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake ((rect.size.width - radius) / 2, 1 + radius + 4, radius, radius) cornerRadius: radius / 2];
    [color setFill];
    [ellipseBezierPath fill];
    
    ellipseBezierPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake ((rect.size.width - radius) / 2, 1 + (radius + 4) * 2, radius, radius) cornerRadius: radius / 2];
    [color setFill];
    [ellipseBezierPath fill];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithArrowColor: (UIColor *)color direction: (RCUIArrowDirection)direction lineWidth: (CGFloat)lineWidth size: (CGSize)size;
{
    CGRect rect = CGRectMake (0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetStrokeColorWithColor (context, color.CGColor);
    CGContextSetLineWidth (context, lineWidth);
    CGContextSetLineJoin (context, kCGLineJoinMiter);
    
    switch (direction)
    {
    case RCUIArrowDirectionLeft:
        {
            CGContextMoveToPoint (context, rect.size.width - 4.f, rect.origin.y + 4.f);
            CGContextAddLineToPoint (context, rect.origin.x + 4.f, rect.size.height / 2);
            CGContextAddLineToPoint (context, rect.size.width - 4.f, rect.size.height - 4.f);
        }
        break;
            
    case RCUIArrowDirectionRight:
        {
            CGContextMoveToPoint (context, rect.origin.x + 4.f, rect.origin.y + 4.f);
            CGContextAddLineToPoint (context, rect.size.width - 4.f, rect.size.height / 2);
            CGContextAddLineToPoint (context, rect.origin.x + 4.f, rect.size.height - 4.f);
        }
        break;
            
    case RCUIArrowDirectionUp:
        {
            CGContextMoveToPoint (context, rect.origin.x + 4.f, rect.size.height - 4.f);
            CGContextAddLineToPoint (context, rect.size.width / 2, rect.origin.y + 4.f);
            CGContextAddLineToPoint (context, rect.size.width - 4.f, rect.size.height - 4.f);
        }
        break;
            
    case RCUIArrowDirectionDown:
        {
            CGContextMoveToPoint (context, rect.origin.x + 4.f, rect.origin.y + 4.f);
            CGContextAddLineToPoint (context, rect.size.width / 2, rect.size.height - 4.f);
            CGContextAddLineToPoint (context, rect.size.width - 4.f, rect.origin.y + 4.f);
        }
        break;
    }
    
    CGContextStrokePath (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithArrowColor: (UIColor *)color direction: (RCUIArrowDirection)direction lineWidth: (CGFloat)lineWidth;
{
    CGRect rect = (direction == RCUIArrowDirectionLeft || direction == RCUIArrowDirectionRight) ? CGRectMake (0, 0, 13, 18) : CGRectMake (0, 0, 18, 13);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetStrokeColorWithColor (context, color.CGColor);
    CGContextSetLineWidth (context, lineWidth);
    CGContextSetLineJoin (context, kCGLineJoinMiter);
    CGContextSetLineCap  (context, kCGLineCapRound);
    
    switch (direction)
    {
    case RCUIArrowDirectionLeft:
        {
            CGContextMoveToPoint (context, rect.size.width - 4.f, rect.origin.y + 4.f);
            CGContextAddLineToPoint (context, rect.origin.x + 4.f, rect.size.height / 2);
            CGContextAddLineToPoint (context, rect.size.width - 4.f, rect.size.height - 4.f);
        }
        break;
            
    case RCUIArrowDirectionRight:
        {
            CGContextMoveToPoint (context, rect.origin.x + 4.f, rect.origin.y + 4.f);
            CGContextAddLineToPoint (context, rect.size.width - 4.f, rect.size.height / 2);
            CGContextAddLineToPoint (context, rect.origin.x + 4.f, rect.size.height - 4.f);
        }
        break;
            
    case RCUIArrowDirectionUp:
        {
            CGContextMoveToPoint (context, rect.origin.x + 4.f, rect.size.height - 4.f);
            CGContextAddLineToPoint (context, rect.size.width / 2, rect.origin.y + 4.f);
            CGContextAddLineToPoint (context, rect.size.width - 4.f, rect.size.height - 4.f);
        }
        break;
            
    case RCUIArrowDirectionDown:
        {
            CGContextMoveToPoint (context, rect.origin.x + 4.f, rect.origin.y + 4.f);
            CGContextAddLineToPoint (context, rect.size.width / 2, rect.size.height - 4.f);
            CGContextAddLineToPoint (context, rect.size.width - 4.f, rect.origin.y + 4.f);
        }
        break;
    }
    
    CGContextStrokePath (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithArrowColor: (UIColor *)color direction: (RCUIArrowDirection)direction;
{
    return [UIImage uiImageWithArrowColor: color direction: direction lineWidth: 1.f];
}

+ (UIImage *) uiImageWithAccessoryRadius: (CGFloat)radius direction: (RCUIArrowDirection)direction fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
{
    CGRect rect = CGRectMake (0, 0, 2 * radius, 2 * radius);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetLineWidth (context, borderWidth);
    CGContextSetLineJoin (context, kCGLineJoinMiter);
    CGContextSetLineCap  (context, kCGLineCapRound);
    
    if (borderColor)
    {
        CGContextSetStrokeColorWithColor (context, borderColor.CGColor);
    }
    else
    {
        CGContextSetStrokeColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    if (fillColor)
    {
        CGContextSetFillColorWithColor (context, fillColor.CGColor);
    }
    else
    {
        CGContextSetFillColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    CGContextAddArc (context, radius, radius, radius - 1, 0, 2 * M_PI, 0);
    CGContextDrawPath (context, kCGPathFillStroke);
    
    switch (direction)
    {
    case RCUIArrowDirectionLeft:
        {
            CGContextMoveToPoint (context, rect.size.width - 9.f, rect.origin.y + 7.f);
            CGContextAddLineToPoint (context, rect.origin.x + 8.f, rect.size.height / 2);
            CGContextAddLineToPoint (context, rect.size.width - 9.f, rect.size.height - 7.f);
        }
        break;
            
    case RCUIArrowDirectionRight:
        {
            CGContextMoveToPoint (context, rect.origin.x + 9.f, rect.origin.y + 7.f);
            CGContextAddLineToPoint (context, rect.size.width - 8.f, rect.size.height / 2);
            CGContextAddLineToPoint (context, rect.origin.x + 9.f, rect.size.height - 7.f);
        }
        break;
            
    case RCUIArrowDirectionUp:
        {
            CGContextMoveToPoint (context, rect.origin.x + 7.f, rect.size.height - 9.f);
            CGContextAddLineToPoint (context, rect.size.width / 2, rect.origin.y + 8.f);
            CGContextAddLineToPoint (context, rect.size.width - 7.f, rect.size.height - 9.f);
        }
        break;
            
    case RCUIArrowDirectionDown:
        {
            CGContextMoveToPoint (context, rect.origin.x + 7.f, rect.origin.y + 9.f);
            CGContextAddLineToPoint (context, rect.size.width / 2, rect.size.height - 8.f);
            CGContextAddLineToPoint (context, rect.size.width - 7.f, rect.origin.y + 9.f);
        }
        break;
    }
    
    CGContextStrokePath (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithAccessoryRadius: (CGFloat)radius direction: (RCUIArrowDirection)direction fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithAccessoryRadius: radius direction: direction fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithAccessoryRadius: (CGFloat)radius direction: (RCUIArrowDirection)direction fillColor: (UIColor *)fillColor;
{
    return [UIImage uiImageWithAccessoryRadius: radius direction: direction fillColor: fillColor borderColor: nil];
}

+ (UIImage *) uiImageWithAccessoryRadius: (CGFloat)radius direction: (RCUIArrowDirection)direction borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithAccessoryRadius: radius direction: direction fillColor: nil borderColor: borderColor];
}

+ (UIImage *) uiImageWithAddRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
{
    CGRect rect = CGRectMake (0, 0, 2 * radius, 2 * radius);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetLineWidth (context, borderWidth);
    
    if (borderColor)
    {
        CGContextSetStrokeColorWithColor (context, borderColor.CGColor);
    }
    else
    {
        CGContextSetStrokeColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    if (fillColor)
    {
        CGContextSetFillColorWithColor (context, fillColor.CGColor);
    }
    else
    {
        CGContextSetFillColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    CGContextAddArc (context, radius, radius, radius - 1, 0, 2 * M_PI, 0);
    CGContextDrawPath (context, fillColor ? kCGPathFill : kCGPathFillStroke);
    
    CGContextMoveToPoint (context, rect.origin.x + floor (radius / 2), rect.origin.y + radius);
    CGContextAddLineToPoint (context, rect.size.width - floor (radius / 2), rect.origin.y + radius);
    CGContextStrokePath (context);
    
    CGContextMoveToPoint (context, rect.origin.x + radius, rect.origin.y + floor (radius / 2));
    CGContextAddLineToPoint (context, rect.origin.x + radius, rect.size.height - floor (radius / 2));
    CGContextStrokePath (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithAddRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithAddRadius: radius fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithAddRadius: (CGFloat)radius fillColor: (UIColor *)fillColor;
{
    return [UIImage uiImageWithAddRadius: radius fillColor: fillColor borderColor: nil];
}

+ (UIImage *) uiImageWithAddRadius: (CGFloat)radius borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithAddRadius: radius fillColor: nil borderColor: borderColor];
}

+ (UIImage *) uiImageWithDeleteRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
{
    CGRect rect = CGRectMake (0, 0, 2 * radius, 2 * radius);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    
    if (fillColor)
    {
        CGContextSetFillColorWithColor (context, fillColor.CGColor);
    }
    else
    {
        CGContextSetFillColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    CGContextAddArc (context, radius, radius, radius - 1, 0, 2 * M_PI, 0);
    CGContextDrawPath (context, kCGPathFill);
    
    CGContextSetLineWidth (context, borderWidth);
    if (borderColor)
    {
        CGContextSetStrokeColorWithColor (context, borderColor.CGColor);
    }
    else
    {
        CGContextSetStrokeColorWithColor (context, [UIColor clearColor].CGColor);
    }
    CGContextMoveToPoint (context, rect.origin.x + floor (radius / 2), rect.origin.y + radius);
    CGContextAddLineToPoint (context, rect.size.width - floor (radius / 2), rect.origin.y + radius);
    CGContextStrokePath (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithDeleteRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithDeleteRadius: radius fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithDeleteRadius: (CGFloat)radius fillColor: (UIColor *)fillColor;
{
    return [UIImage uiImageWithDeleteRadius: radius fillColor: fillColor borderColor: nil];
}

+ (UIImage *) uiImageWithDeleteRadius: (CGFloat)radius borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithDeleteRadius: radius fillColor: nil borderColor: borderColor];
}

+ (UIImage *) uiImageWithCheckRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
{
    CGRect rect = CGRectMake (0, 0, 2 * radius, 2 * radius);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    
    if (fillColor)
    {
        CGContextSetFillColorWithColor (context, fillColor.CGColor);
    }
    else
    {
        CGContextSetFillColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    CGContextAddArc (context, radius, radius, radius - 1, 0, 2 * M_PI, 0);
    CGContextDrawPath (context, kCGPathFill);
    
    CGContextSetLineWidth (context, borderWidth);
    CGContextSetLineJoin (context, kCGLineJoinMiter);
    CGContextSetLineCap  (context, kCGLineCapRound);
    if (borderColor)
    {
        CGContextSetStrokeColorWithColor (context, borderColor.CGColor);
    }
    else
    {
        CGContextSetStrokeColorWithColor (context, [UIColor clearColor].CGColor);
    }
    CGContextMoveToPoint (context, rect.origin.x + floor (radius / 2), rect.origin.y + radius);
    CGContextAddLineToPoint (context, rect.origin.x + floor (radius / 2) + 4., rect.origin.y + radius + 4.);
    CGContextAddLineToPoint (context, rect.size.width - floor (radius / 2), rect.origin.y + floor (radius / 4) + 6.);
    CGContextStrokePath (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithCheckRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithCheckRadius: radius fillColor: fillColor borderColor: borderColor borderWidth: 1.];
}

+ (UIImage *) uiImageWithCheckRadius: (CGFloat)radius fillColor: (UIColor *)fillColor;
{
    return [UIImage uiImageWithCheckRadius: radius fillColor: fillColor borderColor: nil];
}

+ (UIImage *) uiImageWithCheckRadius: (CGFloat)radius borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithCheckRadius: radius fillColor: nil borderColor: borderColor];
}

+ (UIImage *) uiImageWithCloseRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
{
    CGRect rect = CGRectMake (0, 0, 2 * radius, 2 * radius);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetLineWidth (context, borderWidth);
    CGContextSetLineJoin (context, kCGLineJoinRound);
    CGContextSetLineCap  (context, kCGLineCapRound);
    
    if (borderColor)
    {
        CGContextSetStrokeColorWithColor (context, borderColor.CGColor);
    }
    else
    {
        CGContextSetStrokeColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    if (fillColor)
    {
        CGContextSetFillColorWithColor (context, fillColor.CGColor);
    }
    else
    {
        CGContextSetFillColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    CGContextAddArc (context, radius, radius, radius - 1, 0, 2 * M_PI, 0);
    CGContextDrawPath (context, kCGPathFillStroke);
    
    CGContextMoveToPoint (context, rect.origin.x + 5, rect.origin.y + 5);
    CGContextAddLineToPoint (context, rect.size.width - 5, rect.size.height - 5);
    CGContextMoveToPoint (context, rect.origin.x + 5, rect.size.height - 5);
    CGContextAddLineToPoint (context, rect.size.width - 5, rect.origin.y + 5);
    
    CGContextStrokePath (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithCloseRadius: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithCloseRadius: radius fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithCloseRadius: (CGFloat)radius fillColor: (UIColor *)fillColor;
{
    return [UIImage uiImageWithCloseRadius: radius fillColor: fillColor borderColor: nil];
}

+ (UIImage *) uiImageWithCloseRadius: (CGFloat)radius borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithCloseRadius: radius fillColor: nil borderColor: borderColor];
}

+ (UIImage *) uiImageWithBannerColor: (UIColor *)bannerColor lineColor: (UIColor *)lineColor lineEdge: (UIEdgeInsets)insets;
{
    CGRect rect = CGRectMake (0, 0, 44, 44);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [UIScreen mainScreen].scale);
    
    UIBezierPath *backgroundPath = [UIBezierPath bezierPathWithRect: rect];
    [bannerColor setFill];
    [backgroundPath fill];
    
    if (insets.left)
    {
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        [linePath moveToPoint: CGPointMake (rect.origin.x, rect.origin.y)];
        [linePath addLineToPoint: CGPointMake (rect.origin.x, rect.size.height)];
        [linePath setLineWidth: insets.left];
        [linePath closePath];
        [lineColor setStroke];
        [linePath stroke];
    }
    
    if (insets.right)
    {
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        [linePath moveToPoint: CGPointMake (rect.size.width, rect.origin.y)];
        [linePath addLineToPoint: CGPointMake (rect.size.width, rect.size.height)];
        [linePath setLineWidth: insets.right];
        [linePath closePath];
        [lineColor setStroke];
        [linePath stroke];
    }
    
    if (insets.top)
    {
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        [linePath moveToPoint: CGPointMake (rect.origin.x, rect.origin.y)];
        [linePath addLineToPoint: CGPointMake (rect.size.width, rect.origin.y)];
        [linePath setLineWidth: insets.top];
        [linePath closePath];
        [lineColor setStroke];
        [linePath stroke];
    }
    
    if (insets.bottom)
    {
        UIBezierPath *linePath = [UIBezierPath bezierPath];
        [linePath moveToPoint: CGPointMake (rect.origin.x, rect.size.height)];
        [linePath addLineToPoint: CGPointMake (rect.size.width, rect.size.height)];
        [linePath setLineWidth: insets.bottom];
        [linePath closePath];
        [lineColor setStroke];
        [linePath stroke];
    }
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return [theImage stretchableImageWithCapInsets: UIEdgeInsetsMake (insets.top + 1, insets.left + 1, insets.bottom + 1, insets.right + 1)];
}

+ (UIImage *) uiImageWithBezierType: (RCUIBezierType)bezierType fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor radius: (CGFloat)radius;
{
    CGRect rect = CGRectMake (0, 0, 44, 44);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [UIScreen mainScreen].scale);
    
    UIBezierPath *bezierPath = nil;
    switch (bezierType)
    {
    case RCUIBezierTypeNone:
        {
            bezierPath = [UIBezierPath bezierPathWithRect: rect];
        }
        break;
            
    case RCUIBezierTypeLeft:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeRight:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeTop:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeBottom:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeTopLeft:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerTopLeft cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeTopRight:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerTopRight cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeBottomLeft:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerBottomLeft cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeBottomRight:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerBottomRight cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeAll:
        {
             bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
        }
        break;
    }
    
    [bezierPath closePath];
    [bezierPath addClip];
    
    if (fillColor)
    {
        [fillColor setFill];
        [bezierPath fill];
    }
    
    if (borderColor)
    {
        [borderColor setStroke];
        bezierPath.lineWidth = 2;
        [bezierPath stroke];
    }
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();

    return [theImage stretchableImageWithCapInsets: (radius == 0.f) ? UIEdgeInsetsMake (1, 1, 1, 1) : UIEdgeInsetsMake (radius, radius, radius, radius)];
}

+ (UIImage *) uiImageWithBezierType: (RCUIBezierType)bezierType fillColor: (UIColor *)fillColor radius: (CGFloat)radius;
{
    return [UIImage uiImageWithBezierType: bezierType fillColor: fillColor borderColor: nil radius: radius];
}

+ (UIImage *) uiImageWithBezierType: (RCUIBezierType)bezierType borderColor: (UIColor *)borderColor radius: (CGFloat)radius;
{
    return [UIImage uiImageWithBezierType: bezierType fillColor: nil borderColor: borderColor radius: radius];
}

+ (UIImage *) uiImageWithBezierType: (RCUIBezierType)bezierType fillColors: (NSArray *)fillColors borderColor: (UIColor *)borderColor radius: (CGFloat)radius size: (CGSize)size;
{
    CGRect rect = CGRectMake (0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [UIScreen mainScreen].scale);
    
    UIBezierPath *bezierPath = nil;
    switch (bezierType)
    {
    case RCUIBezierTypeNone:
        {
            bezierPath = [UIBezierPath bezierPathWithRect: rect];
        }
        break;
            
    case RCUIBezierTypeLeft:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeRight:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeTop:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeBottom:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeTopLeft:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerTopLeft cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeTopRight:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerTopRight cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeBottomLeft:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerBottomLeft cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
        case RCUIBezierTypeBottomRight:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect byRoundingCorners: UIRectCornerBottomRight cornerRadii: CGSizeMake (radius, radius)];
        }
        break;
            
    case RCUIBezierTypeAll:
        {
            bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: radius];
        }
        break;
    }
    [bezierPath closePath];
    
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSaveGState (context);
    NSUInteger colorCount = fillColors.count;
    NSUInteger numOfComponents = 4;
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB ();
    CGFloat colorComponents[colorCount * numOfComponents];
    for (NSUInteger i = 0; i < colorCount; i++)
    {
        UIColor *color = fillColors[i];
        CGColorRef temcolorRef = color.CGColor;
        const CGFloat *components = CGColorGetComponents(temcolorRef);
        for (NSUInteger j = 0; j < numOfComponents; ++j)
        {
            colorComponents[i * numOfComponents + j] = components[j];
        }
    }
    
    CGGradientRef gradient =  CGGradientCreateWithColorComponents (rgb, colorComponents, NULL, colorCount);
    CGColorSpaceRelease (rgb);
    [bezierPath addClip];
    CGPoint startPoint = rect.origin;
    CGPoint endPoint = CGPointMake (CGRectGetMinX (rect), CGRectGetMaxY (rect));
    CGContextDrawLinearGradient (context, gradient, startPoint, endPoint, kCGGradientDrawsAfterEndLocation);
    if (borderColor)
    {
        [borderColor setStroke];
        bezierPath.lineWidth = 2;
        [bezierPath stroke];
    }
    CGGradientRelease (gradient);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithBezierType: (RCUIBezierType)bezierType fillColors: (NSArray *)fillColors radius: (CGFloat)radius size: (CGSize)size;
{
    return [UIImage uiImageWithBezierType: bezierType fillColors: fillColors borderColor: nil radius: radius size: size];
}

+ (UIImage *) uiImageWithBezierCircle: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
{
    CGRect rect = CGRectMake (0, 0, 2 * radius, 2 * radius);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [UIScreen mainScreen].scale);
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter: CGPointMake (radius, radius) radius: radius - 1 startAngle: 0 endAngle: M_PI * 2 clockwise: YES];
    [circlePath setLineWidth: borderWidth];
    if (borderColor)
    {
        [borderColor setStroke];
        [circlePath stroke];
    }
    if (fillColor)
    {
        [fillColor setFill];
        [circlePath fill];
    }
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithCircle: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
{
    CGRect rect = CGRectMake (0, 0, 2 * radius, 2 * radius);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetLineWidth (context, borderWidth);
    
    if (borderColor)
    {
        CGContextSetStrokeColorWithColor (context, borderColor.CGColor);
    }
    else
    {
        CGContextSetStrokeColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    if (fillColor)
    {
        CGContextSetFillColorWithColor (context, fillColor.CGColor);
    }
    else
    {
        CGContextSetFillColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    CGContextAddArc (context, radius, radius, radius - 1, 0, 2 * M_PI, 0);
    if (fillColor && borderColor)
    {
        CGContextDrawPath (context, kCGPathFillStroke);
    }
    else
    {
        if (fillColor)
        {
            CGContextDrawPath (context, kCGPathFill);
        }
        
        if (borderColor)
        {
            CGContextDrawPath (context, kCGPathStroke);
        }
    }

    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithCircle: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithCircle: radius fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithCircle: (CGFloat)radius fillColor: (UIColor *)fillColor;
{
    return [UIImage uiImageWithCircle: radius fillColor: fillColor borderColor: nil];
}

+ (UIImage *) uiImageWithCircle: (CGFloat)radius borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithCircle: radius fillColor: nil borderColor: borderColor];
}

+ (UIImage *) uiImageWithDashLine: (CGFloat)width lengths: (CGFloat *)pattern count: (NSInteger)count lineColor: (UIColor *)lineColor lineWidth: (CGFloat)lineWidth;
{
    CGRect rect = CGRectMake (0, 0, width, 1);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [UIScreen mainScreen].scale);
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint: CGPointMake (rect.origin.x, rect.origin.y)];
    [linePath addLineToPoint: CGPointMake (rect.size.width, rect.origin.y)];
    [lineColor setStroke];
    [linePath setLineWidth: lineWidth * [UIScreen mainScreen].scale];
    [linePath setLineDash: pattern count: count phase: 0];
    [linePath stroke];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithDashLine: (CGFloat)width lengths: (CGFloat *)pattern count: (NSInteger)count lineColor: (UIColor *)lineColor;
{
    return [UIImage uiImageWithDashLine: width lengths: pattern count: count lineColor: lineColor lineWidth: 1.f];
}

+ (UIImage *) uiImageWithSwitchON: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth size: (CGSize)size;
{
    CGRect rect = CGRectMake (0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [UIScreen mainScreen].scale);
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: size.height / 2];
    [((fillColor != nil) ? fillColor : [UIColor whiteColor]) setFill];
    [bezierPath fill];
    
    CGFloat lineHeight = ceil (size.height / 3);
    UIBezierPath *linePath = [UIBezierPath bezierPathWithRect: CGRectMake (size.height / 2, floor ((size.height - lineHeight) / 2), borderWidth, lineHeight)];
    [((borderColor != nil) ? borderColor : [UIColor whiteColor]) setFill];
    [linePath fill];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithSwitchOFF: (UIColor *)fillColor borderColor: (UIColor *)borderColor circleWidth: (CGFloat)circleWidth size: (CGSize)size;
{
    CGRect rect = CGRectMake (0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [UIScreen mainScreen].scale);
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect: rect cornerRadius: size.height / 2];
    [((fillColor != nil) ? fillColor : [UIColor whiteColor]) setFill];
    [((borderColor != nil) ? borderColor : [UIColor clearColor]) setStroke];
    [bezierPath fill];
    [bezierPath stroke];
    
    CGFloat radius = ceil (size.height / 6);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake (size.width - radius - size.height / 2, floor ((size.height - radius * 2) / 2), radius * 2, radius * 2) cornerRadius: radius];
    circlePath.lineWidth = circleWidth;
    [((borderColor != nil) ? borderColor : [UIColor clearColor]) setStroke];
    [circlePath stroke];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (CGSize) heightForString: (NSString *)value attributes: (NSDictionary *)attributes width: (CGFloat)width;
{
    NSMutableAttributedString *lineAttrString = [[[NSMutableAttributedString alloc] initWithString: value attributes: attributes] autorelease];
    CTLineRef hyphenLine = CTLineCreateWithAttributedString ((__bridge CFAttributedStringRef)lineAttrString);
    CTLineRef justifiedLine = CTLineCreateJustifiedLine (hyphenLine, 1.0, width);
    
    CGFloat ascent = 0.f, descent = 0.f, leading = 0.f;
    CTLineGetTypographicBounds (justifiedLine, &ascent, &descent, &leading);
    CFRelease (justifiedLine);
    CFRelease (hyphenLine);
    
    CGRect rect = CGRectZero;
    
    if ([value respondsToSelector: @selector (boundingRectWithSize:options:attributes:context:)])
    {
        rect = [value boundingRectWithSize: CGSizeMake (width, CGFLOAT_MAX)
                                   options: NSStringDrawingUsesLineFragmentOrigin
                                attributes: attributes
                                   context: nil];
    }
    else
    {
        rect.size = [value boundingRectWithSize: CGSizeMake (width, CGFLOAT_MAX)
                                        options: NSStringDrawingUsesLineFragmentOrigin
                                     attributes: @{NSFontAttributeName: attributes[NSFontAttributeName]}
                                        context: nil].size;
    }
    
    return CGSizeMake (floor (rect.size.width), RCUIIsIOSSDKVersionAbove7 () ? (floor (ascent - descent - leading + 0.5)) : (floor (ascent - descent + leading)));
}

#define kDefaultKeypadMargin (RCUIIsIPAD () ? (RCUIIsOrientationLandscapeSupported () ? 12 : 17) : RCUIIsIPHONE4 () ? 11 : RCUIIsIPHONE5() ? 14 : 17.5f)
+ (UIImage *) uiImageWithRadius: (CGFloat)radius title: (NSString *)title subtitle: (NSString *)subtitle
                      fontTitle: (UIFont *)fontTitle fontSubTitle: (UIFont *)fontSubTitle
                      fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
{
    CGRect rect = CGRectMake (0, 0, 2 * radius, 2 * radius);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetLineWidth (context, borderWidth);
    
    if (borderColor)
    {
        CGContextSetStrokeColorWithColor (context, borderColor.CGColor);
    }
    else
    {
        CGContextSetStrokeColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    if (fillColor)
    {
        CGContextSetFillColorWithColor (context, fillColor.CGColor);
    }
    else
    {
        CGContextSetFillColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    CGContextAddArc (context, radius, radius, radius - 1, 0, 2 * M_PI, 0);
    
    if (fillColor && borderColor)
    {
        CGContextDrawPath (context, kCGPathFill);
    }
    else
    {
        if (fillColor)
        {
            CGContextDrawPath (context, kCGPathFill);
        }
        
        if (borderColor)
        {
            CGContextDrawPath (context, kCGPathStroke);
        }
    }
    
    CGContextSaveGState (context);
    CGContextTranslateCTM (context, 0, rect.size.height);
    CGContextScaleCTM (context, 1.0, -1.0);
    CGContextSetTextMatrix (context, CGAffineTransformIdentity);

    NSMutableParagraphStyle *paragpraphTitle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragpraphTitle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributesTitle = @{
                                        NSFontAttributeName             : fontTitle,
                                        NSForegroundColorAttributeName  : borderColor,
                                        NSParagraphStyleAttributeName   : paragpraphTitle
                                     };
    
    if (subtitle)
    {
        {
            CGSize size = [UIImage heightForString: title attributes: attributesTitle width: rect.size.width];
            CGRect rectTitle = CGRectMake (floor ((rect.size.width - size.width) / 2), rect.size.height - size.height - kDefaultKeypadMargin, size.width, size.height);
            NSAttributedString *attributesTitleString = [[NSAttributedString alloc] initWithString: title attributes: attributesTitle];
            CGContextSetTextPosition (context, rectTitle.origin.x, rectTitle.origin.y + (RCUIIsIOSSDKVersionAbove7 () ? 0.f : 2.f));
            CTLineRef line = CTLineCreateWithAttributedString ((__bridge CFAttributedStringRef)attributesTitleString);
            CTLineDraw (line, context);
            CFRelease (line);
            [attributesTitleString release];
        }
        
        {
            if ([subtitle length])
            {
                NSMutableParagraphStyle *paragpraphSubTitle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
                paragpraphSubTitle.alignment = NSTextAlignmentCenter;
                
                NSDictionary *attributesSubTitle = @{
                                                     NSFontAttributeName             : fontSubTitle,
                                                     NSForegroundColorAttributeName  : borderColor,
                                                     NSParagraphStyleAttributeName   : paragpraphSubTitle
                                                     };
                
                CGSize size = [UIImage heightForString: subtitle attributes: attributesSubTitle width: rect.size.width];
                CGRect rectSubTitle = CGRectMake (floor ((rect.size.width - size.width) / 2), kDefaultKeypadMargin, size.width, size.height);
                NSAttributedString *attributesSubTitleString = [[NSAttributedString alloc] initWithString: subtitle attributes: attributesSubTitle];
                CGContextSetTextPosition (context, rectSubTitle.origin.x, rectSubTitle.origin.y);
                CTLineRef line = CTLineCreateWithAttributedString ((__bridge CFAttributedStringRef)attributesSubTitleString);
                CTLineDraw (line, context);
                CFRelease (line);
                [attributesSubTitleString release];
                [paragpraphSubTitle release];
            }
        }
    }
    else
    {
        CGSize size = [UIImage heightForString: title attributes: attributesTitle width: rect.size.width];
        CGRect rectTitle = CGRectMake (floor ((rect.size.width - size.width) / 2), floor ((rect.size.height - size.height) / 2), size.width, size.height);
        NSAttributedString *attributesTitleString = [[NSAttributedString alloc] initWithString: title attributes: attributesTitle];
        CGContextSetTextPosition (context, rectTitle.origin.x, rectTitle.origin.y + (RCUIIsIOSSDKVersionAbove7 () ? 0.f : 2.f));
        CTLineRef line = CTLineCreateWithAttributedString ((__bridge CFAttributedStringRef)attributesTitleString);
        CTLineDraw (line, context);
        CFRelease (line);
        [attributesTitleString release];
    }
    
    [paragpraphTitle release];
    CGContextRestoreGState (context);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

+ (UIImage *) uiImageWithKeypad1: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithRadius: radius title: @"1" subtitle: @""
                            fontTitle: kDefaultKeypadTitleFont fontSubTitle: kDefaultKeypadSubTitleFont
                            fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithKeypad2: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithRadius: radius title: @"2" subtitle: @"A B C"
                            fontTitle: kDefaultKeypadTitleFont fontSubTitle: kDefaultKeypadSubTitleFont
                            fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithKeypad3: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithRadius: radius title: @"3" subtitle: @"D E F"
                            fontTitle: kDefaultKeypadTitleFont fontSubTitle: kDefaultKeypadSubTitleFont
                            fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithKeypad4: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithRadius: radius title: @"4" subtitle: @"G H I"
                            fontTitle: kDefaultKeypadTitleFont fontSubTitle: kDefaultKeypadSubTitleFont
                            fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithKeypad5: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithRadius: radius title: @"5" subtitle: @"J K L"
                            fontTitle: kDefaultKeypadTitleFont fontSubTitle: kDefaultKeypadSubTitleFont
                            fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithKeypad6: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithRadius: radius title: @"6" subtitle: @"M N O"
                            fontTitle: kDefaultKeypadTitleFont fontSubTitle: kDefaultKeypadSubTitleFont
                            fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithKeypad7: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithRadius: radius title: @"7" subtitle: @"P Q R S"
                            fontTitle: kDefaultKeypadTitleFont fontSubTitle: kDefaultKeypadSubTitleFont
                            fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithKeypad8: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithRadius: radius title: @"8" subtitle: @"T U V"
                            fontTitle: kDefaultKeypadTitleFont fontSubTitle: kDefaultKeypadSubTitleFont
                            fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithKeypad9: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithRadius: radius title: @"9" subtitle: @"W X Y Z"
                            fontTitle: kDefaultKeypadTitleFont fontSubTitle: kDefaultKeypadSubTitleFont
                            fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithKeypad0: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithRadius: radius title: @"0" subtitle: @"+"
                            fontTitle: kDefaultKeypadTitleFont fontSubTitle: kPlusKeypadSubTitleFont
                            fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithKeypadPaund: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithRadius: radius title: @"#" subtitle: nil
                            fontTitle: kDefaultKeypadTitleFont fontSubTitle: nil
                            fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

+ (UIImage *) uiImageWithKeypadCall: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor;
{
    return [UIImage uiImageWithRadius: radius title: @"" subtitle: nil
                            fontTitle: kDefaultKeypadTitleFont fontSubTitle: nil
                            fillColor: fillColor borderColor: borderColor borderWidth: 1.f];
}

- (UIImage *) uiGrayImage;
{
    UIGraphicsBeginImageContextWithOptions (self.size, NO, [UIScreen mainScreen].scale);
    [self drawInRect: CGRectMake (0, 0, self.size.width, self.size.height)
           blendMode: kCGBlendModeDarken
               alpha: 0.6];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

@end
