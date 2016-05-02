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

#import "RCUILoadingView.h"
#import "UIFont+RCUILineHeight.h"
#import "UIView+RCUICategory.h"
#import "RCUIThemeStyleHeader.h"

static CGFloat kPadding         = 8.0f;
static CGFloat kSpacing         = 6.0f;
static CGFloat kProgressMargin  = 6.0f;

@interface RCUILoadingView ()

@property (nonatomic, retain) UIView *backgroundView;
@property (nonatomic, retain) UIProgressView *progressView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) UILabel *label;

@end

@implementation RCUILoadingView
@synthesize text = _text;
@synthesize font = _font;
@synthesize progress = _progress;
@synthesize isAnimating = _isAnimating;
@synthesize smoothesProgress = _smoothesProgress;
@synthesize backgroundView = _backgroundView;
@synthesize progressView = _progressView;
@synthesize activityIndicator = _activityIndicator;
@synthesize label = _label;

- (id) initWithFrame: (CGRect)frame;
{
    self = [self initWithFrame: frame text: nil];
    
    if (self != nil)
    {}
    
    return self;
}

- (id) initWithFrame: (CGRect)frame text: (NSString *)text;
{
    self = [super initWithFrame: frame];
    
    if (self != nil)
    {
        self.progress = 0;
        self.smoothesProgress = NO;
        _smoothTimer = nil;
        self.progressView = nil;
        
        self.backgroundView = [[[UIView alloc] init] autorelease];
        self.backgroundView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor whiteColor];
        
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        self.label = [[[UILabel alloc] init] autorelease];
        [self.label uiApplyThemeStyle: [RCUI_THEME_STYLE () labelThemeWithStyleName: RCTableViewLabelEmpty]];
        self.label.text = text;
        self.label.lineBreakMode = NSLineBreakByTruncatingTail;
        self.label.font = RCUIRegularSystemFont(17);
        
        self.activityIndicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:
                                  UIActivityIndicatorViewStyleGray] autorelease];

        [self addSubview: self.backgroundView];
        [self.backgroundView addSubview: self.activityIndicator];
        [self.backgroundView addSubview: self.label];
        [self.activityIndicator startAnimating];
    }
    
    return self;
}

- (void) layoutSubviews;
{
    [super layoutSubviews];
    
    CGSize textSize = [self.label.text sizeWithAttributes:@{NSFontAttributeName: self.label.font}];
    
    CGFloat indicatorSize = 0.0f;
    [self.activityIndicator sizeToFit];
    
    if (self.activityIndicator.isAnimating)
    {
        if (self.activityIndicator.height > textSize.height)
        {
            indicatorSize = textSize.height;
        }
        else
        {
            indicatorSize = self.activityIndicator.height;
        }
    }
    
    CGFloat contentWidth = indicatorSize + kSpacing + textSize.width;
    CGFloat contentHeight = textSize.height > indicatorSize ? textSize.height : indicatorSize;
    
    if (self.progressView)
    {
        [self.progressView sizeToFit];
        contentHeight += self.progressView.height + kSpacing;
    }
    
    CGFloat margin, padding, width, height;
    margin = 0;
    padding = kPadding;
    width = self.width;
    height = self.height;
    
    CGFloat maxWidth = RCUIScreenBounds ().size.width - margin * 2;
    if (width > maxWidth)
    {
        width = maxWidth;
        contentWidth = width - (kSpacing + indicatorSize);
    }
    
    CGFloat textMaxWidth = (width - (indicatorSize + kSpacing)) - padding * 2;
    CGFloat textWidth = textSize.width;
    if (textWidth > textMaxWidth)
    {
        textWidth = textMaxWidth;
    }
    
    self.backgroundView.frame = CGRectMake (floor (self.width / 2 - width  / 2),
                                  floor(self.height / 2 - height / 2),
                                  width, height);
    
    CGFloat y = padding + floor ((height - padding * 2) / 2 - contentHeight / 2);
    
    if (self.progressView)
    {
        self.progressView.frame = CGRectMake (kProgressMargin, y,
                                              width - kProgressMargin * 2, self.progressView.height);
        y += self.progressView.height + kSpacing - 1;
    }
    
    self.label.frame = CGRectMake (floor ((width / 2 - contentWidth / 2) + indicatorSize + kSpacing), y,
                                   textWidth, textSize.height);
    
    self.activityIndicator.frame = CGRectMake (self.label.left - (indicatorSize + kSpacing), y,
                                               indicatorSize, indicatorSize);
}

- (CGSize) sizeThatFits: (CGSize)size;
{
    CGFloat padding = kPadding;
    
    CGFloat height = self.font.ttLineHeight + padding * 2;
    if (self.progressView)
    {
        height += self.progressView.height + kSpacing;
    }
    
    return CGSizeMake (size.width, height);
}

- (void) smoothTimer;
{
    if (self.progressView.progress < self.progress)
    {
        self.progressView.progress += 0.01;
    }
    else
    {
        [_smoothTimer invalidate];
        _smoothTimer = nil;
    }
}

- (NSString *) text;
{
    return self.label.text;
}

- (void) setText: (NSString *)text;
{
    self.label.text = text;
    [self setNeedsLayout];
}

- (UIFont *) font;
{
    return self.label.font;
}

- (void) setFont: (UIFont *)font;
{
    self.label.font = font;
    [self setNeedsLayout];
}

- (UIColor *) color;
{
    return self.label.textColor;
}

- (void) setColor: (UIColor *)color;
{
    self.label.textColor = color;
}

- (BOOL) isAnimating;
{
    return self.activityIndicator.isAnimating;
}

- (void) setIsAnimating: (BOOL)isAnimating;
{
    if (isAnimating)
    {
        [self.activityIndicator startAnimating];
    }
    else
    {
        [self.activityIndicator stopAnimating];
    }
}

- (void) setProgress: (CGFloat)progress;
{
    _progress = progress;
    
    if (self.progressView == nil)
    {
        self.progressView = [[[UIProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault] autorelease];
        self.progressView.progress = 0.0f;
        [self.backgroundView addSubview: self.progressView];
        [self setNeedsLayout];
    }
    
    if (self.smoothesProgress)
    {
        if (_smoothTimer == nil)
        {
            _smoothTimer = [NSTimer scheduledTimerWithTimeInterval: 0.01 target: self
                                                          selector: @selector (smoothTimer)
                                                          userInfo: nil
                                                           repeats: YES];
        }
    }
    else
    {
        self.progressView.progress = progress;
    }
}

- (void) dealloc;
{
    [_smoothTimer invalidate];
    _smoothTimer = nil;
    self.text = nil;
    self.font = nil;
    self.backgroundView = nil;
    self.progressView = nil;
    self.activityIndicator = nil;
    self.label = nil;
    
    [super dealloc];
}

@end
