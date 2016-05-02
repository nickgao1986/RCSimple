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

#import "RCUIErrorView.h"
#import "UIView+RCUICategory.h"
#import "RCUIThemeStyleHeader.h"

static const CGFloat kVPadding1 = 30.0f;
static const CGFloat kVPadding2 = 10.0f;
static const CGFloat kVPadding3 = 15.0f;
static const CGFloat kHPadding  = 10.0f;

@interface RCUIErrorView ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel     *titleView;
@property (nonatomic, retain) UILabel     *subtitleView;

@end

@implementation RCUIErrorView
@synthesize reloadButton = _reloadButton;
@synthesize imageView = _imageView;
@synthesize titleView = _titleView;
@synthesize subtitleView = _subtitleView;

- (id) initWithFrame: (CGRect)frame;
{
	self = [super initWithFrame: frame];
    
    if (self != nil)
    {
        self.imageView = [[[UIImageView alloc] init] autorelease];
        self.imageView.contentMode = UIViewContentModeCenter;
        [self addSubview: self.imageView];
        
        self.titleView = [[[UILabel alloc] init] autorelease];
        [self.titleView uiApplyThemeStyle: [RCUI_THEME_STYLE () labelThemeWithStyleName: RCTableViewLabelEmpty]];
        self.titleView.font = RCUIMediumSystemFont(18);
        self.titleView.textAlignment = NSTextAlignmentCenter;
        self.titleView.numberOfLines = 0;
        [self addSubview: self.titleView];
        
        self.subtitleView = [[[UILabel alloc] init] autorelease];
        [self.subtitleView uiApplyThemeStyle: [RCUI_THEME_STYLE () labelThemeWithStyleName: RCTableViewLabelEmpty]];
        self.subtitleView.font = RCUIMediumSystemFont(12);
        self.subtitleView.textAlignment = NSTextAlignmentCenter;
        self.subtitleView.numberOfLines = 0;
        [self addSubview: self.subtitleView];
    }
    
    return self;
}

- (id) initWithTitle: (NSString *)title subtitle: (NSString *)subtitle image: (UIImage *)image;
{
    self = [self init];
    
    if (self != nil)
    {
        self.title = title;
        self.subtitle = subtitle;
        self.image = image;
    }
    
    return self;
}

- (void) addReloadButton;
{
    self.reloadButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.reloadButton setBackgroundImage: [UIImage imageNamed: @"reloadButton.png"] forState: UIControlStateNormal];
    [self.reloadButton sizeToFit];
    [self addSubview: self.reloadButton];
    [self layoutSubviews];
}

- (void) layoutSubviews;
{
    self.titleView.size = [self.titleView sizeThatFits: CGSizeMake (self.width - kHPadding * 2, 0)];
    self.subtitleView.size = [self.subtitleView sizeThatFits: CGSizeMake (self.width - kHPadding * 2, 0)];
    [self.imageView sizeToFit];
    
    CGFloat maxHeight = self.imageView.height + self.titleView.height + self.subtitleView.height + kVPadding1 + kVPadding2;
    BOOL canShowImage = self.imageView.image && self.height > maxHeight;
    
    CGFloat totalHeight = 0.0f;
    
    if (canShowImage)
    {
        totalHeight += self.imageView.height;
    }
    
    if (self.titleView.text.length)
    {
        totalHeight += (totalHeight ? kVPadding1 : 0) + self.titleView.height;
    }
    
    if (self.subtitleView.text.length)
    {
        totalHeight += (totalHeight ? kVPadding2 : 0) + self.subtitleView.height;
    }
    
    totalHeight += (totalHeight ? kVPadding3 : 0) + self.reloadButton.height;
    
    CGFloat top = floor (self.height / 2 - totalHeight / 2);
    
    if (canShowImage)
    {
        self.imageView.origin = CGPointMake (floor (self.width / 2 - self.imageView.width / 2), top);
        self.imageView.hidden = NO;
        top += self.imageView.height + kVPadding1;
    }
    else
    {
        self.imageView.hidden = YES;
    }
    
    if (self.titleView.text.length)
    {
        self.titleView.origin = CGPointMake (floor (self.width / 2 - self.titleView.width / 2), top);
        top += self.titleView.height + kVPadding2;
    }
    
    if (self.subtitleView.text.length)
    {
        self.subtitleView.origin = CGPointMake (floor (self.width / 2 - self.subtitleView.width / 2), top);
        top += self.subtitleView.height + kVPadding3;
    }
    
    if (self.reloadButton!=nil)
    {
        self.reloadButton.origin = CGPointMake (floor (self.width / 2 - self.reloadButton.width / 2), top);
    }
}

- (NSString *) title;
{
    return self.titleView.text;
}

- (void) setTitle: (NSString *)title;
{
    self.titleView.text = title;
}

- (NSString *) subtitle;
{
    return self.subtitleView.text;
}

- (void) setSubtitle: (NSString *)subtitle;
{
    self.subtitleView.text = subtitle;
}

- (UIImage *) image;
{
    return self.imageView.image;
}

- (void) setImage: (UIImage *)image;
{
    self.imageView.image = image;
}

- (void) dealloc;
{
    self.imageView = nil;
    self.titleView = nil;
    self.subtitleView = nil;
    self.reloadButton = nil;
    
    [super dealloc];
}

@end
