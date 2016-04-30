//
//  UISlider+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UISlider+RCUIThemeStyle.h"
#import "UIImage+RCUIPathCategory.h"
#import <QuartzCore/QuartzCore.h>

@implementation UISlider (RCUIThemeStyle)

+ (id) uiSliderWithThemeStyle: (RCUISliderThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UISlider *slider = [[[UISlider alloc] initWithFrame: frame] autorelease];
    [slider uiApplyThemeStyle: themeStyle];
    return slider;
}

+ (id) uiSliderWithThemeStyle: (RCUISliderThemeStyle *)themeStyle;
{
    return [UISlider uiSliderWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUISliderThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUISliderThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUISliderThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.backgroundMinimumValue)
        {
            self.minimumValueImage = [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundMinimumValue];
        }
        
        if (themeStyle.backgroundMaximumValue)
        {
            self.maximumValueImage = [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.backgroundMaximumValue];
        }
        
        if (themeStyle.thumbNormal)
        {
            [self setThumbImage: [UIImage uiImageWithColors: @[[RCUICommonThemeStyle convertIDObjectToColor: themeStyle.thumbNormal],
                                                               [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.thumbNormal]]
                                                       rect: CGRectMake (0, 0, 4, 22)]
                       forState: UIControlStateNormal];
        }
        
        if (themeStyle.thumbHighlighted)
        {
            [self setThumbImage: [UIImage uiImageWithColors: @[[RCUICommonThemeStyle convertIDObjectToColor: themeStyle.thumbHighlighted],
                                                               [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.thumbHighlighted]]
                                                       rect: CGRectMake (0, 0, 4, 22)]
                       forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.thumbDisable)
        {
            [self setThumbImage: [UIImage uiImageWithColors: @[[RCUICommonThemeStyle convertIDObjectToColor: themeStyle.thumbDisable],
                                                               [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.thumbDisable]]
                                                       rect: CGRectMake (0, 0, 4, 22)]
                       forState: UIControlStateDisabled];
        }
        
        if (themeStyle.thumbSelected)
        {
            [self setThumbImage: [UIImage uiImageWithColors: @[[RCUICommonThemeStyle convertIDObjectToColor: themeStyle.thumbSelected],
                                                               [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.thumbSelected]]
                                                       rect: CGRectMake (0, 0, 4, 22)]
                       forState: UIControlStateSelected];
        }
        
        if (themeStyle.minimumTrackNormal)
        {
            [self setMinimumTrackImage: [UIImage uiImageWithColors: @[[RCUICommonThemeStyle convertIDObjectToColor: themeStyle.minimumTrackNormal],
                                                                      [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.minimumTrackNormal]]
                                                              rect: CGRectMake (0, 0, 10, 4)]
                              forState: UIControlStateNormal];
        }
        
        if (themeStyle.minimumTrackHighlighted)
        {
            [self setMinimumTrackImage: [UIImage uiImageWithColors: @[[RCUICommonThemeStyle convertIDObjectToColor: themeStyle.minimumTrackHighlighted],
                                                                      [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.minimumTrackHighlighted]]
                                                              rect: CGRectMake (0, 0, 10, 4)]
                              forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.minimumTrackDisable)
        {
            [self setMinimumTrackImage: [UIImage uiImageWithColors: @[[RCUICommonThemeStyle convertIDObjectToColor: themeStyle.minimumTrackDisable],
                                                                      [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.minimumTrackDisable]]
                                                              rect: CGRectMake (0, 0, 10, 4)]
                              forState: UIControlStateDisabled];
        }
        
        if (themeStyle.minimumTrackSelected)
        {
            [self setMinimumTrackImage: [UIImage uiImageWithColors: @[[RCUICommonThemeStyle convertIDObjectToColor: themeStyle.minimumTrackSelected],
                                                                      [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.minimumTrackSelected]]
                                                              rect: CGRectMake (0, 0, 10, 4)]
                              forState: UIControlStateSelected];
        }
        
        if (themeStyle.maximumTrackNormal)
        {
            [self setMaximumTrackImage: [UIImage uiImageWithColors: @[[RCUICommonThemeStyle convertIDObjectToColor: themeStyle.maximumTrackNormal],
                                                                      [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.maximumTrackNormal]]
                                                              rect: CGRectMake (0, 0, 10, 4)]
                              forState: UIControlStateNormal];
        }
        
        if (themeStyle.maximumTrackHighlighted)
        {
            [self setMaximumTrackImage: [UIImage uiImageWithColors: @[[RCUICommonThemeStyle convertIDObjectToColor: themeStyle.maximumTrackHighlighted],
                                                                      [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.maximumTrackHighlighted]]
                                                              rect: CGRectMake (0, 0, 10, 4)]
                              forState: UIControlStateHighlighted];
        }
        
        if (themeStyle.maximumTrackDisable)
        {
            [self setMaximumTrackImage: [UIImage uiImageWithColors: @[[RCUICommonThemeStyle convertIDObjectToColor: themeStyle.maximumTrackDisable],
                                                                      [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.maximumTrackDisable]]
                                                              rect: CGRectMake (0, 0, 10, 4)]
                              forState: UIControlStateSelected];
        }
        
        if (themeStyle.maximumTrackSelected)
        {
            [self setMaximumTrackImage: [UIImage uiImageWithColors: @[[RCUICommonThemeStyle convertIDObjectToColor: themeStyle.maximumTrackSelected],
                                                                      [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.maximumTrackSelected]]
                                                              rect: CGRectMake (0, 0, 10, 4)]
                              forState: UIControlStateSelected];
        }
    }
}

@end
