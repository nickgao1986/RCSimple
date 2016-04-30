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

#import "RCUIGlobalStyle.h"
#import "RCUIGlobalCommon.h"


RC_EXTERN UIFont * RCUIRegularSystemFont (CGFloat fontSize)
{
    if (RCUIIsIOSSDKVersionAbove9 ())
    {
        return [UIFont systemFontOfSize: fontSize weight: UIFontWeightRegular];
    }
    else
    {
        return [UIFont fontWithName: @"HelveticaNeue" size: fontSize];
    }
}

UIFont * RCUIMediumSystemFont (CGFloat fontSize)
{
    if (RCUIIsIOSSDKVersionAbove9 ())
    {
        return [UIFont systemFontOfSize: fontSize weight: UIFontWeightMedium];
    }
    else
    {
        return [UIFont fontWithName: @"HelveticaNeue-Medium" size: fontSize];
    }
}

UIFont * RCUILightSystemFont (CGFloat fontSize)
{
    if (RCUIIsIOSSDKVersionAbove9 ())
    {
        return [UIFont systemFontOfSize: fontSize weight: UIFontWeightLight];
    }
    else
    {
        return [UIFont fontWithName: @"HelveticaNeue-Light" size: fontSize];
    }
}

UIFont * RCUIThinSystemFont (CGFloat fontSize)
{
    if (RCUIIsIOSSDKVersionAbove9 ())
    {
        return [UIFont systemFontOfSize: fontSize weight: UIFontWeightThin];
    }
    else
    {
        return [UIFont fontWithName: @"HelveticaNeue-Thin" size: fontSize];
    }
}

UIFont * RCUIItalicSystemFont (CGFloat fontSize)
{
    if (RCUIIsIOSSDKVersionAbove9 ())
    {
        return [UIFont fontWithName: @"HelveticaNeue-Italic" size: fontSize];
    }
    else
    {
        return [UIFont fontWithName: @"HelveticaNeue-Italic" size: fontSize];
    }
}

UIFont * RCUIUltraLightSystemFont (CGFloat fontSize)
{
    if (RCUIIsIOSSDKVersionAbove9 ())
    {
        return [UIFont systemFontOfSize: fontSize weight: UIFontWeightUltraLight];
    }
    else
    {
        return [UIFont fontWithName: @"HelveticaNeue-UltraLight" size: fontSize];
    }
}

const CGFloat ttkRounded = -1.0f;



