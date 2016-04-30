//
//  UIButton+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UIButton+RCUIThemeStyle.h"
#import "UIView+RCUIThemeStyle.h"
#import "RCUIGlobalCommon.h"
#import "RCUIGlobalStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIButton (RCUIThemeStyle)

+ (id) uiButtonWithThemeStyle: (RCUIButtonThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UIButton *button = [[[UIButton alloc] initWithFrame: frame] autorelease];
    [button uiApplyThemeStyle: themeStyle];
    return button;
}

+ (id) uiButtonWithThemeStyle: (RCUIButtonThemeStyle *)themeStyle;
{
    return [UIButton uiButtonWithThemeStyle: themeStyle frame: CGRectZero];
}

+ (id) uiButtonWithiOS7ThemeStyle: (RCUIButtonThemeStyle *)themeStyle frame: (CGRect)frame radius: (CGFloat)radius;
{
    UIButton *button = [[[UIButton alloc] initWithFrame: frame] autorelease];
    [button uiApplyiOS7ThemeStyle: themeStyle radius: radius];
    return button;
}

+ (id) uiButtonWithiOS7ThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
{
    return [UIButton uiButtonWithiOS7ThemeStyle: themeStyle frame: CGRectZero radius: radius];
}

- (void) uiApplyThemeStyle: (RCUIButtonThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIButtonThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIButtonThemeStyle *)(themeStyle.style)];
    }
    else
    {
        [super uiApplyThemeStyle: themeStyle];
        
        if (themeStyle.font)
        {
            self.titleLabel.font = themeStyle.font;
        }
        
        if (themeStyle.titleColorNormal)
        {
            [self setTitleColor: themeStyle.titleColorNormal forState: UIControlStateNormal];
        }
        
        if (themeStyle.titleColorHighlighted)
        {
            [self setTitleColor: themeStyle.titleColorHighlighted forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.titleColorDisable)
        {
            [self setTitleColor: themeStyle.titleColorDisable forState: UIControlStateDisabled];
        }

        if (themeStyle.titleColorSelectedDisable)
        {
            [self setTitleColor: themeStyle.titleColorSelectedDisable forState: UIControlStateDisabled | UIControlStateSelected];
        }
        
        if (themeStyle.titleColorSelected)
        {
            [self setTitleColor: themeStyle.titleColorSelected forState: UIControlStateSelected];
        }
        
        if (themeStyle.titleColorSelectedHighlighted)
        {
            [self setTitleColor: themeStyle.titleColorSelectedHighlighted forState: UIControlStateSelected | UIControlStateHighlighted];
        }
        
        if (themeStyle.backgroundNormal)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundNormal]
                            forState: UIControlStateNormal];
        }
        
        if (themeStyle.backgroundHighlighted)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundHighlighted]
                            forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.backgroundDisable)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundDisable]
                            forState: UIControlStateDisabled];
        }
        
        if (themeStyle.backgroundSelected)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundSelected]
                            forState: UIControlStateSelected];
        }
        
        if (themeStyle.backgroundSelectedHighlighted)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundSelectedHighlighted]
                            forState: UIControlStateSelected | UIControlStateHighlighted];
        }

        if (themeStyle.backgroundSelectedDisable)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundSelectedDisable]
                            forState: UIControlStateSelected | UIControlStateDisabled];
        }
        
        if (themeStyle.imageNormal)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageNormal]
                  forState: UIControlStateNormal];
        }
        
        if (themeStyle.imageHighlighted)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageHighlighted]
                  forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.imageDisable)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageDisable]
                  forState: UIControlStateDisabled];
        }
        
        if (themeStyle.imageSelected)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageSelected]
                  forState: UIControlStateSelected];
        }
        
        if (themeStyle.imageSelectedHighlighted)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageSelectedHighlighted]
                  forState: UIControlStateSelected | UIControlStateHighlighted];
        }
        
        if (themeStyle.imageSelectedDisable)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageSelectedDisable]
                  forState: UIControlStateSelected | UIControlStateDisabled];
        }
    }
}

- (void) uiApplyiOS7ThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
{
    if ([themeStyle.style isKindOfClass: [RCUIButtonThemeStyle class]])
    {
        [self uiApplyiOS7ThemeStyle: (RCUIButtonThemeStyle *)(themeStyle.style) radius: radius];
    }
    else
    {
        if (themeStyle.font)
        {
            self.titleLabel.font = themeStyle.font;
        }
        
        if (themeStyle.titleColorNormal)
        {
            [self setTitleColor: themeStyle.titleColorNormal forState: UIControlStateNormal];
        }
        
        if (themeStyle.titleColorHighlighted)
        {
            [self setTitleColor: themeStyle.titleColorHighlighted forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.titleColorDisable)
        {
            [self setTitleColor: themeStyle.titleColorDisable forState: UIControlStateDisabled];
        }
        
        if (themeStyle.titleColorSelectedDisable)
        {
            [self setTitleColor: themeStyle.titleColorSelectedDisable forState: UIControlStateSelected | UIControlStateDisabled];
        }
        
        if (themeStyle.titleColorSelected)
        {
            [self setTitleColor: themeStyle.titleColorSelected forState: UIControlStateSelected];
        }

        if (themeStyle.titleColorSelectedHighlighted)
        {
            [self setTitleColor: themeStyle.titleColorSelectedHighlighted forState: UIControlStateSelected | UIControlStateHighlighted];
        }
        
        if ([themeStyle.backgroundNormal isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundNormal
                                                         borderColor: nil
                                                              radius: radius]
                            forState: UIControlStateNormal];
        }
        
        if ([themeStyle.backgroundHighlighted isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundHighlighted
                                                         borderColor: nil
                                                              radius: radius]
                            forState: UIControlStateHighlighted];
        }
        
        if ([themeStyle.backgroundDisable isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundDisable
                                                         borderColor: nil
                                                              radius: radius]
                            forState: UIControlStateDisabled];
        }
        
        if ([themeStyle.backgroundSelectedDisable isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundSelectedDisable
                                                         borderColor: nil
                                                              radius: radius]
                            forState: UIControlStateSelected | UIControlStateDisabled];
        }
        
        if ([themeStyle.backgroundSelected isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundSelected
                                                         borderColor: nil
                                                              radius: radius]
                            forState: UIControlStateSelected];
        }

        if (themeStyle.backgroundSelectedHighlighted)
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundSelectedHighlighted
                                                         borderColor: nil
                                                              radius: radius]
                            forState: UIControlStateSelected | UIControlStateHighlighted];
        }
        
        if (themeStyle.imageNormal)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageNormal]
                  forState: UIControlStateNormal];
        }
        
        if (themeStyle.imageHighlighted)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageHighlighted]
                  forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.imageDisable)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageDisable]
                  forState: UIControlStateDisabled];
        }
        
        if (themeStyle.imageSelectedDisable)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageSelectedDisable]
                  forState: UIControlStateSelected | UIControlStateDisabled];
        }
        
        if (themeStyle.imageSelected)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageSelected]
                  forState: UIControlStateSelected];
        }

        if (themeStyle.imageSelectedHighlighted)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageSelectedHighlighted]
                  forState: UIControlStateSelected | UIControlStateHighlighted];
        }
    }
}

- (void) uiApplyiOS7BorderThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
{
    if ([themeStyle.style isKindOfClass: [RCUIButtonThemeStyle class]])
    {
        [self uiApplyiOS7ThemeStyle: (RCUIButtonThemeStyle *)(themeStyle.style) radius: radius];
    }
    else
    {
        if (themeStyle.font)
        {
            self.titleLabel.font = themeStyle.font;
        }
        
        if (themeStyle.titleColorNormal)
        {
            [self setTitleColor: themeStyle.titleColorNormal forState: UIControlStateNormal];
        }
        
        if (themeStyle.titleColorHighlighted)
        {
            [self setTitleColor: themeStyle.titleColorHighlighted forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.titleColorDisable)
        {
            [self setTitleColor: themeStyle.titleColorDisable forState: UIControlStateDisabled];
        }
        
        if (themeStyle.titleColorSelected)
        {
            [self setTitleColor: themeStyle.titleColorSelected forState: UIControlStateSelected];
        }
        
        if (themeStyle.titleColorSelectedHighlighted)
        {
            [self setTitleColor: themeStyle.titleColorSelectedHighlighted forState: UIControlStateSelected | UIControlStateHighlighted];
        }
        
        if ([themeStyle.backgroundNormal isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: nil
                                                         borderColor: (UIColor *)themeStyle.backgroundNormal
                                                              radius: radius]
                            forState: UIControlStateNormal];
        }
        
        if ([themeStyle.backgroundHighlighted isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundHighlighted
                                                         borderColor: (UIColor *)themeStyle.backgroundHighlighted
                                                              radius: radius]
                            forState: UIControlStateHighlighted];
        }
        
        if ([themeStyle.backgroundDisable isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: nil
                                                         borderColor: (UIColor *)themeStyle.backgroundDisable
                                                              radius: radius]
                            forState: UIControlStateDisabled];
        }
        
        if ([themeStyle.backgroundSelected isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundSelected
                                                         borderColor: (UIColor *)themeStyle.backgroundSelected
                                                              radius: radius]
                            forState: UIControlStateSelected];
        }
        
        if ([themeStyle.backgroundSelectedHighlighted isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundSelectedHighlighted
                                                         borderColor: (UIColor *)themeStyle.backgroundSelectedHighlighted
                                                              radius: radius]
                            forState: UIControlStateSelected | UIControlStateHighlighted];
        }
        
        if (themeStyle.imageNormal)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageNormal]
                  forState: UIControlStateNormal];
        }
        
        if (themeStyle.imageHighlighted)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageHighlighted]
                  forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.imageDisable)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageDisable]
                  forState: UIControlStateDisabled];
        }
        
        if (themeStyle.imageSelected)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageSelected]
                  forState: UIControlStateSelected];
        }
        
        if (themeStyle.imageSelectedHighlighted)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageSelectedHighlighted]
                  forState: UIControlStateSelected | UIControlStateHighlighted];
        }
    }
}

- (void) uiApplyiOS7TextThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
{
    if ([themeStyle.style isKindOfClass: [RCUIButtonThemeStyle class]])
    {
        [self uiApplyiOS7ThemeStyle: (RCUIButtonThemeStyle *)(themeStyle.style) radius: radius];
    }
    else
    {
        if (themeStyle.font)
        {
            self.titleLabel.font = themeStyle.font;
        }
        
        if (themeStyle.titleColorNormal)
        {
            [self setTitleColor: themeStyle.titleColorNormal forState: UIControlStateNormal];
        }
        
        if (themeStyle.titleColorHighlighted)
        {
            [self setTitleColor: themeStyle.titleColorHighlighted forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.titleColorDisable)
        {
            [self setTitleColor: themeStyle.titleColorDisable forState: UIControlStateDisabled];
        }
        
        if (themeStyle.titleColorSelectedDisable)
        {
            [self setTitleColor: themeStyle.titleColorSelectedDisable forState: UIControlStateSelected | UIControlStateDisabled];
        }
        
        if (themeStyle.titleColorSelected)
        {
            [self setTitleColor: themeStyle.titleColorSelected forState: UIControlStateSelected];
        }
        
        if (themeStyle.titleColorSelectedHighlighted)
        {
            [self setTitleColor: themeStyle.titleColorSelectedHighlighted forState: UIControlStateSelected | UIControlStateHighlighted];
        }
        
        if ([themeStyle.backgroundNormal isKindOfClass: [UIColor class]] &&
            [themeStyle.imageNormal isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundNormal
                                                         borderColor: (UIColor *)themeStyle.imageNormal
                                                              radius: radius]
                            forState: UIControlStateNormal];
        }
        
        if ([themeStyle.backgroundHighlighted isKindOfClass: [UIColor class]] &&
            [themeStyle.imageHighlighted isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundHighlighted
                                                         borderColor: (UIColor *)themeStyle.imageHighlighted
                                                              radius: radius]
                            forState: UIControlStateHighlighted];
        }
        
        if ([themeStyle.backgroundDisable isKindOfClass: [UIColor class]] &&
            [themeStyle.imageDisable isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundDisable
                                                         borderColor: (UIColor *)themeStyle.imageDisable
                                                              radius: radius]
                            forState: UIControlStateDisabled];
        }
        
        if ([themeStyle.backgroundSelectedDisable isKindOfClass: [UIColor class]] &&
            [themeStyle.imageSelectedDisable isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundSelectedDisable
                                                         borderColor: (UIColor *)themeStyle.imageSelectedDisable
                                                              radius: radius]
                            forState: UIControlStateSelected | UIControlStateDisabled];
        }
        
        if ([themeStyle.backgroundSelected isKindOfClass: [UIColor class]] &&
            [themeStyle.imageSelected isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundSelected
                                                         borderColor: (UIColor *)themeStyle.imageSelected
                                                              radius: radius]
                            forState: UIControlStateSelected];
        }
        
        if ([themeStyle.backgroundSelectedHighlighted isKindOfClass: [UIColor class]] &&
            [themeStyle.imageSelectedHighlighted isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundSelectedHighlighted
                                                         borderColor: (UIColor *)themeStyle.imageSelectedHighlighted
                                                              radius: radius]
                            forState: UIControlStateSelected | UIControlStateHighlighted];
        }
    }
}

- (void) uiApplyiOS7ImageThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
{
    if ([themeStyle.style isKindOfClass: [RCUIButtonThemeStyle class]])
    {
        [self uiApplyiOS7ImageThemeStyle: (RCUIButtonThemeStyle *)(themeStyle.style) radius: radius];
    }
    else
    {
        if ([themeStyle.backgroundNormal isKindOfClass: [UIColor class]] &&
            [themeStyle.titleColorNormal isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundNormal
                                                         borderColor: (UIColor *)themeStyle.titleColorNormal
                                                              radius: radius]
                            forState: UIControlStateNormal];
        }
        
        if ([themeStyle.backgroundHighlighted isKindOfClass: [UIColor class]] &&
            [themeStyle.titleColorHighlighted isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundHighlighted
                                                         borderColor: (UIColor *)themeStyle.titleColorHighlighted
                                                              radius: radius]
                            forState: UIControlStateHighlighted];
        }
        
        if ([themeStyle.backgroundDisable isKindOfClass: [UIColor class]] &&
            [themeStyle.titleColorDisable isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundDisable
                                                         borderColor: (UIColor *)themeStyle.titleColorDisable
                                                              radius: radius]
                            forState: UIControlStateDisabled];
        }
        
        if ([themeStyle.backgroundSelected isKindOfClass: [UIColor class]] &&
            [themeStyle.titleColorSelected isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundSelected
                                                         borderColor: (UIColor *)themeStyle.titleColorSelected
                                                              radius: radius]
                            forState: UIControlStateSelected];
        }
        
        if ([themeStyle.backgroundSelectedHighlighted isKindOfClass: [UIColor class]] &&
            [themeStyle.titleColorSelectedHighlighted isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundSelectedHighlighted
                                                         borderColor: (UIColor *)themeStyle.titleColorSelectedHighlighted
                                                              radius: radius]
                            forState: UIControlStateSelected | UIControlStateHighlighted];
        }
        
        if ([themeStyle.backgroundSelectedDisable isKindOfClass: [UIColor class]] &&
            [themeStyle.titleColorSelectedDisable isKindOfClass: [UIColor class]])
        {
            [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                           fillColor: (UIColor *)themeStyle.backgroundSelectedDisable
                                                         borderColor: (UIColor *)themeStyle.titleColorSelectedDisable
                                                              radius: radius]
                            forState: UIControlStateSelected | UIControlStateDisabled];
        }
        
        if (themeStyle.imageNormal)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageNormal]
                  forState: UIControlStateNormal];
        }
        
        if (themeStyle.imageHighlighted)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageHighlighted]
                  forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.imageDisable)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageDisable]
                  forState: UIControlStateDisabled];
        }
        
        if (themeStyle.imageSelected)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageSelected]
                  forState: UIControlStateSelected];
        }
        
        if (themeStyle.imageSelectedHighlighted)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageSelectedHighlighted]
                  forState: UIControlStateSelected | UIControlStateHighlighted];
        }
        
        if (themeStyle.imageSelectedDisable)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.imageSelectedDisable]
                  forState: UIControlStateSelected | UIControlStateDisabled];
        }
    }
}

- (void) uiApplyPlusInCircleThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
{
    if (themeStyle.imageNormal)
    {
        [self setImage: [UIImage uiImageWithAddRadius: radius
                                            fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                          borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
              forState: UIControlStateNormal];
    }

    if (themeStyle.imageHighlighted)
    {
        [self setImage: [UIImage uiImageWithAddRadius: radius
                                            fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                          borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
              forState: UIControlStateHighlighted];
    }
}

- (void) uiApplyDeleteInCircleThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
{
    if (themeStyle.imageNormal)
    {
        [self setImage: [UIImage uiImageWithCloseRadius: radius
                                              fillColor: [UIColor clearColor]
                                            borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
              forState: UIControlStateNormal];
    }
    
    if (themeStyle.imageHighlighted)
    {
        [self setImage: [UIImage uiImageWithCloseRadius: radius
                                              fillColor: [UIColor clearColor]
                                            borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
              forState: UIControlStateHighlighted];
    }
}

- (void) uiApplyArrowInCircleThemeStyle: (RCUIButtonThemeStyle *)themeStyle direction: (RCUIArrowDirection)direction radius: (CGFloat)radius;
{
    if (themeStyle.imageNormal)
    {
        [self setImage: [UIImage uiImageWithAccessoryRadius: radius direction: direction borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
              forState: UIControlStateNormal];
    }
    
    if (themeStyle.imageHighlighted)
    {
        [self setImage: [UIImage uiImageWithAccessoryRadius: radius direction: direction borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
              forState: UIControlStateHighlighted];
    }
    
    if (themeStyle.imageDisable)
    {
        [self setImage: [UIImage uiImageWithAccessoryRadius: radius direction: direction borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageDisable]]
              forState: UIControlStateDisabled];
    }
}

- (void) uiApplyBackIndicatorThemeStyle: (RCUIButtonThemeStyle *)themeStyle;
{
    if (themeStyle.imageNormal)
    {
        [self setImage: [UIImage uiImageWithBackIndicatorColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal] lineWidth: 3.f]
              forState: UIControlStateNormal];
    }
    
    if (themeStyle.imageHighlighted)
    {
        [self setImage: [UIImage uiImageWithBackIndicatorColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted] lineWidth: 3.f]
              forState: UIControlStateHighlighted];
    }
}

- (void) uiApplyPopupIndicatorThemeStyle: (RCUIButtonThemeStyle *)themeStyle;
{
    if (themeStyle.imageNormal)
    {
        [self setImage: [UIImage uiImageWithPopoverIndicatorColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal] lineWidth: 3.f]
              forState: UIControlStateNormal];
    }
    
    if (themeStyle.imageHighlighted)
    {
        [self setImage: [UIImage uiImageWithPopoverIndicatorColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted] lineWidth: 3.f]
              forState: UIControlStateHighlighted];
    }
    
    if (themeStyle.imageSelected)
    {
        [self setImage: [UIImage uiImageWithPopoverIndicatorColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageSelected] lineWidth: 3.f]
              forState: UIControlStateSelected];
    }
}

- (void) uiApplyiOS7ArrowThemeStyle: (RCUIButtonThemeStyle *)themeStyle radius: (CGFloat)radius;
{
    if (themeStyle.font)
    {
        self.titleLabel.font = themeStyle.font;
    }
    
    if (themeStyle.titleColorNormal)
    {
        [self setTitleColor: themeStyle.titleColorNormal forState: UIControlStateNormal];
    }
    
    if (themeStyle.titleColorHighlighted)
    {
        [self setTitleColor: themeStyle.titleColorHighlighted forState: UIControlStateHighlighted];
    }
    
    if (themeStyle.titleColorDisable)
    {
        [self setTitleColor: themeStyle.titleColorDisable forState: UIControlStateDisabled];
    }
    
    if (themeStyle.titleColorSelected)
    {
        [self setTitleColor: themeStyle.titleColorSelected forState: UIControlStateSelected];
    }
    
    if (themeStyle.titleColorSelectedHighlighted)
    {
        [self setTitleColor: themeStyle.titleColorSelectedHighlighted forState: UIControlStateSelected | UIControlStateHighlighted];
    }
    
    if ([themeStyle.backgroundNormal isKindOfClass: [UIColor class]])
    {
        [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                       fillColor: (UIColor *)themeStyle.backgroundNormal
                                                     borderColor: nil
                                                          radius: radius]
                        forState: UIControlStateNormal];
    }
    
    if ([themeStyle.backgroundHighlighted isKindOfClass: [UIColor class]])
    {
        [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                       fillColor: (UIColor *)themeStyle.backgroundHighlighted
                                                     borderColor: nil
                                                          radius: radius]
                        forState: UIControlStateHighlighted];
    }
    
    if ([themeStyle.backgroundDisable isKindOfClass: [UIColor class]])
    {
        [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                       fillColor: (UIColor *)themeStyle.backgroundDisable
                                                     borderColor: nil
                                                          radius: radius]
                        forState: UIControlStateDisabled];
    }
    
    if ([themeStyle.backgroundSelected isKindOfClass: [UIColor class]])
    {
        [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                       fillColor: (UIColor *)themeStyle.backgroundSelected
                                                     borderColor: nil
                                                          radius: radius]
                        forState: UIControlStateSelected];
    }
    
    if (themeStyle.backgroundSelectedHighlighted)
    {
        [self setBackgroundImage: [UIImage uiImageWithBezierType: RCUIBezierTypeAll
                                                       fillColor: (UIColor *)themeStyle.backgroundSelectedHighlighted
                                                     borderColor: nil
                                                          radius: radius]
                        forState: UIControlStateSelected | UIControlStateHighlighted];
    }
    
    if (themeStyle.imageNormal)
    {
        [self setImage: [UIImage uiImageWithArrowColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal] direction: RCUIArrowDirectionDown]
              forState: UIControlStateNormal];
    }
    
    if (themeStyle.imageHighlighted)
    {
        [self setImage: [UIImage uiImageWithArrowColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted] direction: RCUIArrowDirectionDown]
              forState: UIControlStateHighlighted];
    }
    
    if (themeStyle.imageDisable)
    {
        [self setImage: [UIImage uiImageWithArrowColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageDisable] direction: RCUIArrowDirectionDown]
              forState: UIControlStateDisabled];
    }
    
    if (themeStyle.imageSelected)
    {
        [self setImage: [UIImage uiImageWithArrowColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageSelected] direction: RCUIArrowDirectionDown]
              forState: UIControlStateSelected];
    }
    
    if (themeStyle.imageSelectedHighlighted)
    {
        [self setImage: [UIImage uiImageWithArrowColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageSelectedHighlighted] direction: RCUIArrowDirectionDown]
              forState: UIControlStateSelected | UIControlStateHighlighted];
    }
}

- (UIImage *) generateImageWithCircle: (CGFloat)radius fillColor: (UIColor *)fillColor borderColor: (UIColor *)borderColor borderWidth: (CGFloat)borderWidth;
{
    CGRect rect = CGRectMake (0, 0, 2 * radius, 2 * radius);
    UIGraphicsBeginImageContextWithOptions (rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext ();
    CGContextSetLineWidth (context, borderWidth);
    
    if (borderColor)
    {
        CGContextSetStrokeColorWithColor (context, borderColor.CGColor);
    }
    else
    {
        CGContextSetStrokeColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    if (fillColor)
    {
        CGContextSetFillColorWithColor (context, fillColor.CGColor);
    }
    else
    {
        CGContextSetFillColorWithColor (context, [UIColor clearColor].CGColor);
    }
    
    CGContextAddArc (context, radius, radius, radius - 1, 0, 2 * M_PI, 0);
    if (fillColor && borderColor)
    {
        CGContextDrawPath (context, kCGPathFill);
    }
    else
    {
        if (fillColor)
        {
            CGContextDrawPath (context, kCGPathFill);
        }
        
        if (borderColor)
        {
            CGContextDrawPath (context, kCGPathStroke);
        }
    }
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext ();
    UIGraphicsEndImageContext ();
    return theImage;
}

- (void) uiApplyKeypadNumberThemeStyle: (RCUIButtonThemeStyle *)themeStyle keypad: (RCUIKeypad)key radius: (CGFloat)radius;
{
    switch (key)
    {
    case RCUIKeypad_1:
        {
            [self setBackgroundImage: [UIImage uiImageWithKeypad1: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [UIImage uiImageWithKeypad1: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
                            forState: UIControlStateHighlighted];
        }
        break;
            
    case RCUIKeypad_2:
        {
            [self setBackgroundImage: [UIImage uiImageWithKeypad2: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [UIImage uiImageWithKeypad2: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
                            forState: UIControlStateHighlighted];
        }
        break;
            
    case RCUIKeypad_3:
        {
            [self setBackgroundImage: [UIImage uiImageWithKeypad3: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [UIImage uiImageWithKeypad3: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
                            forState: UIControlStateHighlighted];
        }
        break;
            
    case RCUIKeypad_4:
        {
            [self setBackgroundImage: [UIImage uiImageWithKeypad4: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [UIImage uiImageWithKeypad4: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
                            forState: UIControlStateHighlighted];
        }
        break;
            
    case RCUIKeypad_5:
        {
            [self setBackgroundImage: [UIImage uiImageWithKeypad5: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [UIImage uiImageWithKeypad5: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
                            forState: UIControlStateHighlighted];
        }
        break;
            
    case RCUIKeypad_6:
        {
            [self setBackgroundImage: [UIImage uiImageWithKeypad6: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [UIImage uiImageWithKeypad6: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
                            forState: UIControlStateHighlighted];
        }
        break;
            
    case RCUIKeypad_7:
        {
            [self setBackgroundImage: [UIImage uiImageWithKeypad7: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [UIImage uiImageWithKeypad7: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
                            forState: UIControlStateHighlighted];
        }
        break;
            
    case RCUIKeypad_8:
        {
            [self setBackgroundImage: [UIImage uiImageWithKeypad8: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [UIImage uiImageWithKeypad8: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
                            forState: UIControlStateHighlighted];
        }
        break;
            
    case RCUIKeypad_9:
        {
            [self setBackgroundImage: [UIImage uiImageWithKeypad9: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [UIImage uiImageWithKeypad9: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
                            forState: UIControlStateHighlighted];
        }
        break;
            
    case RCUIKeypad_0:
        {
            [self setBackgroundImage: [UIImage uiImageWithKeypad0: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [UIImage uiImageWithKeypad0: radius
                                                        fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                      borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
                            forState: UIControlStateHighlighted];
        }
        break;
            
    case RCUIKeypad_P:
        {
            [self setBackgroundImage: [UIImage uiImageWithKeypadPaund: radius
                                                            fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                          borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [UIImage uiImageWithKeypadPaund: radius
                                                            fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                          borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]]
                            forState: UIControlStateHighlighted];
        }
        break;
            
    case RCUIKeypad_S:
        {
            /*
             * System Issue
             */
            [self setTitle: @"*" forState: UIControlStateNormal];
            [self setTitle: @"*" forState: UIControlStateHighlighted];
            [self setTitleColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal] forState: UIControlStateNormal];
            [self setTitleColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted] forState: UIControlStateHighlighted];
            self.titleLabel.font = RCUIUltraLightSystemFont( (RCUIIsIPAD () ? (RCUIIsOrientationLandscapeSupported() ? 69 : 77) : RCUIIsIPHONE4 () ? 53 : 64) );
            if (RCUIIsIOSSDKVersionAbove7 ())
            {
                CGFloat insetSize = RCUIIsIPAD () ? 34 : RCUIIsIPHONE4 () ? 23 : RCUIIsIPHONE5 () ? 29 : RCUIIsIPHONE6 () ? 28 : 27;
                self.titleEdgeInsets = UIEdgeInsetsMake (insetSize, 0, 0, 0);
            }
            else
            {
                self.titleEdgeInsets = UIEdgeInsetsMake ((RCUIIsIPAD () ? 48 : ceil (48 * RCUIDeviceVerticalScaleRatio ())), 0, 0, 0);
            }
            
            [self setBackgroundImage: [self generateImageWithCircle: radius
                                                          fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                        borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageNormal]
                                                        borderWidth: 1.f]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [self generateImageWithCircle: radius
                                                          fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                        borderColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.imageHighlighted]
                                                        borderWidth: 1.f]
                            forState: UIControlStateHighlighted];
        }
        break;
            
    case RCUIKeypad_Call:
        {
            [self setImage: themeStyle.imageNormal forState: UIControlStateNormal];
            [self setImage: themeStyle.imageHighlighted forState: UIControlStateHighlighted];
            
            [self setBackgroundImage: [self generateImageWithCircle: radius
                                                          fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundNormal]
                                                        borderColor: nil
                                                        borderWidth: 1.f]
                            forState: UIControlStateNormal];
            [self setBackgroundImage: [self generateImageWithCircle: radius
                                                          fillColor: [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.backgroundHighlighted]
                                                        borderColor: nil
                                                        borderWidth: 1.f]
                            forState: UIControlStateHighlighted];
        }
        break;
    }
}

@end



