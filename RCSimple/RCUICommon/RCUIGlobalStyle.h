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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RCExtern.h"

typedef NS_ENUM (NSInteger, RCUIPosition)
{
    RCUIPositionStatic,
    RCUIPositionAbsolute,
    RCUIPositionFloatLeft,
    RCUIPositionFloatRight
};

RC_EXTERN UIFont * RCUIRegularSystemFont (CGFloat fontSize);

RC_EXTERN UIFont * RCUIMediumSystemFont (CGFloat fontSize);

RC_EXTERN UIFont * RCUILightSystemFont (CGFloat fontSize);

RC_EXTERN UIFont * RCUIThinSystemFont (CGFloat fontSize);

RC_EXTERN UIFont * RCUIItalicSystemFont (CGFloat fontSize);

RC_EXTERN UIFont * RCUIUltraLightSystemFont (CGFloat fontSize);


RC_EXTERN const CGFloat ttkRounded;

#define RGBCOLOR(r,g,b)     [UIColor colorWithRed: (r)/255.0f green: (g)/255.0f blue: (b)/255.0f alpha: 1]
#define RGBACOLOR(r,g,b,a)  [UIColor colorWithRed: (r)/255.0f green: (g)/255.0f blue: (b)/255.0f alpha: (a)]

#define HSVCOLOR(h,s,v)     [UIColor colorWithHue: (h) saturation: (s) value: (v) alpha: 1]
#define HSVACOLOR(h,s,v,a)  [UIColor colorWithHue: (h) saturation: (s) value: (v) alpha: (a)]

