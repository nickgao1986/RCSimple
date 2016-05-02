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

#import "RCUIRootViewController.h"
#import "RCUIModel.h"
#import "RCUIModelDelegate.h"

@interface RCUIModelViewController : RCUIRootViewController <RCUIModelDelegate>
{
    id <RCUIModel> _model;
    NSError        *_modelError;
    struct
    {
        unsigned int isModelDidRefreshInvalid:1;
        unsigned int isModelWillLoadInvalid:1;
        unsigned int isModelDidLoadInvalid:1;
        unsigned int isModelDidLoadFirstTimeInvalid:1;
        unsigned int isModelDidShowFirstTimeInvalid:1;
        unsigned int isViewInvalid:1;
        unsigned int isViewSuspended:1;
        unsigned int isUpdatingView:1;
        unsigned int isShowingEmpty:1;
        unsigned int isShowingLoading:1;
        unsigned int isShowingModel:1;
        unsigned int isShowingError:1;
    }_flags;
}

@property (nonatomic, retain) id<RCUIModel> model;
@property (nonatomic, retain) NSError  *modelError;

- (BOOL) isModelCreated;
- (void) generatedModel;
- (void) invalidateModel;

/*
 * Do not call these directly. Subclasses should implement these methods.
 */
- (BOOL) shouldLoad;
- (BOOL) shouldReload;
- (BOOL) shouldLoadMore;

- (BOOL) canShowModel;
- (void) reload;
- (void) reloadIfNeeded;
- (void) refresh;
- (void) beginUpdates;
- (void) endUpdates;
- (void) invalidateView;
- (void) updateView;
- (void) didRefreshModel;
- (void) willLoadModel;
- (void) didLoadModel: (BOOL)firstTime;
- (void) didShowModel: (BOOL)firstTime;
- (void) showModel: (BOOL)show;
- (void) showLoading: (BOOL)show;
- (void) showEmpty: (BOOL)show;
- (void) showError: (BOOL)show;

@end
