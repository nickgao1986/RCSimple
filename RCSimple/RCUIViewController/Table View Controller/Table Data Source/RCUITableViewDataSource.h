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

#import "RCUIModel.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RCUITableViewController;

@protocol RCUITableViewDataSource <UITableViewDataSource, RCUIModel, UISearchDisplayDelegate>

@property (nonatomic, retain) id<RCUIModel> model;

+ (NSArray *) lettersForSectionsWithSearch: (BOOL)search summary: (BOOL)summary;
- (id) tableView: (UITableView *)tableView objectForRowAtIndexPath: (NSIndexPath *)indexPath;
- (Class) tableView: (UITableView *)tableView cellClassForObject: (id)object;
- (NSString *) tableView: (UITableView *)tableView labelForObject: (id)object;
- (NSIndexPath *) tableView: (UITableView *)tableView indexPathForObject: (id)object;
- (void) tableView: (UITableView *)tableView cell: (UITableViewCell *)cell willAppearAtIndexPath: (NSIndexPath *)indexPath;
- (void) tableViewDidLoadModel: (UITableView *)tableView;

- (NSString *) titleForLoading: (BOOL)reloading;
- (UIImage *) imageForEmpty;
- (NSString *) titleForEmpty;
- (NSString *) subtitleForEmpty;

- (BOOL) reloadButtonForEmpty;
- (UIImage *) imageForError: (NSError *)error;
- (NSString *) titleForError: (NSError *)error;
- (NSString *) subtitleForError: (NSError *)error;

@optional

- (NSIndexPath *) tableView: (UITableView *)tableView willUpdateObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (NSIndexPath *) tableView: (UITableView *)tableView willInsertObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (NSIndexPath *) tableView: (UITableView *)tableView willRemoveObject: (id)object atIndexPath: (NSIndexPath *)indexPath;
- (void) search: (NSString *)text;

@end


@interface RCUITableViewDataSource : NSObject <RCUITableViewDataSource>
{
    id <RCUIModel> _model;
}
@end


@interface RCUITableViewInterstitialDataSource : RCUITableViewDataSource <RCUIModel>
@end
