//
//  RCUIThemeStyleDefined.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/18/14.
//
//

#import "RCUIThemeStyleDefined.h"
#import "UIImage+RCUIPathCategory.h"
//#import <RCResourceKit/RCResourceManager.h>

@implementation RCUICommonThemeStyle

+ (id) uiThemeStyleWithStyle: (RCUICommonThemeStyle *)style;
{
    RCUICommonThemeStyle *themeStyle = [[[self alloc] init] autorelease];
    themeStyle.style = style;
    return themeStyle;
}

+ (UIColor *) convertIDObjectToColor: (id)object;
{
    if ([object isKindOfClass: [NSString class]])
    {
        return [UIColor colorWithPatternImage: [UIImage imageNamed: (NSString *)object]];
    }
    else if ([object isKindOfClass: [UIImage class]])
    {
        return [UIColor colorWithPatternImage: (UIImage *)object];
    }
    else if ([object isKindOfClass: [UIColor class]])
    {
        return (UIColor *)object;
    }
    
    return nil;
}

+ (UIImage *) convertIDObjectToImage: (id)object;
{
//    if ([object isKindOfClass: [NSString class]])
//    {
//        NSBundle *bundle = [[RCResourceManager currentResourceManager] userBundle];
//        NSString *path   = [bundle pathForResource: (NSString *)object ofType: @"png"];
//        UIImage  *image  = [UIImage imageWithContentsOfFile: path];
//        if (image == nil)
//        {
//            image = [UIImage imageNamed: (NSString *)object];
//        }
//        return image;
//    }
//    else if ([object isKindOfClass: [UIColor class]])
//    {
//        return [UIImage uiImageWithColor: (UIColor *)object];
//    }
//    else if ([object isKindOfClass: [UIImage class]])
//    {
//        return (UIImage *)object;
//    }
    
    return nil;
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIViewThemeStyle

+ (id) viewThemeStyleWithBackground: (id)background;
{
    RCUIViewThemeStyle *themeStyle = [[[RCUIViewThemeStyle alloc] init] autorelease];
    themeStyle.background = background;
    return themeStyle;
}

- (void) dealloc;
{
    self.background     = nil;
    self.tintColor      = nil;
    self.alpha          = nil;
    
    self.borderColor    = nil;
    self.borderWidth    = nil;
    self.cornerRadius   = nil;
    
    self.shadowColor    = nil;
    self.shadowOffset   = nil;
    self.shadowOpacity  = nil;
    self.shadowRadius   = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUINavigationBarThemeStyle

+ (id) navigationBarThemeStyleWithBackgroundColor: (UIColor *)backgroundColor
                                             font: (UIFont *)font
                                        textColor: (UIColor *)textColor
                                     barTintColor: (UIColor *)barTintColor
                                      shadowColor: (UIColor *)shadowColor;
{
    RCUINavigationBarThemeStyle *themeStyle = [[[RCUINavigationBarThemeStyle alloc] init] autorelease];
    themeStyle.background                   = backgroundColor;
    themeStyle.font                         = font;
    themeStyle.textColor                    = textColor;
    themeStyle.barTintColor                 = barTintColor;
    themeStyle.backIndicatorNormal          = barTintColor;
    themeStyle.backIndicatorHighlighted     = [barTintColor colorWithAlphaComponent: 0.4];
    themeStyle.shadowColor                  = shadowColor;
    return themeStyle;
}

- (void) dealloc;
{
    self.font                       = nil;
    self.textColor                  = nil;
    self.barTintColor               = nil;
    self.backIndicatorNormal        = nil;
    self.backIndicatorHighlighted   = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIToolBarThemeStyle

+ (id) toolBarThemeStyleWithBackground: (id)background borderColor: (UIColor *)borderColor;
{
    RCUIToolBarThemeStyle *themeStyle = [[[RCUIToolBarThemeStyle alloc] init] autorelease];
    themeStyle.background = background;
    themeStyle.borderColor = borderColor;
    return themeStyle;
}

- (void) dealloc;
{
    self.barTintColor   = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIBarButtonItemThemeStyle

+ (id) barButtonItemThemeStyleWithTitleColorNormal: (UIColor *)titleColorNormal
                                 titleColorDisable: (UIColor *)titleColorDisable
                                backIndicatorColor: (UIColor *)backIndicatorColor;
{
    RCUIBarButtonItemThemeStyle *themeStyle = [[[RCUIBarButtonItemThemeStyle alloc] init] autorelease];
    themeStyle.titleColorNormal         = titleColorNormal;
    themeStyle.titleColorHighlighted    = [titleColorNormal colorWithAlphaComponent: 0.4];
    themeStyle.titleColorDisable        = titleColorDisable;
    themeStyle.backIndicatorNormal      = backIndicatorColor;
    themeStyle.backIndicatorHighlighted = [backIndicatorColor colorWithAlphaComponent: 0.4];
    return themeStyle;
}

+ (id) barButtonItemThemeStyleWithNormalBackground: (id)backgroundNormal highlightedBackground: (id)backgroundHighlighed;
{
    RCUIBarButtonItemThemeStyle *themeStyle = [[[RCUIBarButtonItemThemeStyle alloc] init] autorelease];
    themeStyle.backgroundNormal = backgroundNormal;
    themeStyle.backgroundHighlighted = backgroundHighlighed;
    return themeStyle;
}

- (void) dealloc;
{
    self.backgroundNormal           = nil;
    self.backgroundHighlighted      = nil;
    self.backgroundDisable          = nil;
    self.backgroundSelected         = nil;
    self.titleColorNormal           = nil;
    self.titleColorHighlighted      = nil;
    self.titleColorDisable          = nil;
    self.titleColorSelected         = nil;
    self.backIndicatorNormal        = nil;
    self.backIndicatorHighlighted   = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUITabBarThemeStyle

- (void) dealloc;
{
    self.barTintColor                   = nil;
    self.selectedTintColor              = nil;
    self.backgroundSelectionIndicator   = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUITabBarItemThemeStyle

- (void) dealloc;
{
    self.imageUnselected        = nil;
    self.imageSelected          = nil;
    self.font                   = nil;
    self.textColor              = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUISearchBarThemeStyle

+ (id) searchBarThemeStyleWithBackground: (id)background
                             borderColor: (UIColor *)borderColor
                               tintColor: (UIColor *)tintColor
                   searchFieldBackground: (id)searchFieldBackground
                  searchFieldBorderColor: (UIColor *)searchFieldBorderColor
                    searchFieldTextColor: (UIColor *)searchFieldTextColor
             searchFieldPlaceholderColor: (UIColor *)searchFieldPlaceholderColor
				  normalCancelTitleColor: (UIColor *)cancelTitleColorNormal
             highlightedCancelTitleColor: (UIColor *)cancelTitleColorHighlighted
                              searchIcon: (id)searchIcon;
{
    RCUISearchBarThemeStyle *themeStyle = [[[RCUISearchBarThemeStyle alloc] init] autorelease];
    themeStyle.background               = background;
    themeStyle.borderColor              = borderColor;
    themeStyle.barTintColor             = tintColor;
    themeStyle.searchFieldBackground    = searchFieldBackground;
    themeStyle.searchFieldBorderColor   = searchFieldBorderColor;
    themeStyle.searchFieldTextColor     = searchFieldTextColor;
    themeStyle.searchFieldPlaceholderColor = searchFieldPlaceholderColor;
	themeStyle.cancelTitleColorNormal   = cancelTitleColorNormal;
	themeStyle.cancelTitleColorHighlighted = cancelTitleColorHighlighted;
    themeStyle.searchIcon               = searchIcon;
    return themeStyle;
}

- (void) dealloc;
{
    self.barTintColor                   = nil;
    self.searchFieldBackground          = nil;
    self.searchFieldBorderColor         = nil;
    self.searchFieldTextColor           = nil;
    self.searchFieldPlaceholderColor    = nil;
    self.searchIcon                     = nil;
    self.clearIcon                      = nil;
    self.bookmarkIcon                   = nil;
	self.cancelTitleColorNormal         = nil;
	self.cancelTitleColorHighlighted    = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIButtonThemeStyle

+ (id) buttonThemeStyleWithNormalTitleColor: (UIColor *)titleColorNormal
                      highlightedTitleColor: (UIColor *)titleColorHighlighted
                          disableTitleColor: (UIColor *)titleColorDisable
                                   textFont: (UIFont *)txtFont;
{
    RCUIButtonThemeStyle *themeStyle = [[[RCUIButtonThemeStyle alloc] init] autorelease];
    themeStyle.titleColorNormal         = titleColorNormal;
    themeStyle.titleColorHighlighted    = titleColorHighlighted;
    themeStyle.titleColorDisable        = titleColorDisable;
    themeStyle.font                     = txtFont;
    return themeStyle;
}

+ (id) buttonThemeStyleWithNormalTitleColor: (UIColor *)titleColorNormal
                      highlightedTitleColor: (UIColor *)titleColorHighlighted
                           normalBackground: (id)backgroundNormal
                      highlightedBackground: (id)backgroundHighlighed;
{
    RCUIButtonThemeStyle *themeStyle = [[[RCUIButtonThemeStyle alloc] init] autorelease];
    themeStyle.titleColorNormal         = titleColorNormal;
    themeStyle.titleColorHighlighted    = titleColorHighlighted;
    themeStyle.backgroundNormal         = backgroundNormal;
    themeStyle.backgroundHighlighted    = backgroundHighlighed;
    return themeStyle;
}

+ (id) buttonThemeStyleWithNormalBackground: (id)backgroundNormal
                      highlightedBackground: (id)backgroundHighlighed
                         selectedBackground: (id)backgroundSelected
                          disableBackground: (id)backgroundDisable
                                 normalIcon: (id)iconNormal
                            highlightedIcon: (id)iconHighlighted
                               selectedIcon: (id)iconSelected
                                disableIcon: (id)iconDisable;
{
    RCUIButtonThemeStyle *themeStyle = [[[RCUIButtonThemeStyle alloc] init] autorelease];
    themeStyle.backgroundNormal         = backgroundNormal;
    themeStyle.backgroundHighlighted    = backgroundHighlighed;
    themeStyle.backgroundSelected       = backgroundSelected;
    themeStyle.backgroundDisable        = backgroundDisable;
    themeStyle.imageNormal              = iconNormal;
    themeStyle.imageHighlighted         = iconHighlighted;
    themeStyle.imageSelected            = iconSelected;
    themeStyle.imageDisable             = iconDisable;
    
    return themeStyle;
}

+ (id) buttonThemeStyleWithNormalTitleColor: (UIColor *)titleColorNormal
                      highlightedTitleColor: (UIColor *)titleColorHighlighted
                         selectedTitleColor: (UIColor *)titleColorSelected
              selectedHighlightedTitleColor: (UIColor *)titleColorSelectedHighlighted
                          disableTitleColor: (UIColor *)titleColorDisable
                  selectedDisableTitleColor: (UIColor *)titleColorSelectedDisable
                           normalBackground: (id)backgroundNormal
                      highlightedBackground: (id)backgroundHighlighed
                         selectedBackground: (id)backgroundSelected
              selectedHighlightedBackground: (id)backgroundSelectedHighlightd
                          disableBackground: (id)backgroundDisable
                  selectedDisableBackground: (id)backgroundSelectedDisable
                                 normalIcon: (id)iconNormal
                            highlightedIcon: (id)iconHighlighted
                               selectedIcon: (id)iconSelected
                    selectedHighlightedIcon: (id)iconSelectedHighlighted
                                disableIcon: (id)iconDisable
                        selectedDisableIcon: (id)iconSelectedDisable;
{
    RCUIButtonThemeStyle *themeStyle = [[[RCUIButtonThemeStyle alloc] init] autorelease];
    themeStyle.titleColorNormal                 = titleColorNormal;
    themeStyle.titleColorHighlighted            = titleColorHighlighted;
    themeStyle.titleColorSelected               = titleColorSelected;
    themeStyle.titleColorSelectedHighlighted    = titleColorSelectedHighlighted;
    themeStyle.titleColorDisable                = titleColorDisable;
    themeStyle.titleColorSelectedDisable        = titleColorSelectedDisable;
    themeStyle.backgroundNormal                 = backgroundNormal;
    themeStyle.backgroundHighlighted            = backgroundHighlighed;
    themeStyle.backgroundSelected               = backgroundSelected;
    themeStyle.backgroundSelectedHighlighted    = backgroundSelectedHighlightd;
    themeStyle.backgroundDisable                = backgroundDisable;
    themeStyle.backgroundSelectedDisable        = backgroundSelectedDisable;
    themeStyle.imageNormal                      = iconNormal;
    themeStyle.imageHighlighted                 = iconHighlighted;
    themeStyle.imageSelected                    = iconSelected;
    themeStyle.imageSelectedHighlighted         = iconSelectedHighlighted;
    themeStyle.imageDisable                     = iconDisable;
    themeStyle.imageSelectedDisable             = iconSelectedDisable;
    
    return themeStyle;
}

- (void) dealloc;
{
    self.titleColorNormal               = nil;
    self.titleColorHighlighted          = nil;
    self.titleColorDisable              = nil;
    self.titleColorSelected             = nil;
    self.titleColorSelectedDisable      = nil;
    self.titleColorSelectedHighlighted  = nil;
    self.backgroundNormal               = nil;
    self.backgroundHighlighted          = nil;
    self.backgroundDisable              = nil;
    self.backgroundSelected             = nil;
    self.backgroundSelectedDisable      = nil;
    self.backgroundSelectedHighlighted  = nil;
    self.imageNormal                    = nil;
    self.imageHighlighted               = nil;
    self.imageDisable                   = nil;
    self.imageSelected                  = nil;
    self.imageSelectedDisable           = nil;
    self.imageSelectedHighlighted       = nil;
    self.font                           = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIBadgeThemeStyle

+ (id) badgeThemeStyleWithTintColor: (UIColor *)tintColor textColor: (UIColor *)textColor;
{
    RCUIBadgeThemeStyle *themeStyle = [[[RCUIBadgeThemeStyle alloc] init] autorelease];
    themeStyle.tintColor = tintColor;
    themeStyle.textColor = textColor;
    return themeStyle;
}

- (void) dealloc;
{
    self.font       = nil;
    self.textColor  = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUITextFieldThemeStyle

+ (id) textFieldThemeStyleWithTextColor: (UIColor *)textColor placeHolderColor: (UIColor *)placeHolderColor font: (UIFont *)font;
{
    RCUITextFieldThemeStyle *themeStyle = [[[RCUITextFieldThemeStyle alloc] init] autorelease];
    themeStyle.font               		= font;
    themeStyle.textColor            	= textColor;
    themeStyle.placeHolderColor         = placeHolderColor;
    return themeStyle;
}

+ (id) textFieldThemeStyleWithTextColor: (UIColor *)textColor caretColor: (UIColor *)caretColor font: (UIFont *)font padFont: (UIFont *) padFont
{
    RCUITextFieldThemeStyle *themeStyle = [[[RCUITextFieldThemeStyle alloc] init] autorelease];
    themeStyle.font               		= font;
    themeStyle.padFont               	= padFont;
    themeStyle.textColor            	= textColor;
    themeStyle.caretColor               = caretColor;
    return themeStyle;
}

- (void) dealloc;
{
    self.font               = nil;
    self.textColor          = nil;
    self.placeHolderColor   = nil;
    self.backgroundDisable  = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUINumberTextFieldThemeStyle

+ (id) numberTextFieldThemeStyleWithBackground: (id)background
                                   borderColor: (UIColor *)borderColor
                                   borderWidth: (CGFloat)borderWidth
                                  cornerRadius: (CGFloat)cornerRadius
                                     textColor: (UIColor *)textColor
                                      textFont: (UIFont *)textFont
                                  residueColor: (UIColor *)residueColor
                       residueHighlightedColor: (UIColor *)residueHighlightedColor
                                   residueFont: (UIFont *)residueFont;
{
    RCUINumberTextFieldThemeStyle *themeStyle = [[[RCUINumberTextFieldThemeStyle alloc] init] autorelease];
    themeStyle.background   = background;
    themeStyle.borderColor  = borderColor;
    themeStyle.borderWidth  = [NSNumber numberWithDouble: borderWidth];
    themeStyle.cornerRadius = [NSNumber numberWithDouble: cornerRadius];
    themeStyle.textColor    = textColor;
    themeStyle.textFont     = textFont;
    themeStyle.residueColor = residueColor;
    themeStyle.residueHighlightedColor = residueHighlightedColor;
    themeStyle.residueFont  = residueFont;
    return themeStyle;
}

- (void) dealloc;
{
    self.textColor    = nil;
    self.textFont     = nil;
    self.residueColor = nil;
    self.residueFont  = nil;
    [super dealloc];
}

@end
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUILabelThemeStyle

+ (id) labelThemeStyleWithTextColor: (UIColor *)textColor highlightedTextColor: (UIColor *)textColorHighlighted font: (UIFont *)font;
{
    RCUILabelThemeStyle *themeStyle = [[[RCUILabelThemeStyle alloc] init] autorelease];
    themeStyle.font                 = font;
    themeStyle.textColor            = textColor;
    themeStyle.textColorHighlighted = textColorHighlighted;
    return themeStyle;
}

+ (id) labelThemeStyleWithTextColor: (UIColor *)textColor highlightedTextColor: (UIColor *)textColorHighlighted font: (UIFont *)font fontIPad: (UIFont *)fontIPad fontIPadLandscape: (UIFont *)fontIPadLandscape;
{
    RCUILabelThemeStyle *themeStyle = [[[RCUILabelThemeStyle alloc] init] autorelease];
    themeStyle.font                 = font;
    themeStyle.fontIPad             = fontIPad;
    themeStyle.fontIPadLandscape    = fontIPadLandscape;
    themeStyle.textColor            = textColor;
    themeStyle.textColorHighlighted = textColorHighlighted;
    return themeStyle;
}

+ (id) labelThemeStyleWithTextColor: (UIColor *)textColor highlightedTextColor: (UIColor *)textColorHighlighted backgroundColor: (UIColor *)backgroundColor font: (UIFont *)font;
{
    RCUILabelThemeStyle *themeStyle = [[[RCUILabelThemeStyle alloc] init] autorelease];
    themeStyle.font                 = font;
    themeStyle.textColor            = textColor;
    themeStyle.textColorHighlighted = textColorHighlighted;
    themeStyle.background           = backgroundColor;
    
    return themeStyle;
}

- (void) dealloc;
{
    self.font                   = nil;
    self.textColor              = nil;
    self.textColorHighlighted   = nil;
    self.fontIPad               = nil;
    self.fontIPadLandscape      = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUITextViewThemeStyle

+ (id) textViewThemeStyleWithTextColor: (UIColor *)textColor font: (UIFont *)font;
{
    RCUITextViewThemeStyle *themeStyle = [[[RCUITextViewThemeStyle alloc] init] autorelease];
    themeStyle.font                 = font;
    themeStyle.textColor            = textColor;
    return themeStyle;
}

+ (id) textViewThemeStyleWithTextColor: (UIColor *)textColor font: (UIFont *)font fontIPad: (UIFont *)fontIPad fontIPadLandscape: (UIFont *)fontIPadLandscape;
{
    RCUITextViewThemeStyle *themeStyle = [[[RCUITextViewThemeStyle alloc] init] autorelease];
    themeStyle.font                 = font;
    themeStyle.fontIPad             = fontIPad;
    themeStyle.fontIPadLandscape    = fontIPadLandscape;
    themeStyle.textColor            = textColor;
    return themeStyle;
}

+ (id) textViewThemeStyleWithTextColor: (UIColor *)textColor backgroundColor: (UIColor *)backgroundColor font: (UIFont *)font;
{
    RCUITextViewThemeStyle *themeStyle = [[[RCUITextViewThemeStyle alloc] init] autorelease];
    themeStyle.font                 = font;
    themeStyle.textColor            = textColor;
    themeStyle.background           = backgroundColor;
    
    return themeStyle;
}

- (void) dealloc;
{
    self.font                   = nil;
    self.textColor              = nil;
    self.fontIPad               = nil;
    self.fontIPadLandscape      = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUISegmentedControlThemeStyle

- (void) dealloc;
{
    self.backgroundNormal                       = nil;
    self.backgroundHighlighted                  = nil;
    self.backgroundDisable                      = nil;
    self.backgroundSelected                     = nil;
    self.backgroundSelectedHighlighted          = nil;
    self.dividerNormalNormal                    = nil;
    self.dividerNormalSelected                  = nil;
    self.dividerSelectedNormal                  = nil;
    self.titleTextAttributesNormal              = nil;
    self.titleTextAttributesHighlighted         = nil;
    self.titleTextAttributesDisable             = nil;
    self.titleTextAttributesSelected            = nil;
    self.titleTextAttributesSelectedHighlighted = nil;
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUISliderThemeStyle

+ (id) sliderThemeStyleWithNormalThumb: (id)thumbNormal
                      highlightedThumb: (id)thumbHighlighted
                    normalMinimumTrack: (id)minimumTrackNormal
                    normalMaximumTrack: (id)maximumTrackNormal;
{
    RCUISliderThemeStyle *themeStyle = [[[RCUISliderThemeStyle alloc] init] autorelease];
    themeStyle.thumbNormal = thumbNormal;
    themeStyle.thumbHighlighted = thumbHighlighted;
    themeStyle.minimumTrackNormal = minimumTrackNormal;
    themeStyle.maximumTrackNormal = maximumTrackNormal;
    return themeStyle;
}

- (void) dealloc;
{
    self.backgroundMinimumValue     = nil;
    self.backgroundMaximumValue     = nil;
    self.thumbNormal                = nil;
    self.thumbHighlighted           = nil;
    self.thumbDisable               = nil;
    self.thumbSelected              = nil;
    self.minimumTrackNormal         = nil;
    self.minimumTrackHighlighted    = nil;
    self.minimumTrackDisable        = nil;
    self.minimumTrackSelected       = nil;
    self.maximumTrackNormal         = nil;
    self.maximumTrackHighlighted    = nil;
    self.maximumTrackDisable        = nil;
    self.maximumTrackSelected       = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUISwitchThemeStyle

+ (id) switchThemeStyleWithBackgroundOn: (id)on
                          backgroundOff: (id)off
                            activeColor: (UIColor *)activeColor
                            borderColor: (UIColor *)borderColor;
{
    RCUISwitchThemeStyle *themeStyle = [[[RCUISwitchThemeStyle alloc] init] autorelease];
    themeStyle.backgroundOn = on;
    themeStyle.backgroundOff = off;
    themeStyle.activeColor = activeColor;
    themeStyle.borderColor = borderColor;
    return themeStyle;
}

- (void) dealloc;
{
    self.backgroundOn       = nil;
    self.backgroundOff      = nil;
    self.backgroundThumb    = nil;
    self.activeColor        = nil;
    self.thumbShadowColor   = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIActivityIndicatorViewThemeStyle

+ (id) activityIndicatorWithBackgroundColor: (UIColor *)backgroundColor;
{
    RCUIActivityIndicatorViewThemeStyle *themeStyle = [[[RCUIActivityIndicatorViewThemeStyle alloc] init] autorelease];
    themeStyle.backgroundColor = backgroundColor;
    return themeStyle;
}

- (void) dealloc;
{
    self.backgroundColor    = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIProgressViewThemeStyle

+ (id) progressviewThemeStyleWithBackground: (id)background trackBackground: (id)trackBackground;
{
    RCUIProgressViewThemeStyle *themeStyle = [[[RCUIProgressViewThemeStyle alloc] init] autorelease];
    themeStyle.backgroundProgress   = background;
    themeStyle.backgroundTrack      = trackBackground;
    return themeStyle;
}

- (void) dealloc;
{
    self.backgroundProgress = nil;
    self.backgroundTrack    = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIStepperThemeStyle

- (void) dealloc;
{
    self.backgroundNormal       = nil;
    self.backgroundHighlighted  = nil;
    self.backgroundDisable      = nil;
    self.backgroundSelected     = nil;
    self.dividerNormalSelected  = nil;
    self.dividerSelectedNormal  = nil;
    self.incrementNormal        = nil;
    self.incrementHighlighted   = nil;
    self.incrementDisable       = nil;
    self.incrementSelected      = nil;
    self.decrementNormal        = nil;
    self.decrementHighlighted   = nil;
    self.decrementDisable       = nil;
    self.decrementSelected      = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUITableViewThemeStyle

+ (id) tableViewThemeStyleWithBackground: (id)background
                       sectionIndexColor: (UIColor *)sectionIndexColor
             sectionIndexBackgroundColor: (UIColor *)sectionIndexBackgroundColor
                          separatorColor: (UIColor *)separatorColor;
{
    RCUITableViewThemeStyle *themeStyle = [[[RCUITableViewThemeStyle alloc] init] autorelease];
    themeStyle.background               = background;
    themeStyle.sectionIndexColor        = sectionIndexColor;
    themeStyle.sectionIndexBackgroundColor  = sectionIndexBackgroundColor;
    themeStyle.separatorColor           = separatorColor;
    return themeStyle;
}

- (void) dealloc;
{
    self.sectionIndexColor                      = nil;
    self.sectionIndexBackgroundColor            = nil;
    self.sectionIndexTrackingBackgroundColor    = nil;
    self.separatorColor                         = nil;
    
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUITableViewCellThemeStyle

+ (id) tableViewCellThemeStyleWithNormalBackground: (id)backgroundNormal
                             highlightedBackground: (id)backgroundHighlighted;
{
    RCUITableViewCellThemeStyle *themeStyle = [[[RCUITableViewCellThemeStyle alloc] init] autorelease];
    themeStyle.backgroundNormal         = backgroundNormal;
    themeStyle.backgroundHighlighted    = backgroundHighlighted;
    return themeStyle;
}

+ (id) tableViewGroupCellThemeStyleWidthNormalBackground: (id)backgroundNormal
                                   highlightedBackground: (id)backgroundHighlighted
                                       normalBorderColor: (UIColor *)borderColorNormal
                                  highlightedBorderColor: (UIColor *)borderColorHighlighted;
{
    RCUITableViewCellThemeStyle *themeStyle = [[[RCUITableViewCellThemeStyle alloc] init] autorelease];
    themeStyle.backgroundNormal         = backgroundNormal;
    themeStyle.backgroundHighlighted    = backgroundHighlighted;
    themeStyle.borderColorNormal        = borderColorNormal;
    themeStyle.borderColorHighlighted   = borderColorHighlighted;
    return themeStyle;
}

- (void) dealloc;
{
    self.backgroundNormal       = nil;
    self.backgroundHighlighted  = nil;
    self.borderColorNormal      = nil;
    self.borderColorHighlighted = nil;
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIPickerViewThemeStyle

+ (id) pickerViewThemeStyleWithBackground: (id)background;
{
    RCUIPickerViewThemeStyle *themeStyle = [[[RCUIPickerViewThemeStyle alloc] init] autorelease];
    themeStyle.background = background;
    return themeStyle;
}

+ (id) pickerViewThemeStyleWithBackground: (id)background labelColor: (UIColor *)labelColor;
{
    RCUIPickerViewThemeStyle *themeStyle = [[[RCUIPickerViewThemeStyle alloc] init] autorelease];
    themeStyle.background = background;
    themeStyle.labelTextColor = labelColor;
    
    return themeStyle;
}

- (void) dealloc;
{
    self.labelTextColor = nil;
    [super dealloc];
}


@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIDatePickerThemeStyle
@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIWebViewThemeStyle

+ (id) webViewThemeStyleWithBackground: (id)background;
{
    RCUIWebViewThemeStyle *themeStyle = [[[RCUIWebViewThemeStyle alloc] init] autorelease];
    themeStyle.background = background;
    return themeStyle;
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIPopoverBackgroundViewThemeStyle

+ (id) popoverThemeStyleWithBackground: (id)background;
{
    RCUIPopoverBackgroundViewThemeStyle *themeStyle = [[[RCUIPopoverBackgroundViewThemeStyle alloc] init] autorelease];
    themeStyle.background = background;
    return themeStyle;
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIImageViewThemeStyle

+ (id) imageViewThemeStyleWithImage: (id)image highlightedImage: (id)imageHighlighted;
{
    RCUIImageViewThemeStyle *themeStyle = [[[RCUIImageViewThemeStyle alloc] init] autorelease];
    themeStyle.image                = image;
    themeStyle.imageHighlighted     = imageHighlighted;
    return themeStyle;
}

+ (id) imageViewThemeStyleWithBackground: (UIColor *)background borderColor: (UIColor *)borderColor;
{
    RCUIImageViewThemeStyle *themeStyle = [[[RCUIImageViewThemeStyle alloc] init] autorelease];
    themeStyle.background           = background;
    themeStyle.borderColor          = borderColor;
    return themeStyle;
}

+ (id) imageViewThemeStyleWithImages: (NSArray *)images;
{
    RCUIImageViewThemeStyle *themeStyle = [[[RCUIImageViewThemeStyle alloc] init] autorelease];
    themeStyle.images = images;
    return themeStyle;
}

- (void) dealloc;
{
    self.image              = nil;
    self.images             = nil;
    self.imageHighlighted   = nil;
    
    [super dealloc];
}

@end


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIFilterItemThemeStyle

+ (id) filterItemThemeStyleWithTintColor: (UIColor *)tintColor
                        normalTitleColor: (UIColor *)titleColorNormal
                   highlightedTitleColor: (UIColor *)titleColorHighlighted;
{
    RCUIFilterItemThemeStyle *themeStyle = [[[RCUIFilterItemThemeStyle alloc] init] autorelease];
    themeStyle.tintColor                = tintColor;
    themeStyle.titleColorNormal         = titleColorNormal;
    themeStyle.titleColorHighlighted    = titleColorHighlighted;
    return themeStyle;
}

- (void) dealloc;
{
    self.titleColorNormal       = nil;
    self.titleColorHighlighted  = nil;
    
    [super dealloc];
}

@end


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIMenuIndicatorThemeStyle

+ (id) menuIndicatorThemeStyleWithTintColor: (UIColor *)tintColor;
{
    RCUIMenuIndicatorThemeStyle *themeStyle = [[[RCUIMenuIndicatorThemeStyle alloc] init] autorelease];
    themeStyle.tintColor = tintColor;
    return themeStyle;
}

- (void) dealloc;
{
    self.tintColor = nil;
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCUIPageControlThemeStyle

+ (id) pageControlThemeStyleWithCircleIndicatorColor: (UIColor *)circleIndicatorColor
                                  pageIndicatorColor: (UIColor *)pageIndicatorColor;
{
    RCUIPageControlThemeStyle *themeStyle = [[[RCUIPageControlThemeStyle alloc] init] autorelease];
    themeStyle.circleIndicatorColor = circleIndicatorColor;
    themeStyle.pageIndicatorColor   = pageIndicatorColor;
    return themeStyle;
}

- (void) dealloc;
{
    self.circleIndicatorColor = nil;
    self.pageIndicatorColor   = nil;
    [super dealloc];
}

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation RCProgressControlThemeStyle

+ (id) progressControlThemeStyleWithColor: (UIColor *)progressColor failureColor: (UIColor *)failureColor
{
    RCProgressControlThemeStyle *themeStyle = [[[RCProgressControlThemeStyle alloc] init] autorelease];
    themeStyle.progressColor = progressColor;
    themeStyle.failureColor = failureColor;
    return themeStyle;
}

- (void) dealloc
{
    self.progressColor = nil;
    self.failureColor   = nil;
    [super dealloc];
}

@end










