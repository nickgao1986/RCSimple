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

#import "RCUIGlobalCommon.h"
#import "UIWindow+RCUICategory.h"
#import <CoreText/CoreText.h>
#import <sys/utsname.h>

const CGFloat ttkDefaultPortraitKeyboardHeight      = 216.0f;
const CGFloat ttkDefaultLandscapeKeyboardHeight     = 160.0f;
const CGFloat ttkDefaultPadPortraitKeyboardHeight   = 264.0f;
const CGFloat ttkDefaultPadLandscapeKeyboardHeight  = 352.0f;

const CGFloat ttkDefaultTransitionDuration      = 0.3f;
const CGFloat ttkDefaultFastTransitionDuration  = 0.2f;
const CGFloat ttkDefaultFlipTransitionDuration  = 0.7f;

CGFloat RCUIOSVersion (void)
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

BOOL RCUIIsIOSSDKVersionAbove9 (void)
{
    return !(floor (NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_8_4);
}

BOOL RCUIIsIOSSDKVersionAbove8 (void)
{
    return !(floor (NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1);
}

BOOL RCUIIsIOSSDKVersionAbove7 (void)
{
    return !(floor (NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1);
}

BOOL RCUIIsMultiTaskingSupported (void)
{
    BOOL backgroundSupported = NO;
	
    if ([[UIDevice currentDevice] respondsToSelector: @selector (isMultitaskingSupported)])
	{
		backgroundSupported = [[UIDevice currentDevice] isMultitaskingSupported];
    }
	
    return backgroundSupported;
}

BOOL RCUIIsIPAD (void)
{
#ifdef __IPHONE_3_2
	return UI_USER_INTERFACE_IDIOM () == UIUserInterfaceIdiomPad;
#else
	return NO;
#endif
}

BOOL RCUIIsIPHONE (void)
{
    return (!RCUIIsIPAD () && ([[[UIDevice currentDevice] model] isEqualToString: @"iPhone"] || [[[UIDevice currentDevice] model] isEqualToString: @"iPhone Simulator"]));
}

BOOL RCUIIsIPOD (void)
{
    return (!RCUIIsIPAD () && [[[UIDevice currentDevice] model] isEqualToString: @"iPod touch"]);
}

BOOL RCUIIsIPHONE4 (void)
{
    return (fabs ((double)[[UIScreen mainScreen] deviceBounds].size.height - (double)480) < DBL_EPSILON) && RCUIIsIPHONE ();
}

BOOL RCUIIsIPHONE5 (void)
{
    return (RCUIIsLongScreen () && RCUIIsIPHONE ());
}

BOOL RCUIIsIPHONE6 (void)
{
    return (fabs ((double)[[UIScreen mainScreen] deviceBounds].size.height - (double)667) < DBL_EPSILON) && (RCUIScreenScale () < 3.0f)
        && RCUIIsIPHONE ();
}

BOOL RCUIIsIPHONE6Plus (void)
{
    double height = (double)[[UIScreen mainScreen] deviceBounds].size.height;
    return ((fabs (height - (double)736) < DBL_EPSILON) ||
            ((fabs (height - (double)667) < DBL_EPSILON) && (RCUIScreenScale () == 3.0f)))
        && RCUIIsIPHONE ();
}

BOOL RCUIIsIPADPRO (void)
{
    CGFloat height = RCUIIsOrientationLandscapeSupported() ? 2732 : 1366;
    
    return  ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad && fabs ([UIScreen mainScreen].bounds.size.height - height) < DBL_EPSILON);

}

BOOL RCUIIsIPHONE6PlusZoomMode (void)
{
    double height = (double)[[UIScreen mainScreen] deviceBounds].size.height;
    return ((fabs (height - (double)667) < DBL_EPSILON) && (RCUIScreenScale () == 3.0f)) && RCUIIsIPHONE ();
}

BOOL RCUIHasToggleStatusBar (void)
{
    return RCUIIsStatusBarTwoLine ();
}

CGFloat RCUIDeviceVerticalScaleRatio (void)
{
    #define kDefaultDesignBaseLineHeight   568  /* iPhone5s design */
    return (([[UIScreen mainScreen] deviceBounds].size.height - (RCUIHasToggleStatusBar () ? 20. : 0.)) / kDefaultDesignBaseLineHeight);
}

CGFloat RCUIDeviceHorizontalScaleRatio (void)
{
    #define kDefaultDesignBaseLineWidth   320  /* iPhone5s design */
    return ([[UIScreen mainScreen] deviceBounds].size.width / kDefaultDesignBaseLineWidth);
}

BOOL RCUIIsLongScreen (void)
{
    return (fabs ((double)[[UIScreen mainScreen] deviceBounds].size.height - (double)568) < DBL_EPSILON);
}

BOOL RCUIIsShortScreen (void)
{
    return (fabs ((double)[[UIScreen mainScreen] deviceBounds].size.height - (double)480) < DBL_EPSILON);
}

CGFloat RCUIScreenScale (void)
{
    if ([[UIScreen mainScreen] respondsToSelector: @selector (scale)])
	{
		return [[UIScreen mainScreen] scale];
    }
    
    return 1.0f;
}

BOOL RCUIIsRetianScreen (void)
{
    return (RCUIScreenScale () == 2.f);
}

BOOL RCUIIsRetianHDScreen (void)
{
    return (RCUIScreenScale () == 3.f);
}

NSString * RCUIScreenScaleString (void)
{
    if (RCUIIsRetianHDScreen () || RCUIIsIPHONE6Plus ())
    {
        return @"@3x";
    }
    else if (RCUIIsRetianScreen ())
    {
        return @"@2x";
    }
    return @"";
}

NSString * RCUIDefaultSplashName (void)
{
    NSString *name = @"Default.png";
    
    if (!RCUIIsIPAD ())
    {
        if (RCUIIsIPHONE6Plus ())
        {
            name = [NSString stringWithFormat: @"Default-736h%@~iphone.png", RCUIScreenScaleString ()];
        }
        else if (RCUIIsIPHONE6 ())
        {
            name = [NSString stringWithFormat: @"Default-667h%@~iphone.png", RCUIScreenScaleString ()];
        }
        else if (RCUIIsIPHONE5 ())
        {
            name = [NSString stringWithFormat: @"Default-568h%@~iphone.png", RCUIScreenScaleString ()];
        }
        else
        {
            name = [NSString stringWithFormat: @"Default%@~iphone.png", RCUIScreenScaleString ()];
        }
    }
    
    return name;
}

NSString * RCUIDefaultAllDevicesSplashName (void)
{
    NSString *name = @"Default.png";
    
    if (RCUIIsIPAD ())
    {
        if (RCUIIsOrientationLandscapeSupported ())
        {
            name = [NSString stringWithFormat: @"Default-Landscape%@~ipad.png", RCUIScreenScaleString ()];
        }
        else
        {
            name = [NSString stringWithFormat: @"Default-Portrait%@~ipad.png", RCUIScreenScaleString ()];
        }
    }
    else
    {
        if (RCUIIsIPHONE6Plus ())
        {
            name = [NSString stringWithFormat: @"Default-736h%@~iphone.png", RCUIScreenScaleString ()];
        }
        else if (RCUIIsIPHONE6 ())
        {
            name = [NSString stringWithFormat: @"Default-667h%@~iphone.png", RCUIScreenScaleString ()];
        }
        else if (RCUIIsIPHONE5 ())
        {
            name = [NSString stringWithFormat: @"Default-568h%@~iphone.png", RCUIScreenScaleString ()];
        }
        else
        {
            name = [NSString stringWithFormat: @"Default%@~iphone.png", RCUIScreenScaleString ()];
        }
    }
    
    return name;
}

UIDeviceOrientation RCUIDeviceOrientation (void)
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
	if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationUnknown)
	{
		orientation = UIDeviceOrientationPortrait;
	}
	
	return orientation;
}

BOOL RCUIIsStatusBarTwoLine (void)
{
    return FLOAT_EQUAL (CGRectGetHeight ([[UIApplication sharedApplication] statusBarFrame]), 40.);
}

UIInterfaceOrientation RCUIStatusBarOrientation (void)
{
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    return orientation;
}

BOOL RCUIIsOrientationPortraitSupported (void)
{
    return UIDeviceOrientationIsPortrait (RCUIDeviceOrientation ()) || UIInterfaceOrientationIsPortrait (RCUIStatusBarOrientation ());
}

BOOL RCUIIsOrientationLandscapeSupported (void)
{
    return UIDeviceOrientationIsLandscape (RCUIDeviceOrientation ()) || UIInterfaceOrientationIsLandscape (RCUIStatusBarOrientation ());
}

CGAffineTransform RCUIRotateTransformForOrientation (UIInterfaceOrientation orientation)
{
    if (orientation == UIInterfaceOrientationLandscapeLeft)
    {
        return CGAffineTransformMakeRotation (M_PI * 1.5);
    }
    else if (orientation == UIInterfaceOrientationLandscapeRight)
    {
        return CGAffineTransformMakeRotation (M_PI / 2);
    }
    else if (orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        return CGAffineTransformMakeRotation (-M_PI);
    }
    
    return CGAffineTransformIdentity;
}

BOOL RCUIIsKeyboardVisible (void)
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    return !![window findFirstResponder];
}

CGRect RCUIScreenBounds (void)
{
    CGRect bounds = [UIScreen mainScreen].deviceBounds;
    
    if (UIInterfaceOrientationIsLandscape (RCUIStatusBarOrientation ()))
    {
        CGFloat width = bounds.size.width;
        bounds.size.width = bounds.size.height;
        bounds.size.height = width;
    }
    
    return bounds;
}

CGFloat RCUIKeyboardHeight (void)
{
    if (RCUIIsIPAD ())
    {
        return UIInterfaceOrientationIsPortrait (RCUIStatusBarOrientation ()) ? RCUI_IPAD_KEYBOARD_HEIGHT
                                                                              : RCUI_IPAD_LANDSCAPE_KEYBOARD_HEIGHT;
    }
    else
    {
        return UIInterfaceOrientationIsPortrait (RCUIStatusBarOrientation ()) ? RCUI_KEYBOARD_HEIGHT
                                                                              : RCUI_LANDSCAPE_KEYBOARD_HEIGHT;
    }
}

UIView * RCUIMainKeyWindow (void)
{
	UIWindow *window = [[UIApplication sharedApplication] keyWindow];
	
	if (window.subviews.count > 0)
	{
		return [window.subviews objectAtIndex: 0];
	}
	
	return window;
}

BOOL RCUIFrameAutoAdjustedForOrientation (void)
{
    return ([[UIScreen mainScreen] respondsToSelector: @selector (coordinateSpace)] && [[UIScreen mainScreen] respondsToSelector: @selector (fixedCoordinateSpace)]);
}

BOOL RCUIIsTintColorGloballySupported (void)
{
    static NSInteger isTintColorGloballySupported = -1;
    if (isTintColorGloballySupported < 0)
    {
        UIView *view = [[UIView alloc] init];
        isTintColorGloballySupported = [view respondsToSelector: @selector (tintColor)];
        [view release];
    }
    return isTintColorGloballySupported > 0;
}

CGSize RCUISizeOfAttributedStringConstrainedToSize (NSAttributedString *attributedString, CGSize constraintSize, NSInteger numberOfLines)
{
    if (nil == attributedString)
    {
        return CGSizeZero;
    }
    
    CFAttributedStringRef attributedStringRef = (__bridge CFAttributedStringRef)attributedString;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString (attributedStringRef);
    
    if (NULL == framesetter)
    {
        return CGSizeZero;
    }
    CFRange range = CFRangeMake (0, 0);
    
    if (numberOfLines == 1)
    {
        constraintSize = CGSizeMake (CGFLOAT_MAX, CGFLOAT_MAX);
    }
    else if (numberOfLines > 0 && nil != framesetter)
    {
        CGMutablePathRef path = CGPathCreateMutable ();
        CGPathAddRect (path, NULL, CGRectMake (0, 0, constraintSize.width, constraintSize.height));
        CTFrameRef frame = CTFramesetterCreateFrame (framesetter, CFRangeMake (0, 0), path, NULL);
        CFArrayRef lines = CTFrameGetLines (frame);
        
        if (nil != lines && CFArrayGetCount (lines) > 0)
        {
            NSInteger lastVisibleLineIndex = MIN (numberOfLines, CFArrayGetCount (lines)) - 1;
            CTLineRef lastVisibleLine = CFArrayGetValueAtIndex (lines, lastVisibleLineIndex);
            
            CFRange rangeToLayout = CTLineGetStringRange (lastVisibleLine);
            range = CFRangeMake (0, rangeToLayout.location + rangeToLayout.length);
        }
        
        CFRelease (frame);
        CFRelease (path);
    }
    
    CGSize newSize = CTFramesetterSuggestFrameSizeWithConstraints (framesetter, range, NULL, constraintSize, NULL);
    
    CFRelease (framesetter);
    
    return CGSizeMake (RCUICGFloatCeil (newSize.width), RCUICGFloatCeil (newSize.height));
}

BOOL RCUIIsArrayWithObjects (id object)
{
    return [object isKindOfClass: [NSArray class]] && [(NSArray *)object count] > 0;
}

BOOL RCUIIsSetWithObjects (id object)
{
    return [object isKindOfClass: [NSSet class]] && [(NSSet *)object count] > 0;
}

BOOL RCUIIsStringWithAnyText (id object)
{
    return [object isKindOfClass: [NSString class]] && [(NSString *)object length] > 0;
}

CGFloat RCUICGFloatAbs (CGFloat x)
{
#if CGFLOAT_IS_DOUBLE
    return (CGFloat)fabs (x);
#else
    return (CGFloat)fabsf (x);
#endif
}

CGFloat RCUICGFloatFloor (CGFloat x)
{
#if CGFLOAT_IS_DOUBLE
    return (CGFloat)floor (x);
#else
    return (CGFloat)floorf (x);
#endif
}

CGFloat RCUICGFloatCeil (CGFloat x)
{
#if CGFLOAT_IS_DOUBLE
    return (CGFloat)ceil (x);
#else
    return (CGFloat)ceilf (x);
#endif
}

CGFloat RCUICGFloatRound (CGFloat x)
{
#if CGFLOAT_IS_DOUBLE
    return (CGFloat)round (x);
#else
    return (CGFloat)roundf (x);
#endif
}

CGFloat RCUICGFloatSqRt (CGFloat x)
{
#if CGFLOAT_IS_DOUBLE
    return (CGFloat)sqrt (x);
#else
    return (CGFloat)sqrtf (x);
#endif
}

CGFloat RCUICGFloatPow (CGFloat x, CGFloat y)
{
#if CGFLOAT_IS_DOUBLE
    return (CGFloat)pow (x, y);
#else
    return (CGFloat)powf (x, y);
#endif
}

CGFloat RCUICGFloatCos (CGFloat x)
{
#if CGFLOAT_IS_DOUBLE
    return (CGFloat)cos (x);
#else
    return (CGFloat)cosf (x);
#endif
}

static const void* RCUIRetainNoOp (__unused CFAllocatorRef allocator, const void *value) { return value; }
static void RCUIReleaseNoOp (__unused CFAllocatorRef allocator, __unused const void *value) {}

NSMutableArray * RCUICreateNonRetainArray (void)
{
    CFArrayCallBacks callbacks = kCFTypeArrayCallBacks;
    callbacks.retain = RCUIRetainNoOp;
    callbacks.release = RCUIReleaseNoOp;
    return (NSMutableArray *)CFArrayCreateMutable (nil, 0, &callbacks);
}

NSMutableDictionary * RCUICreateNonRetainDictionary (void)
{
    CFDictionaryKeyCallBacks keyCallbacks = kCFTypeDictionaryKeyCallBacks;
    CFDictionaryValueCallBacks callbacks = kCFTypeDictionaryValueCallBacks;
    callbacks.retain = RCUIRetainNoOp;
    callbacks.release = RCUIReleaseNoOp;
    return (NSMutableDictionary *)CFDictionaryCreateMutable (nil, 0, &keyCallbacks, &callbacks);
}

NSLocale * RCUICurrentLocale (void)
{
    NSArray *languages = [NSLocale preferredLanguages];
    
    if ([languages count] > 0)
    {
        return [[[NSLocale alloc] initWithLocaleIdentifier: [languages objectAtIndex: 0]] autorelease];
    }
    
    return [NSLocale currentLocale];
}

NSString * RCUIPathForDocuments (void)
{
    NSArray *dirs = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    return [dirs objectAtIndex: 0];
}

NSString * RCUIPathForCaches (void)
{
    NSArray *dirs = NSSearchPathForDirectoriesInDomains (NSCachesDirectory, NSUserDomainMask, YES);
    return [dirs objectAtIndex: 0];
}

NSString * RCUIPathForLibrary (void)
{
    NSArray *dirs = NSSearchPathForDirectoriesInDomains (NSLibraryDirectory, NSUserDomainMask, YES);
    return [dirs objectAtIndex: 0];
}

NSString * RCUIPathForHome (void)
{
    return NSHomeDirectory ();
}

NSString * RCUIPathForTemp (void)
{
    return NSTemporaryDirectory ();
}

BOOL RCUIIsLeftCharContainSurrogateEmoji (unichar lc, unichar rc)
{
    if (lc >= 0xD800 && lc <= 0xDBFF)
    {
        int uc = ((lc - 0xD800) * 0x400) + (rc - 0xDC00) + 0x10000;
        if (uc >= 0x1D000 && uc <= 0x1F77F)
        {
            return YES;
        }
    }
    else
    {
        if (rc == 0x20E3)
        {
            return YES;
        }
    }
    
    return NO;
}











