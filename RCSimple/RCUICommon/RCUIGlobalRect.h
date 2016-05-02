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

#import "RCExtern.h"
#import <UIKit/UIKit.h>

/*
 * @return CGRectMake (x, y, w - dx, h - dy)
 */
RC_EXTERN CGRect RCUIRectContract (CGRect rect, CGFloat dx, CGFloat dy);

/*
 * @return CGRectMake (x + dx, y + dy, w - dx, h - dy)
 */
RC_EXTERN CGRect RCUIRectShift (CGRect rect, CGFloat dx, CGFloat dy);

/*
 * @return CGRectMake (x + left, y + top, w - (left + right), h - (top + bottom))
 */
RC_EXTERN CGRect RCUIRectInset (CGRect rect, UIEdgeInsets insets);


