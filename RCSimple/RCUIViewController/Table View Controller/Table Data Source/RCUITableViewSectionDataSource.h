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

#import "RCUITableViewDataSource.h"

@interface RCUITableViewSectionDataSource : RCUITableViewDataSource
{
    NSMutableArray *_items;
    NSMutableArray *_sections;
}

@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, retain) NSMutableArray *sections;

+ (RCUITableViewSectionDataSource *) dataSourceWithObjects: (id)object,...;
+ (RCUITableViewSectionDataSource *) dataSourceWithArrays: (id)object,...;
+ (RCUITableViewSectionDataSource *) dataSourceWithItems: (NSArray *)items sections: (NSArray *)sections;
- (id) initWithItems: (NSArray *)items sections: (NSArray *)sections;
- (NSIndexPath *) indexPathOfItemWithUserInfo: (id)userInfo;
- (void) removeItemAtIndexPath: (NSIndexPath *)indexPath;
- (BOOL) removeItemAtIndexPath: (NSIndexPath *)indexPath andSectionIfEmpty:(BOOL)andSection;

@end
