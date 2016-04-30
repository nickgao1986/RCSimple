//
//  RCUINumberTipTextField.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/3/15.
//  Copyright (c) 2015 RingCentral. All rights reserved.
//

#import "RCUINumberTipTextField.h"
#import "RCUIGlobalCommon.h"

@interface RCUINumberTipTextField () <UITextViewDelegate>
@property (nonatomic, retain) UITextView *textField;
@property (nonatomic, retain) UILabel    *residueLabel;
@end

@implementation RCUINumberTipTextField

- (id) initWithFrame: (CGRect)frame;
{
    self = [super initWithFrame: frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds   = YES;
        [self setupTextField];
        [self setupResidueLabel];
    }
    
    return self;
}

- (void) setupTextField;
{
    self.textField = [[[UITextView alloc] init] autorelease];
    self.textField.dataDetectorTypes = UIDataDetectorTypeNone;
    self.textField.backgroundColor   = [UIColor clearColor];
    self.textField.delegate          = self;
    [self addSubview: self.textField];
}

- (void) setupResidueLabel;
{
    self.residueLabel = [[[UILabel alloc] initWithFrame: CGRectZero] autorelease];
    [self.residueLabel setLineBreakMode: NSLineBreakByClipping];
    [self.residueLabel setTextAlignment: NSTextAlignmentRight];
    [self.residueLabel setNumberOfLines: 1];
    [self.residueLabel setBackgroundColor: [UIColor clearColor]];
    [self.residueLabel setAlpha: 1.0];
    [self addSubview: self.residueLabel];
}

- (void) setText: (NSString *)text;
{
    self.textField.text = text;
    NSInteger leftNumber = self.numberOfResidue - text.length;
    self.residueLabel.highlighted = (leftNumber == 0);
    self.residueLabel.text = [NSString stringWithFormat: @"%ld", (long)leftNumber];
}

- (NSString *) text;
{
    return self.textField.text;
}

- (void) setTextFont: (UIFont *)textFont;
{
    self.textField.font = textFont;
}

- (UIFont *) textFont;
{
    return self.textField.font;
}

- (void) setTextColor: (UIColor *)textColor;
{
    self.textField.textColor = textColor;
}

- (UIColor *) textColor;
{
    return self.textField.textColor;
}

- (void) setResidueColor: (UIColor *)residueColor;
{
    self.residueLabel.textColor = residueColor;
}

- (void) setResidueHighlightedColor: (UIColor *)residueHighlightedColor;
{
    self.residueLabel.highlightedTextColor = residueHighlightedColor;
}

- (UIColor *) residueColor;
{
    return self.residueLabel.textColor;
}

- (UIColor *) residueHighlightedColor;
{
    return self.residueLabel.highlightedTextColor;
}

- (void) setResidueFont: (UIFont *)residueFont;
{
    self.residueLabel.font = residueFont;
    [self setNeedsLayout];
}

- (UIFont *) residueFont;
{
    return self.residueFont;
}

- (void) setNumberOfResidue: (NSInteger)numberOfResidue;
{
    _numberOfResidue = numberOfResidue;
    
    NSInteger leftNumber = numberOfResidue - self.textField.text.length;
    self.residueLabel.highlighted = (leftNumber == 0);
    self.residueLabel.text = [NSString stringWithFormat: @"%ld", (long)leftNumber];
    [self setNeedsLayout];
}

- (void) setHideResidue: (BOOL)hideResidue;
{
    self.residueLabel.hidden = hideResidue;
}

- (BOOL) hideResidue;
{
    return self.residueLabel.hidden;
}

- (void) setFocus: (BOOL)focus;
{
    if (focus)
    {
        [self.textField becomeFirstResponder];
    }
    else
    {
        [self.textField resignFirstResponder];
    }
}

- (void) textViewDidBeginEditing: (UITextView *)textView;
{
    if ([self.delegate respondsToSelector: @selector (didStartNumberTextField:)])
    {
        [self.delegate didStartNumberTextField: self];
    }
}

- (void) textViewDidEndEditing: (UITextView *)textView;
{
    if ([self.delegate respondsToSelector: @selector (didEndNumberTextField:)])
    {
        [self.delegate didEndNumberTextField: self];
    }
}

// const unichar hs = [substring characterAtIndex:0];
// // surrogate pair
// if (0xd800 <= hs && hs <= 0xdbff) {
// if (substring.length > 1) {
// const unichar ls = [substring characterAtIndex:1];
// const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
// if (0x1d000 <= uc && uc <= 0x1f77f) {
// returnValue = YES;
// }
// }
// } else if (substring.length > 1) {
// const unichar ls = [substring characterAtIndex:1];
// if (ls == 0x20e3) {
// returnValue = YES;
// }
// 
// } else {
// // non surrogate
// if (0x2100 <= hs && hs <= 0x27ff) {
// returnValue = YES;
// } else if (0x2B05 <= hs && hs <= 0x2b07) {
// returnValue = YES;
// } else if (0x2934 <= hs && hs <= 0x2935) {
// returnValue = YES;
// } else if (0x3297 <= hs && hs <= 0x3299) {
// returnValue = YES;
// } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
// returnValue = YES;
// }
// }

- (BOOL) textView: (UITextView *)textView shouldChangeTextInRange: (NSRange)range replacementText: (NSString *)replacementText;
{
    NSString *newText = [textView.text stringByReplacingCharactersInRange: range withString: replacementText];
    BOOL shouldChangeText = [newText length] <= (NSUInteger)self.numberOfResidue;
    
    if ([newText length] > (NSUInteger)self.numberOfResidue)
    {
        if (RCUIIsLeftCharContainSurrogateEmoji ([newText characterAtIndex: self.numberOfResidue - 1], [newText characterAtIndex: self.numberOfResidue]))
        {
            newText = [newText substringToIndex: self.numberOfResidue - 1];
        }
        else
        {
            newText = [newText substringToIndex: self.numberOfResidue];
        }
        
        textView.text = newText;
        if ([self.delegate respondsToSelector: @selector (didAlertNumberTextField:)])
        {
            [self.delegate didAlertNumberTextField: self];
        }
    }
    
    NSInteger leftNumber = self.numberOfResidue - newText.length;
    self.residueLabel.highlighted = (leftNumber == 0);
    self.residueLabel.text = [NSString stringWithFormat: @"%ld", (long)leftNumber];
    [self setNeedsLayout];
    
    return shouldChangeText;
}

- (void) textViewDidChange: (UITextView *)textView;
{
    if ([self.delegate respondsToSelector: @selector (numberTextField:didChanged:)])
    {
        [self.delegate numberTextField: self didChanged: textView.text];
    }
}

#define kDefaultHLMargin    5.
#define kDefaultHRMaring    6.
#define kDefautlVBMargin    3.
- (void) layoutSubviews;
{
    [super layoutSubviews];

    [self.residueLabel sizeToFit];
    
    CGRect bounds = self.bounds;
    CGRect rect   = self.residueLabel.frame;
    
    self.residueLabel.frame = CGRectMake (bounds.size.width - rect.size.width - kDefaultHRMaring,
                                          bounds.size.height - rect.size.height - kDefautlVBMargin,
                                          rect.size.width, rect.size.height);
    self.textField.frame = CGRectMake (bounds.origin.x + kDefaultHLMargin, bounds.origin.y, bounds.size.width - kDefaultHLMargin * 2, CGRectGetMinY (self.residueLabel.frame));
}

- (void) dealloc;
{
    self.delegate = nil;
    self.textField.delegate = nil;
    
    [self.textField removeFromSuperview];
    [self.residueLabel removeFromSuperview];
    
    self.textField = nil;
    self.residueLabel = nil;
    
    [super dealloc];
}

@end
