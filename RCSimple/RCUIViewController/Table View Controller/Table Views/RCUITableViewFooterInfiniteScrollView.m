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

#import "RCUITableViewFooterInfiniteScrollView.h"
#import "RCUIGlobalStyle.h"

@interface RCUITableViewFooterInfiniteScrollView ()

@property (nonatomic, assign) BOOL loading;

@end

@implementation RCUITableViewFooterInfiniteScrollView
@synthesize indicator = _indicator;
@synthesize loading = _loading;

- (id) initWithFrame: (CGRect)frame;
{
    self = [super initWithFrame: frame];
    
    if (self != nil)
    {
        self.indicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray] autorelease];
        self.indicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        [self addSubview: self.indicator];
    }
    
    return self;
}

- (void) drawRect: (CGRect)rect;
{
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetRGBFillColor (context, 1, 1, 1, 1);
    CGContextFillRect (context, rect);
    if (!self.loading)
    {
        CGFloat dotSize = 5.0f;
        CGFloat x = roundf ((self.bounds.size.width / 2) - (dotSize / 2));
        CGFloat y = roundf ((self.bounds.size.height / 2) - (dotSize / 2));
        CGContextSetRGBFillColor (context, 0.75, 0.75, 0.75, 1.0);
        CGContextFillEllipseInRect (context, CGRectMake (x, y, dotSize, dotSize));
    }
}

- (void) layoutSubviews;
{
    [super layoutSubviews];
    CGRect frame = self.indicator.frame;
    
    frame.origin.x = roundf ((self.bounds.size.width / 2) - (self.indicator.frame.size.width / 2));
    frame.origin.y = roundf ((self.bounds.size.height / 2) - (self.indicator.frame.size.height / 2));
    
    self.indicator.frame = frame;
}

- (void) setLoading: (BOOL)loading;
{
    _loading = loading;
    if (_loading)
    {
        [self.indicator startAnimating];
    }
    else
    {
        [self.indicator stopAnimating];
    }
    
    [self setNeedsDisplay];
}

- (void) dealloc;
{
    self.indicator = nil;
    [super dealloc];
}

@end
