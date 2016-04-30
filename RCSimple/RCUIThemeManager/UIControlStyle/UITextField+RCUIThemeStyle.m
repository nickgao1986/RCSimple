//
//  UITextField+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UITextField+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>
#import "RCUIGlobalCommon.h"

@implementation UITextField (RCUIThemeStyle)

+ (id) uiTextFieldWithThemeStyle: (RCUITextFieldThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UITextField *textField = [[[UITextField alloc] initWithFrame: frame] autorelease];
    [textField uiApplyThemeStyle: themeStyle];
    return textField;
}

+ (id) uiTextFieldWithThemeStyle: (RCUITextFieldThemeStyle *)themeStyle;
{
    return [UITextField uiTextFieldWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUITextFieldThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUITextFieldThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUITextFieldThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (RCUIIsIPAD() && themeStyle.padFont)
        {
            self.font = themeStyle.padFont;
        }
        else if(themeStyle.font)
        {
            self.font = themeStyle.font;
        }
        
        if (themeStyle.textColor)
        {
            self.textColor = themeStyle.textColor;
        }
        
        if (themeStyle.placeHolderColor)
        {
            if (self.placeholder)
            {
                [self setAttributedPlaceholder: [[[NSAttributedString alloc] initWithString: self.placeholder attributes: @{NSForegroundColorAttributeName: themeStyle.placeHolderColor}] autorelease]];
            }
        }

        if (themeStyle.caretColor)
        {
            CGFloat r,g,b,a;
            [themeStyle.caretColor getRed:&r green:&g blue:&b alpha:&a];
            self.tintColor = [UIColor colorWithRed:r green:g blue:b alpha:0.4f];
        }
        
        if (themeStyle.background)
        {
            self.background = [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.background];
        }
        
        if (themeStyle.backgroundDisable)
        {
            self.disabledBackground = [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundDisable];
        }
    }
}

@end



@implementation RCUINumberTipTextField (RCUIThemeStyle)

+ (id) uiNumberTextFieldWithThemeStyle: (RCUINumberTextFieldThemeStyle *)themeStyle;
{
    RCUINumberTipTextField *textField = [[[RCUINumberTipTextField alloc] initWithFrame: CGRectZero] autorelease];
    [textField uiApplyThemeStyle: themeStyle];
    return textField;
}

- (void) uiApplyThemeStyle: (RCUINumberTextFieldThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUINumberTextFieldThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUINumberTextFieldThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.background)
        {
            self.backgroundColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.background];
        }
        
        if (themeStyle.borderColor)
        {
            self.layer.borderColor = themeStyle.borderColor.CGColor;
        }
        
        if (themeStyle.borderWidth)
        {
            self.layer.borderWidth = [themeStyle.borderWidth doubleValue];
        }
        
        if (themeStyle.cornerRadius)
        {
            self.layer.cornerRadius = [themeStyle.cornerRadius doubleValue];
        }
        
        if (themeStyle.textColor)
        {
            self.textColor = themeStyle.textColor;
        }
        
        if (themeStyle.textFont)
        {
            self.textFont = themeStyle.textFont;
        }
        
        if (themeStyle.residueColor)
        {
            self.residueColor = themeStyle.residueColor;
        }
        
        if (themeStyle.residueHighlightedColor)
        {
            self.residueHighlightedColor = themeStyle.residueHighlightedColor;
        }
        
        if (themeStyle.residueFont)
        {
            self.residueFont = themeStyle.residueFont;
        }
    }
}

@end

