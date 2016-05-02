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

typedef NS_ENUM (NSInteger, RCUIModelCachePolicy)
{
    RCUIModelCachePolicyNone        = 0,
    RCUIModelCachePolicyMemory      = 1,
    RCUIModelCachePolicyDisk        = 2,
    RCUIModelCachePolicyNetwork     = 4,
    RCUIModelCachePolicyLocal       = (RCUIModelCachePolicyMemory | RCUIModelCachePolicyDisk),
    RCUIModelCachePolicyDefault     = (RCUIModelCachePolicyMemory | RCUIModelCachePolicyDisk | RCUIModelCachePolicyNetwork),
};

@protocol RCUIModel <NSObject>

- (NSMutableArray *) delegates;
- (BOOL) isLoaded;
- (BOOL) isLoading;
- (BOOL) isLoadingMore;
- (BOOL) isOutdated;
- (void) cancel;
- (void) load: (RCUIModelCachePolicy)cachePolicy more: (BOOL)more;
- (void) invalidate: (BOOL)erase;

@end

@interface RCUIModel : NSObject <RCUIModel>
{
    NSMutableArray *_delegates;
}

- (void) didStartLoad;
- (void) didFinishLoad;
- (void) didFailLoadWithError: (NSError *)error;
- (void) didCancelLoad;

- (void) didChange;
- (void) didUpdateObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (void) didInsertObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (void) didDeleteObject: (id)object atIndexPath: (NSIndexPath *)indexPath;

- (void) beginUpdates;
- (void) endUpdates;

@end
