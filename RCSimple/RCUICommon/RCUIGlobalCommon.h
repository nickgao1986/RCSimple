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

#import "UIScreen+RCUIBounds.h"
#import "RCExtern.h"
#import <UIKit/UIKit.h>


#define M_PI        3.14159265358979323846264338327950288
#define M_PI_2      1.57079632679489661923132169163975144
#define M_PI_4      0.785398163397448309615660845819875721
#define EP_FLOAT    0.0000000001f
#define FLOAT_EQUAL(a, b)    ((((a) - (b)) >= -EP_FLOAT) && (((a) - (b)) <= EP_FLOAT))

RC_EXTERN const CGFloat ttkDefaultPortraitKeyboardHeight;
RC_EXTERN const CGFloat ttkDefaultLandscapeKeyboardHeight;
RC_EXTERN const CGFloat ttkDefaultPadPortraitKeyboardHeight;
RC_EXTERN const CGFloat ttkDefaultPadLandscapeKeyboardHeight;

RC_EXTERN const CGFloat ttkDefaultTransitionDuration;
RC_EXTERN const CGFloat ttkDefaultFastTransitionDuration;
RC_EXTERN const CGFloat ttkDefaultFlipTransitionDuration;

#define RCUI_KEYBOARD_HEIGHT                 ttkDefaultPortraitKeyboardHeight
#define RCUI_LANDSCAPE_KEYBOARD_HEIGHT       ttkDefaultLandscapeKeyboardHeight
#define RCUI_IPAD_KEYBOARD_HEIGHT            ttkDefaultPadPortraitKeyboardHeight
#define RCUI_IPAD_LANDSCAPE_KEYBOARD_HEIGHT  ttkDefaultPadLandscapeKeyboardHeight
#define RCUI_IS_IPHONE5                      RCUIIsIPHONE5 ()

#if CGFLOAT_IS_DOUBLE
#   define RCUI_CGFLOAT_EPSILON     DBL_EPSILON
#else
#   define RCUI_CGFLOAT_EPSILON     FLT_EPSILON
#endif


RC_EXTERN CGFloat RCUIOSVersion (void);
RC_EXTERN BOOL    RCUIIsIOSSDKVersionAbove9 (void);
RC_EXTERN BOOL    RCUIIsIOSSDKVersionAbove8 (void);
RC_EXTERN BOOL    RCUIIsIOSSDKVersionAbove7 (void);
RC_EXTERN BOOL    RCUIIsMultiTaskingSupported (void);
RC_EXTERN BOOL    RCUIIsIPAD (void);
RC_EXTERN BOOL    RCUIIsIPADPRO (void);
RC_EXTERN BOOL    RCUIIsIPHONE (void);
RC_EXTERN BOOL    RCUIIsIPOD (void);
RC_EXTERN BOOL    RCUIIsIPHONE4 (void);
RC_EXTERN BOOL    RCUIIsIPHONE5 (void);
RC_EXTERN BOOL    RCUIIsIPHONE6 (void);
RC_EXTERN BOOL    RCUIIsIPHONE6Plus (void);
RC_EXTERN BOOL    RCUIIsIPHONE6PlusZoomMode (void);
RC_EXTERN BOOL    RCUIHasToggleStatusBar (void);
RC_EXTERN CGFloat RCUIDeviceVerticalScaleRatio (void);
RC_EXTERN CGFloat RCUIDeviceHorizontalScaleRatio (void);
RC_EXTERN BOOL    RCUIIsLongScreen (void);
RC_EXTERN BOOL    RCUIIsShortScreen (void);
RC_EXTERN CGFloat RCUIScreenScale (void);
RC_EXTERN BOOL    RCUIIsRetianScreen (void);
RC_EXTERN BOOL    RCUIIsRetianHDScreen (void);
RC_EXTERN NSString * RCUIScreenScaleString (void);
RC_EXTERN NSString * RCUIDefaultSplashName (void);
RC_EXTERN NSString * RCUIDefaultAllDevicesSplashName (void);
RC_EXTERN UIDeviceOrientation RCUIDeviceOrientation (void);
RC_EXTERN BOOL    RCUIIsStatusBarTwoLine (void);
RC_EXTERN UIInterfaceOrientation RCUIStatusBarOrientation (void);
RC_EXTERN BOOL    RCUIIsOrientationPortraitSupported (void);
RC_EXTERN BOOL    RCUIIsOrientationLandscapeSupported (void);
RC_EXTERN CGAffineTransform RCUIRotateTransformForOrientation (UIInterfaceOrientation orientation);
RC_EXTERN BOOL    RCUIIsKeyboardVisible (void);
RC_EXTERN CGRect  RCUIScreenBounds (void);
RC_EXTERN CGFloat RCUIKeyboardHeight (void);
RC_EXTERN UIView * RCUIMainKeyWindow (void);
RC_EXTERN BOOL    RCUIFrameAutoAdjustedForOrientation (void);
RC_EXTERN BOOL    RCUIIsTintColorGloballySupported (void);

RC_EXTERN CGSize  RCUISizeOfAttributedStringConstrainedToSize (NSAttributedString *attributedString, CGSize constraintSize, NSInteger numberOfLines);
RC_EXTERN BOOL    RCUIIsArrayWithObjects (id object);
RC_EXTERN BOOL    RCUIIsSetWithObjects (id object);
RC_EXTERN BOOL    RCUIIsStringWithAnyText (id object);
RC_EXTERN CGFloat RCUICGFloatAbs (CGFloat x);
RC_EXTERN CGFloat RCUICGFloatFloor (CGFloat x);
RC_EXTERN CGFloat RCUICGFloatCeil (CGFloat x);
RC_EXTERN CGFloat RCUICGFloatRound (CGFloat x);
RC_EXTERN CGFloat RCUICGFloatSqRt (CGFloat x);
RC_EXTERN CGFloat RCUICGFloatPow (CGFloat x, CGFloat y);
RC_EXTERN CGFloat RCUICGFloatCos (CGFloat x);

RC_EXTERN NSMutableArray * RCUICreateNonRetainArray (void);
RC_EXTERN NSMutableDictionary * RCUICreateNonRetainDictionary (void);

RC_EXTERN NSLocale * RCUICurrentLocale (void);
RC_EXTERN NSString * RCUIPathForDocuments (void);
RC_EXTERN NSString * RCUIPathForCaches (void);
RC_EXTERN NSString * RCUIPathForLibrary (void);
RC_EXTERN NSString * RCUIPathForHome (void);
RC_EXTERN NSString * RCUIPathForTemp (void);

RC_EXTERN BOOL RCUIIsLeftCharContainSurrogateEmoji (unichar lc, unichar rc);

typedef NS_ENUM (NSInteger, RCUIIntroViewType)
{
    IntroWhatsNew = 0,
    IntroNewUserIntro
};
