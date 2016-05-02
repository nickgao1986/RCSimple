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

@protocol RCUIModel;

@protocol RCUIModelDelegate <NSObject>
@optional

- (void) modelDidStartLoad: (id<RCUIModel>)model;
- (void) modelDidFinishLoad: (id<RCUIModel>)model;
- (void) model: (id<RCUIModel>)model didFailLoadWithError: (NSError *)error;
- (void) modelDidCancelLoad: (id<RCUIModel>)model;

- (void) modelDidChange: (id<RCUIModel>)model;
- (void) model: (id<RCUIModel>)model didUpdateObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (void) model: (id<RCUIModel>)model didInsertObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (void) model: (id<RCUIModel>)model didDeleteObject: (id)object atIndexPath: (NSIndexPath *)indexPath;

- (void) modelDidBeginUpdates: (id<RCUIModel>)model;
- (void) modelDidEndUpdates: (id<RCUIModel>)model;

@end
