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

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RCUIPageControlType)
{
    RCUIPageControlTypeFull,
    RCUIPageControlTypeEmpty,
};

@interface RCUIPageControl : UIControl

@property (nonatomic, assign) RCUIPageControlType type;
@property (nonatomic, assign) NSInteger numberOfPages;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) BOOL hidesForSinglePage;
@property (nonatomic, assign) BOOL defersCurrentPageDisplay;
@property (nonatomic, assign) CGFloat indicatorDiameter;
@property (nonatomic, assign) CGFloat indicatorSpace;
@property (nonatomic, retain) UIColor *pageIndicatorTintColor;
@property (nonatomic, retain) UIColor *currentPageIndicatorTintColor;

- (id) initWithType: (RCUIPageControlType)type;
- (void) updateCurrentPageDisplay;
- (CGSize) sizeForNumberOfPages: (NSInteger)pageCount;

@end
