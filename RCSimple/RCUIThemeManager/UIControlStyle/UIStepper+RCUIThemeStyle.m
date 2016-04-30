//
//  UIStepper+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UIStepper+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIStepper (RCUIThemeStyle)

+ (id) uiStepperWithThemeStyle: (RCUIStepperThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UIStepper *stepper = [[[UIStepper alloc] initWithFrame: frame] autorelease];
    [stepper uiApplyThemeStyle: themeStyle];
    return stepper;
}

+ (id) uiStepperWithThemeStyle: (RCUIStepperThemeStyle *)themeStyle;
{
    return [UIStepper uiStepperWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUIStepperThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIStepperThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIStepperThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.backgroundNormal)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundNormal] forState: UIControlStateNormal];
        }
        
        if (themeStyle.backgroundHighlighted)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundHighlighted] forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.backgroundDisable)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundDisable] forState: UIControlStateDisabled];
        }
        
        if (themeStyle.backgroundSelected)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundSelected] forState: UIControlStateSelected];
        }
        
        if (themeStyle.dividerNormalSelected)
        {
            [self setDividerImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.dividerNormalSelected]
              forLeftSegmentState: UIControlStateNormal
                rightSegmentState: UIControlStateSelected];
        }
        
        if (themeStyle.dividerSelectedNormal)
        {
            [self setDividerImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.dividerSelectedNormal]
              forLeftSegmentState: UIControlStateSelected
                rightSegmentState: UIControlStateNormal];
        }
        
        if (themeStyle.incrementNormal)
        {
            [self setIncrementImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.incrementNormal] forState: UIControlStateNormal];
        }
        
        if (themeStyle.incrementHighlighted)
        {
            [self setIncrementImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.incrementHighlighted] forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.incrementDisable)
        {
            [self setIncrementImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.incrementDisable] forState: UIControlStateDisabled];
        }
        
        if (themeStyle.incrementSelected)
        {
            [self setIncrementImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.incrementSelected] forState: UIControlStateSelected];
        }
        
        if (themeStyle.decrementNormal)
        {
            [self setDecrementImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.decrementNormal] forState: UIControlStateNormal];
        }
        
        if (themeStyle.decrementHighlighted)
        {
            [self setDecrementImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.decrementHighlighted] forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.decrementDisable)
        {
            [self setDecrementImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.decrementDisable] forState: UIControlStateDisabled];
        }
        
        if (themeStyle.decrementSelected)
        {
            [self setDecrementImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.decrementDisable] forState: UIControlStateSelected];
        }
    }
}

@end
