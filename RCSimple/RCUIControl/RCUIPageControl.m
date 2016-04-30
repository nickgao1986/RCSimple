//* Copyright (c) 2010-2011, Snappy Code
//* All rights reserved.
//*
//* Redistribution and use in source and binary forms, with or without
//* modification, are permitted provided that the following conditions are met:
//*     * Redistributions of source code must retain the above copyright
//*       notice, this list of conditions and the following disclaimer.
//*     * Redistributions in binary form must reproduce the above copyright
//*       notice, this list of conditions and the following disclaimer in the
//*       documentation and/or other materials provided with the distribution.
//*     * Neither the name of Snappy Code nor the
//*       names of its contributors may be used to endorse or promote products
//*       derived from this software without specific prior written permission.
//*
//* THIS SOFTWARE IS PROVIDED BY Snappy Code ''AS IS'' AND ANY
//* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//* DISCLAIMED. IN NO EVENT SHALL Snappy Code BE LIABLE FOR ANY
//* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//   * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#import "RCUIPageControl.h"

static const CGFloat kDefaultDotDiameter = 5.f;
static const CGFloat kDefaultDotSpace    = 12.f;

@implementation RCUIPageControl

- (id) initWithType: (RCUIPageControlType)type;
{
    self = [self initWithFrame: CGRectZero];
    _type = type;
    return self;
}

- (id) initWithFrame: (CGRect)frame;
{
    self = [super initWithFrame: frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void) drawRect: (CGRect)rect;
{
    CGContextRef context = UIGraphicsGetCurrentContext ();

	CGContextSaveGState (context);
	
    CGFloat diameter = (self.indicatorDiameter > 0) ? self.indicatorDiameter : kDefaultDotDiameter;
	CGFloat space = (self.indicatorSpace > 0) ? self.indicatorSpace : kDefaultDotSpace;
    
    CGRect currentBounds = self.bounds ;
	CGFloat dotsWidth = self.numberOfPages * diameter + MAX (0, self.numberOfPages - 1) * space;
	CGFloat x = CGRectGetMidX (currentBounds) - dotsWidth / 2;
	CGFloat y = CGRectGetMidY (currentBounds) - diameter / 2;
    
    UIColor *pageIndicatorTintColor = self.pageIndicatorTintColor ? self.pageIndicatorTintColor : [UIColor colorWithWhite: 1.0f alpha: 1.0f];
	UIColor *currentPageIndicatorTintColor = self.currentPageIndicatorTintColor ? self.currentPageIndicatorTintColor : [UIColor colorWithWhite: 0.7f alpha: 0.5f];
    
    for (NSInteger i = 0 ; i < self.numberOfPages ; i++)
	{
		if (i == self.currentPage)
		{
            CGContextSetFillColorWithColor (context, currentPageIndicatorTintColor.CGColor);
            CGContextFillEllipseInRect (context, CGRectInset (CGRectMake (x, CGRectGetMidY (currentBounds) - kDefaultDotDiameter / 2, kDefaultDotDiameter, kDefaultDotDiameter), -0.5f, -0.5f));
		}
		else
		{
            CGRect dotRect = CGRectMake (x, y, diameter, diameter);
			if (self.type == RCUIPageControlTypeEmpty)
			{
				CGContextSetStrokeColorWithColor (context, pageIndicatorTintColor.CGColor);
				CGContextStrokeEllipseInRect (context, dotRect);
			}
			else
			{
				CGContextSetFillColorWithColor (context, pageIndicatorTintColor.CGColor);
				CGContextFillEllipseInRect (context, CGRectInset (dotRect, -0.5f, -0.5f));
			}
		}
		
		x += diameter + space;
	}

	CGContextRestoreGState (context);
}

- (void) setCurrentPage: (NSInteger)currentPage;
{
    if (_currentPage == currentPage)
    {
        return;
    }
    
    _currentPage = MIN (MAX (0, currentPage), self.numberOfPages - 1);
    
    if (!self.defersCurrentPageDisplay)
    {
        [self setNeedsDisplay];
    }
}

- (void) setNumberOfPages: (NSInteger)numberOfPages;
{
    _numberOfPages = MAX (0, numberOfPages);
    _currentPage = MIN (MAX (0, _currentPage), _numberOfPages - 1);
    self.bounds = self.bounds;
    [self setNeedsDisplay];
    
    if (self.hidesForSinglePage && numberOfPages < 2)
    {
        [self setHidden: YES];
    }
    else
    {
        [self setHidden: NO];
    }
}

- (void) setHidesForSinglePage: (BOOL)hidesForSinglePage;
{
    _hidesForSinglePage = hidesForSinglePage;
    
    if (hidesForSinglePage && self.numberOfPages < 2)
    {
        [self setHidden: YES];
    }
}

- (void) setDefersCurrentPageDisplay: (BOOL)defersCurrentPageDisplay;
{
    _defersCurrentPageDisplay = defersCurrentPageDisplay;
}

- (void) setType: (RCUIPageControlType)type;
{
    _type = type;
    [self setNeedsDisplay];
}

- (void) setPageIndicatorTintColor: (UIColor *)pageIndicatorTintColor;
{
    [_pageIndicatorTintColor release];
    _pageIndicatorTintColor = [pageIndicatorTintColor retain];
    [self setNeedsDisplay];
}

- (void) setCurrentPageIndicatorTintColor: (UIColor *)currentPageIndicatorTintColor;
{
    [_currentPageIndicatorTintColor release];
    _currentPageIndicatorTintColor = [currentPageIndicatorTintColor retain];
    [self setNeedsDisplay];
}

- (void) setIndicatorDiameter: (CGFloat)indicatorDiameter;
{
    _indicatorDiameter = indicatorDiameter;
    self.bounds = self.bounds;
    [self setNeedsDisplay];
}

- (void) setIndicatorSpace: (CGFloat)indicatorSpace;
{
    _indicatorSpace = indicatorSpace;
    self.bounds = self.bounds;
    [self setNeedsDisplay];
}

- (void) setFrame: (CGRect)frame;
{
    frame.size = [self sizeForNumberOfPages: self.numberOfPages];
    [super setFrame: frame];
}

- (void) setBounds: (CGRect)bounds;
{
    bounds.size = [self sizeForNumberOfPages: self.numberOfPages];
    [super setBounds: bounds];
}

- (void) updateCurrentPageDisplay;
{
    if (!self.defersCurrentPageDisplay)
    {
        return;
    }
    
    [self setNeedsDisplay];
}

- (CGSize) sizeForNumberOfPages: (NSInteger)pageCount;
{
    CGFloat diameter = (self.indicatorDiameter > 0) ? self.indicatorDiameter : kDefaultDotDiameter;
    CGFloat space = (self.indicatorSpace > 0) ? self.indicatorSpace : kDefaultDotSpace;
    return CGSizeMake (pageCount * diameter + (pageCount - 1) * space + 44.f, MAX (44.0f, diameter + 4.0f));
}

- (void) touchesEnded: (NSSet *)touches withEvent: (UIEvent *)event;
{
    UITouch *theTouch = (UITouch *)[touches anyObject];
    CGPoint location = [theTouch locationInView: self];
    
    if (location.x < (self.bounds.size.width / 2))
    {
        self.currentPage = MAX (0, self.currentPage - 1);
    }
    else
    {
        self.currentPage = MIN (self.numberOfPages - 1, self.currentPage + 1);
    }
    
    [self sendActionsForControlEvents: UIControlEventValueChanged];
}

- (void) dealloc;
{
    self.pageIndicatorTintColor = nil;
    self.currentPageIndicatorTintColor = nil;
    
    [super dealloc];
}

@end
