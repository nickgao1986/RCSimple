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

#import "RCUITableViewSection.h"

@implementation RCUITableViewSection
@synthesize headerTitle = _headerTitle;
@synthesize footerTitle = _footerTitle;

+ (id) sectionWithHeaderTitle: (NSString *)headerTitle footerTitle: (NSString *)footerTitle;
{
    RCUITableViewSection *section = [[[self alloc] init] autorelease];
    section.headerTitle = headerTitle;
    section.footerTitle = footerTitle;
    return section;
}

- (void) dealloc;
{
    self.headerTitle = nil;
    self.footerTitle = nil;
    [super dealloc];
}

@end
