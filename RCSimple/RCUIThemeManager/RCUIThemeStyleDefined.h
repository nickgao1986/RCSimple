//
//  RCUIThemeStyleDefined.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/18/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RCUICommonThemeStyle;

@interface RCUICommonThemeStyle : NSObject

/**
 * @brief control can assign the same type control's theme style
 */
@property (nonatomic, assign) RCUICommonThemeStyle *style;

+ (id) uiThemeStyleWithStyle: (RCUICommonThemeStyle *)style;

/**
 * @brief   convert object to UIColor
 * @param   object - UIColor/NSString/UIImage object
 */
+ (UIColor *) convertIDObjectToColor: (id)object;

/**
 * @brief   convert object to UIImage
 * @param   object - UIColor/NSString/UIImage object
 */
+ (UIImage *) convertIDObjectToImage: (id)object;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIViewThemeStyle : RCUICommonThemeStyle

@property (nonatomic, retain) id        background;
@property (nonatomic, retain) UIColor   *tintColor;
@property (nonatomic, retain) NSNumber  *alpha;

@property (nonatomic, retain) UIColor   *borderColor;
@property (nonatomic, retain) NSNumber  *borderWidth;
@property (nonatomic, retain) NSNumber  *cornerRadius;

@property (nonatomic, retain) UIColor   *shadowColor;
@property (nonatomic, retain) NSValue   *shadowOffset;
@property (nonatomic, retain) NSNumber  *shadowOpacity;
@property (nonatomic, retain) NSNumber  *shadowRadius;

+ (id) viewThemeStyleWithBackground: (id)background;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUINavigationBarThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIFont    *font;
@property (nonatomic, retain) UIColor   *textColor;
@property (nonatomic, retain) UIColor   *barTintColor;
@property (nonatomic, retain) id        backIndicatorNormal;
@property (nonatomic, retain) id        backIndicatorHighlighted;

+ (id) navigationBarThemeStyleWithBackgroundColor: (UIColor *)backgroundColor
                                             font: (UIFont *)font
                                        textColor: (UIColor *)textColor
                                     barTintColor: (UIColor *)barTintColor
                                      shadowColor: (UIColor *)shadowColor;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIToolBarThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIColor   *barTintColor;

+ (id) toolBarThemeStyleWithBackground: (id)background borderColor: (UIColor *)borderColor;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIBarButtonItemThemeStyle : RCUICommonThemeStyle

@property (nonatomic, retain) id        backgroundNormal;
@property (nonatomic, retain) id        backgroundHighlighted;
@property (nonatomic, retain) id        backgroundDisable;
@property (nonatomic, retain) id        backgroundSelected;

@property (nonatomic, retain) UIColor   *titleColorNormal;
@property (nonatomic, retain) UIColor   *titleColorHighlighted;
@property (nonatomic, retain) UIColor   *titleColorDisable;
@property (nonatomic, retain) UIColor   *titleColorSelected;

@property (nonatomic, retain) id        backIndicatorNormal;
@property (nonatomic, retain) id        backIndicatorHighlighted;

+ (id) barButtonItemThemeStyleWithTitleColorNormal: (UIColor *)titleColorNormal
                                 titleColorDisable: (UIColor *)titleColorDisable
                                backIndicatorColor: (UIColor *)backIndicatorColor;

+ (id) barButtonItemThemeStyleWithNormalBackground: (id)backgroundNormal highlightedBackground: (id)backgroundHighlighed;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUITabBarThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIColor   *barTintColor;
@property (nonatomic, retain) UIColor   *selectedTintColor;
@property (nonatomic, retain) id        backgroundSelectionIndicator;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUITabBarItemThemeStyle : RCUICommonThemeStyle

@property (nonatomic, retain) id        imageUnselected;
@property (nonatomic, retain) id        imageSelected;
@property (nonatomic, retain) UIFont    *font;
@property (nonatomic, retain) UIColor   *textColor;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUISearchBarThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIColor   *barTintColor;
@property (nonatomic, retain) id        searchFieldBackground;
@property (nonatomic, retain) UIColor   *searchFieldBorderColor;
@property (nonatomic, retain) UIColor   *searchFieldTextColor;
@property (nonatomic, retain) UIColor   *searchFieldPlaceholderColor;
@property (nonatomic, retain) id        searchIcon;
@property (nonatomic, retain) id        clearIcon;
@property (nonatomic, retain) id        bookmarkIcon;
@property (nonatomic, retain) UIColor   *cancelTitleColorNormal;
@property (nonatomic, retain) UIColor   *cancelTitleColorHighlighted;

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

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIButtonThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIColor   *titleColorNormal;
@property (nonatomic, retain) UIColor   *titleColorHighlighted;
@property (nonatomic, retain) UIColor   *titleColorDisable;
@property (nonatomic, retain) UIColor   *titleColorSelectedDisable;
@property (nonatomic, retain) UIColor   *titleColorSelected;
@property (nonatomic, retain) UIColor   *titleColorSelectedHighlighted;

@property (nonatomic, retain) id        backgroundNormal;
@property (nonatomic, retain) id        backgroundHighlighted;
@property (nonatomic, retain) id        backgroundDisable;
@property (nonatomic, retain) id        backgroundSelectedDisable;
@property (nonatomic, retain) id        backgroundSelected;
@property (nonatomic, retain) id        backgroundSelectedHighlighted;

@property (nonatomic, retain) id        imageNormal;
@property (nonatomic, retain) id        imageHighlighted;
@property (nonatomic, retain) id        imageDisable;
@property (nonatomic, retain) id        imageSelectedDisable;
@property (nonatomic, retain) id        imageSelected;
@property (nonatomic, retain) id        imageSelectedHighlighted;

@property (nonatomic, retain) UIFont    *font;

+ (id) buttonThemeStyleWithNormalTitleColor: (UIColor *)titleColorNormal
                      highlightedTitleColor: (UIColor *)titleColorHighlighted
                          disableTitleColor: (UIColor *)titleColorDisable
                                   textFont: (UIFont *)txtFont;


+ (id) buttonThemeStyleWithNormalTitleColor: (UIColor *)titleColorNormal
                      highlightedTitleColor: (UIColor *)titleColorHighlighted
                           normalBackground: (id)backgroundNormal
                      highlightedBackground: (id)backgroundHighlighed;

+ (id) buttonThemeStyleWithNormalBackground: (id)backgroundNormal
                      highlightedBackground: (id)backgroundHighlighed
                         selectedBackground: (id)backgroundSelected
                          disableBackground: (id)backgroundDisable
                                 normalIcon: (id)iconNormal
                            highlightedIcon: (id)iconHighlighted
                               selectedIcon: (id)iconSelected
                                disableIcon: (id)iconDisable;

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

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIBadgeThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIFont    *font;
@property (nonatomic, retain) UIColor   *textColor;

+ (id) badgeThemeStyleWithTintColor: (UIColor *)tintColor textColor: (UIColor *)textColor;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUITextFieldThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIFont    *font;
@property (nonatomic, retain) UIFont    *padFont;
@property (nonatomic, retain) UIColor   *textColor;
@property (nonatomic, retain) UIColor   *placeHolderColor;
@property (nonatomic, retain) UIColor   *caretColor;
@property (nonatomic, retain) id        backgroundDisable;

+ (id) textFieldThemeStyleWithTextColor: (UIColor *)textColor placeHolderColor: (UIColor *)placeHolderColor font: (UIFont *)font;
+ (id) textFieldThemeStyleWithTextColor: (UIColor *)textColor caretColor: (UIColor *)caretColor font: (UIFont *)font padFont: (UIFont *) padFont;

@end

@interface RCUINumberTextFieldThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, retain) UIFont  *textFont;
@property (nonatomic, retain) UIColor *residueColor;
@property (nonatomic, retain) UIColor *residueHighlightedColor;
@property (nonatomic, retain) UIFont  *residueFont;

+ (id) numberTextFieldThemeStyleWithBackground: (id)background
                                   borderColor: (UIColor *)borderColor
                                   borderWidth: (CGFloat)borderWidth
                                  cornerRadius: (CGFloat)cornerRadius
                                     textColor: (UIColor *)textColor
                                      textFont: (UIFont *)textFont
                                  residueColor: (UIColor *)residueColor
                       residueHighlightedColor: (UIColor *)residueHighlightedColor
                                   residueFont: (UIFont *)residueFont;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUILabelThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIFont    *fontIPad;
@property (nonatomic, retain) UIFont    *fontIPadLandscape;
@property (nonatomic, retain) UIFont    *font;
@property (nonatomic, retain) UIColor   *textColor;
@property (nonatomic, retain) UIColor   *textColorHighlighted;

+ (id) labelThemeStyleWithTextColor: (UIColor *)textColor highlightedTextColor: (UIColor *)textColorHighlighted font: (UIFont *)font;
+ (id) labelThemeStyleWithTextColor: (UIColor *)textColor highlightedTextColor: (UIColor *)textColorHighlighted font: (UIFont *)font fontIPad: (UIFont *)fontIPad fontIPadLandscape: (UIFont *)fontIPadLandscape;
+ (id) labelThemeStyleWithTextColor: (UIColor *)textColor highlightedTextColor: (UIColor *)textColorHighlighted backgroundColor: (UIColor *)backgroundColor font: (UIFont *)font;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUITextViewThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIFont    *fontIPad;
@property (nonatomic, retain) UIFont    *fontIPadLandscape;
@property (nonatomic, retain) UIFont    *font;
@property (nonatomic, retain) UIColor   *textColor;

+ (id) textViewThemeStyleWithTextColor: (UIColor *)textColor font: (UIFont *)font;
+ (id) textViewThemeStyleWithTextColor: (UIColor *)textColor font: (UIFont *)font fontIPad: (UIFont *)fontIPad fontIPadLandscape: (UIFont *)fontIPadLandscape;
+ (id) textViewThemeStyleWithTextColor: (UIColor *)textColor backgroundColor: (UIColor *)backgroundColor font: (UIFont *)font;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUISegmentedControlThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) id        backgroundNormal;
@property (nonatomic, retain) id        backgroundHighlighted;
@property (nonatomic, retain) id        backgroundDisable;
@property (nonatomic, retain) id        backgroundSelected;
@property (nonatomic, retain) id        backgroundSelectedHighlighted;

@property (nonatomic, retain) id        dividerNormalNormal;
@property (nonatomic, retain) id        dividerNormalSelected;
@property (nonatomic, retain) id        dividerSelectedNormal;

@property (nonatomic, retain) id        titleTextAttributesNormal;
@property (nonatomic, retain) id        titleTextAttributesHighlighted;
@property (nonatomic, retain) id        titleTextAttributesDisable;
@property (nonatomic, retain) id        titleTextAttributesSelected;
@property (nonatomic, retain) id        titleTextAttributesSelectedHighlighted;
@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUISliderThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) id        backgroundMinimumValue;
@property (nonatomic, retain) id        backgroundMaximumValue;

@property (nonatomic, retain) id        thumbNormal;
@property (nonatomic, retain) id        thumbHighlighted;
@property (nonatomic, retain) id        thumbDisable;
@property (nonatomic, retain) id        thumbSelected;

@property (nonatomic, retain) id        minimumTrackNormal;
@property (nonatomic, retain) id        minimumTrackHighlighted;
@property (nonatomic, retain) id        minimumTrackDisable;
@property (nonatomic, retain) id        minimumTrackSelected;

@property (nonatomic, retain) id        maximumTrackNormal;
@property (nonatomic, retain) id        maximumTrackHighlighted;
@property (nonatomic, retain) id        maximumTrackDisable;
@property (nonatomic, retain) id        maximumTrackSelected;

+ (id) sliderThemeStyleWithNormalThumb: (id)thumbNormal
                      highlightedThumb: (id)thumbHighlighted
                    normalMinimumTrack: (id)minimumTrackNormal
                    normalMaximumTrack: (id)maximumTrackNormal;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUISwitchThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) id        backgroundOn;
@property (nonatomic, retain) id        backgroundOff;
@property (nonatomic, retain) id        backgroundThumb;
@property (nonatomic, retain) UIColor   *activeColor;
@property (nonatomic, retain) UIColor   *thumbShadowColor;

+ (id) switchThemeStyleWithBackgroundOn: (id)on
                          backgroundOff: (id)off
                            activeColor: (UIColor *)activeColor
                            borderColor: (UIColor *)borderColor;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIActivityIndicatorViewThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIColor   *backgroundColor;

+ (id) activityIndicatorWithBackgroundColor: (UIColor *)backgroundColor;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIProgressViewThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) id        backgroundProgress;
@property (nonatomic, retain) id        backgroundTrack;

+ (id) progressviewThemeStyleWithBackground: (id)background trackBackground: (id)trackBackground;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIStepperThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) id        backgroundNormal;
@property (nonatomic, retain) id        backgroundHighlighted;
@property (nonatomic, retain) id        backgroundDisable;
@property (nonatomic, retain) id        backgroundSelected;

@property (nonatomic, retain) id        dividerNormalSelected;
@property (nonatomic, retain) id        dividerSelectedNormal;

@property (nonatomic, retain) id        incrementNormal;
@property (nonatomic, retain) id        incrementHighlighted;
@property (nonatomic, retain) id        incrementDisable;
@property (nonatomic, retain) id        incrementSelected;

@property (nonatomic, retain) id        decrementNormal;
@property (nonatomic, retain) id        decrementHighlighted;
@property (nonatomic, retain) id        decrementDisable;
@property (nonatomic, retain) id        decrementSelected;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUITableViewThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIColor   *sectionIndexColor;
@property (nonatomic, retain) UIColor   *sectionIndexBackgroundColor;
@property (nonatomic, retain) UIColor   *sectionIndexTrackingBackgroundColor;
@property (nonatomic, retain) UIColor   *separatorColor;

+ (id) tableViewThemeStyleWithBackground: (id)background
                       sectionIndexColor: (UIColor *)sectionIndexColor
             sectionIndexBackgroundColor: (UIColor *)sectionIndexBackgroundColor
                          separatorColor: (UIColor *)separatorColor;


@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUITableViewCellThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) id        backgroundNormal;
@property (nonatomic, retain) id        backgroundHighlighted;
@property (nonatomic, retain) UIColor   *borderColorNormal;
@property (nonatomic, retain) UIColor   *borderColorHighlighted;

+ (id) tableViewCellThemeStyleWithNormalBackground: (id)backgroundNormal
                             highlightedBackground: (id)backgroundHighlighted;

+ (id) tableViewGroupCellThemeStyleWidthNormalBackground: (id)backgroundNormal
                                   highlightedBackground: (id)backgroundHighlighted
                                       normalBorderColor: (UIColor *)borderColorNormal
                                  highlightedBorderColor: (UIColor *)borderColorHighlighted;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIPickerViewThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIColor *labelTextColor;

+ (id) pickerViewThemeStyleWithBackground: (id)background;
+ (id) pickerViewThemeStyleWithBackground: (id)background labelColor: (UIColor *)labelColor;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIDatePickerThemeStyle : RCUIViewThemeStyle
@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIWebViewThemeStyle : RCUIViewThemeStyle

+ (id) webViewThemeStyleWithBackground: (id)background;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIPopoverBackgroundViewThemeStyle : RCUIViewThemeStyle

+ (id) popoverThemeStyleWithBackground: (id)background;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIImageViewThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) id        image;
@property (nonatomic, retain) id        imageHighlighted;
@property (nonatomic, retain) NSArray   *images;

+ (id) imageViewThemeStyleWithImage: (id)image highlightedImage: (id)imageHighlighted;
+ (id) imageViewThemeStyleWithBackground: (UIColor *)background borderColor: (UIColor *)borderColor;
+ (id) imageViewThemeStyleWithImages: (NSArray *)images;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIFilterItemThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIColor   *titleColorNormal;
@property (nonatomic, retain) UIColor   *titleColorHighlighted;

+ (id) filterItemThemeStyleWithTintColor: (UIColor *)tintColor
                        normalTitleColor: (UIColor *)titleColorNormal
                   highlightedTitleColor: (UIColor *)titleColorHighlighted;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIMenuIndicatorThemeStyle : RCUICommonThemeStyle

@property (nonatomic, retain) UIColor   *tintColor;

+ (id) menuIndicatorThemeStyleWithTintColor: (UIColor *)tintColor;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCUIPageControlThemeStyle : RCUIViewThemeStyle

@property (nonatomic, retain) UIColor   *circleIndicatorColor;
@property (nonatomic, retain) UIColor   *pageIndicatorColor;

+ (id) pageControlThemeStyleWithCircleIndicatorColor: (UIColor *)circleIndicatorColor
                                  pageIndicatorColor: (UIColor *)pageIndicatorColor;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCProgressControlThemeStyle : RCUICommonThemeStyle

@property (nonatomic, retain) UIColor   *progressColor;
@property (nonatomic, retain) UIColor   *failureColor;

+ (id) progressControlThemeStyleWithColor: (UIColor *)progressColor failureColor: (UIColor *)failureColor;

@end


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 * View Theme Style
 */
#define RCUI_VIEW_THEMESTYLE_WITH_STYLE(style)                          \
        [RCUIViewThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_VIEW_THEMESTYLE_WITH_BACKGROUND(bg)                        \
        [RCUIViewThemeStyle viewThemeStyleWithBackground: bg]

/**
 * NavigationBar Theme Style
 */
#define RCUI_NAVIGATIONBAR_THEMESTYLE_WITH_STYLE(style)                 \
        [RCUINavigationBarThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_NAVIGATIONBAR_THEMESTYLE_WITH_PARAM(bgColor, f, txtColor, tntColor, shdColor)  \
        [RCUINavigationBarThemeStyle navigationBarThemeStyleWithBackgroundColor: bgColor    \
                                                                           font: f          \
                                                                      textColor: txtColor   \
                                                                   barTintColor: tntColor   \
                                                                    shadowColor: shdColor]

/**
 * TooBar Theme Style
 */
#define RCUI_TOOLBAR_THEMESTYLE_WITH_STYLE(style)                       \
        [RCUIToolBarThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_TOOLBAR_THEMESTYLE_WITHBACKGROUND(bg, bdColor)             \
        [RCUIToolBarThemeStyle toolBarThemeStyleWithBackground: bg borderColor: bdColor]

/**
 * BarButtonItem Theme Style
 */
#define RCUI_BARBUTTONITEM_THEMESTYLE_WITH_STYLE(style)                 \
        [RCUIBarButtonItemThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_NAVIGATION_BARBUTTONITEM_THEMESTYLE_WITH_PARAM(txtColorNor, txtColorDisable, indicatorColor)           \
        [RCUIBarButtonItemThemeStyle barButtonItemThemeStyleWithTitleColorNormal: txtColorNor                       \
                                                               titleColorDisable: txtColorDisable                   \
                                                              backIndicatorColor: indicatorColor]
#define RCUI_TOOLBAR_BARBUTTONITEM_THEMESTYLE_WITH_PARAM(bgNormal, bgHighlighted)           \
        [RCUIBarButtonItemThemeStyle barButtonItemThemeStyleWithNormalBackground: bgNormal  \
                                                           highlightedBackground: bgHighlighted]

/**
 * TabBar Theme Style
 */
#define RCUI_TABBAR_THEMESTYLE_WITH_STYLE(style)                        \
        [RCUITabBarThemeStyle uiThemeStyleWithStyle: style]

/**
 * TabBarItem Theme Style
 */
#define RCUI_TABBARITEM_THEMESTYLE_WITH_STYLE(style)                    \
        [RCUITabBarItemThemeStyle uiThemeStyleWithStyle: style]

/**
 * SearchBar Theme Style
 */
#define RCUI_SEARCHBAR_THEMESTYLE_WITH_STYLE(style)                     \
        [RCUISearchBarThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_SEARCHBAR_THEMESTYLE_WITH_PARAM(bg, bdColor, tntColor, sfbg, sfbdColor, sftxtColor, sfplColor, cnTxtColor, cnHgTxtColor, schIcon)          \
        [RCUISearchBarThemeStyle searchBarThemeStyleWithBackground: bg                                      \
                                                       borderColor: bdColor                                 \
                                                         tintColor: tntColor                                \
                                             searchFieldBackground: sfbg                                    \
                                            searchFieldBorderColor: sfbdColor                               \
                                              searchFieldTextColor: sftxtColor                              \
                                       searchFieldPlaceholderColor: sfplColor                               \
											normalCancelTitleColor: cnTxtColor                              \
                                       highlightedCancelTitleColor: cnHgTxtColor                            \
                                                        searchIcon: schIcon]


/**
 * Button Theme Style
 */
#define RCUI_BUTTON_THEMESTYLE_WITH_STYLE(style)                                                        \
        [RCUIButtonThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_BUTTON_THEMESTYLE_WITH_TITLE(txtColorNormal, txtColorHighlighted, txtColorDisable, txtFont)     \
        [RCUIButtonThemeStyle buttonThemeStyleWithNormalTitleColor: txtColorNormal                           \
                                             highlightedTitleColor: txtColorHighlighted                      \
                                                 disableTitleColor: txtColorDisable                          \
                                                          textFont: txtFont]

#define RCUI_BUTTON_THEMESTYLE_WITH_PARAM(bgNormal, bgHighlighted, bgSelected, bgDiable, iconNormal, iconHighlighted, iconSelected, iconDiable)     \
        [RCUIButtonThemeStyle buttonThemeStyleWithNormalBackground: bgNormal            \
                                             highlightedBackground: bgHighlighted       \
                                                selectedBackground: bgSelected          \
                                                 disableBackground: bgDiable            \
                                                        normalIcon: iconNormal          \
                                                   highlightedIcon: iconHighlighted     \
                                                      selectedIcon: iconSelected        \
                                                       disableIcon: iconDiable]

#define RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM(titleNormal, titleHighlighted, titleSelected, titleSelectedHighlighted, titleDisable, titleSelectedDisable, bgNormal, bgHighlighted, bgSelected, bgSelectedHighlighted, bgDisable, bgSelectedDisable, iconNormal, iconHighlighted, iconSelected, iconSelectedHighlighted, iconDisable, iconSelectedDisable) \
            [RCUIButtonThemeStyle buttonThemeStyleWithNormalTitleColor: titleNormal \
                                                 highlightedTitleColor: titleHighlighted \
                                                    selectedTitleColor: titleSelected \
                                         selectedHighlightedTitleColor: titleSelectedHighlighted \
                                                     disableTitleColor: titleDisable \
                                             selectedDisableTitleColor: titleSelectedDisable \
                                                      normalBackground: bgNormal \
                                                 highlightedBackground: bgHighlighted \
                                                    selectedBackground: bgSelected \
                                         selectedHighlightedBackground: bgSelectedHighlighted \
                                                     disableBackground: bgDisable \
                                             selectedDisableBackground: bgSelectedDisable \
                                                            normalIcon: iconNormal \
                                                       highlightedIcon: iconHighlighted \
                                                          selectedIcon: iconSelected \
                                               selectedHighlightedIcon: iconSelectedHighlighted \
                                                           disableIcon: iconDisable \
                                                   selectedDisableIcon: iconSelectedDisable]

#define RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUND(bgNormal, bgHighlighted)                                                     \
        RCUI_BUTTON_THEMESTYLE_WITH_PARAM(bgNormal, bgHighlighted, nil, nil, nil, nil, nil, nil)

#define RCUI_BUTTON_THEMESTYLE_WITH_ICON(iconNormal, iconHighlighted)                                                       \
        RCUI_BUTTON_THEMESTYLE_WITH_PARAM(nil, nil, nil, nil, iconNormal, iconHighlighted, nil, nil)

#define RCUI_BUTTON_THEMESTYLE_WITH_TITLECOLOR_AND_ICON(titleColorNormal,                                                   \
                                                        titleColorHighlighted,                                              \
                                                        titleColorDisable,                                                  \
                                                        iconNormal,                                                         \
                                                        iconHighlighted,                                                    \
                                                        iconSelected,                                                       \
                                                        iconSelectedHighlighted,                                            \
                                                        iconDisable)                                                        \
                                           RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM(titleColorNormal,                         \
                                                                                  titleColorHighlighted,                    \
                                                                                  titleColorNormal,                         \
                                                                                  titleColorHighlighted,                    \
                                                                                  titleColorDisable,                        \
                                                                                  titleColorDisable,                        \
                                                                                  nil,                                      \
                                                                                  nil,                                      \
                                                                                  nil,                                      \
                                                                                  nil,                                      \
                                                                                  nil,                                      \
                                                                                  nil,                                      \
                                                                                  iconNormal,                               \
                                                                                  iconHighlighted,                          \
                                                                                  iconSelected,                             \
                                                                                  iconSelectedHighlighted,                  \
                                                                                  iconDisable,                              \
                                                                                  iconSelectedHighlighted)                  \

#define RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUNDICON(bgNormal, bgHighlighted, iconNormal, iconHighlighted)                    \
        RCUI_BUTTON_THEMESTYLE_WITH_PARAM(bgNormal, bgHighlighted, nil, nil, iconNormal, iconHighlighted, nil, nil)

#define RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUNDICONSELECTED(bgNormal, bgHighlighted, bgSelected, iconNormal, iconHighlighted, iconSelected)                      \
        RCUI_BUTTON_THEMESTYLE_WITH_PARAM(bgNormal, bgHighlighted, bgSelected, nil, iconNormal, iconHighlighted, iconSelected, nil)

#define RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUNDICONDISABLE(bgNormal, bgHighlighted, bgDiable, iconNormal, iconHighlighted, iconDiable)                           \
        RCUI_BUTTON_THEMESTYLE_WITH_PARAM(bgNormal, bgHighlighted, nil, bgDiable, iconNormal, iconHighlighted, nil, iconDiable)

#define RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND(txtColorNormal, txtColorHighlighted, bgNormal, bgHighlighted)   \
        [RCUIButtonThemeStyle buttonThemeStyleWithNormalTitleColor: txtColorNormal                                  \
                                             highlightedTitleColor: txtColorHighlighted                             \
                                                  normalBackground: bgNormal                                        \
                                             highlightedBackground: bgHighlighted]

/**
 * Badge Theme Style
 */
#define RCUI_BADGE_THEMESTYLE_WITH_STYLE(style)                         \
        [RCUIBadgeThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_BADGE_THEMESTYLE_WITH_PARAM(tntColor, txtColor)            \
        [RCUIBadgeThemeStyle badgeThemeStyleWithTintColor: tntColor textColor: txtColor]

/**
 * TextField Theme Style
 */
#define RCUI_TEXTFIELD_THEMESTYLE_WITH_STYLE(style)                     \
        [RCUITextFieldThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_TEXTFIELD_THEMESTYLE_WITH_PARAM(txtColor, phColor, f)              \
        [RCUITextFieldThemeStyle textFieldThemeStyleWithTextColor: txtColor placeHolderColor: phColor font: f]

#define RCUI_TEXTFIELD_THEMESTYLE_WITH_COLOR_FONT(txtColor, crColor, f, pf)              \
        [RCUITextFieldThemeStyle textFieldThemeStyleWithTextColor: txtColor caretColor: crColor font: f padFont: pf]

/**
 * Number TextField Theme Style
 */
#define RCUI_NUMBER_TEXTFIELD_THEMESTYLE_WITH_STYLE(style)                     \
        [RCUINumberTextFieldThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_NUMBER_TEXTFIELD_THEMESTYLE_WITH_PARAM(bg, bc, bw, cr, tc, tf, rc, rhc, rf)     \
        [RCUINumberTextFieldThemeStyle numberTextFieldThemeStyleWithBackground: bg      \
                                                                   borderColor: bc      \
                                                                   borderWidth: bw      \
                                                                  cornerRadius: cr      \
                                                                     textColor: tc      \
                                                                      textFont: tf      \
                                                                  residueColor: rc      \
                                                       residueHighlightedColor: rhc     \
                                                                   residueFont: rf]

/**
 * Label Theme Style
 */
#define RCUI_LABEL_THEMESTYLE_WITH_STYLE(style)                         \
        [RCUILabelThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_LABEL_THEMESTYLE_WITH_PARAM(txtColor, txtColorHighlighted, f)              \
        [RCUILabelThemeStyle labelThemeStyleWithTextColor: txtColor highlightedTextColor: txtColorHighlighted font: f]

#define RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_PARAM(txtColor, txtColorHighlighted, f, fIPad, fIPadLandscape)          \
        [RCUILabelThemeStyle labelThemeStyleWithTextColor: txtColor highlightedTextColor: txtColorHighlighted font: f fontIPad: fIPad fontIPadLandscape: fIPadLandscape]

#define RCUI_LABEL_THEMESTYLE_WITH_FULL_PARAM(txtColor, txtColorHighlighted, bgColor, f)    \
        [RCUILabelThemeStyle labelThemeStyleWithTextColor: txtColor highlightedTextColor: txtColorHighlighted backgroundColor: bgColor font: f]

#define RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR(txtColor, f)              \
        RCUI_LABEL_THEMESTYLE_WITH_PARAM(txtColor, nil, f)

#define RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_TEXTCOLOR(txtColor, f, fIPad, fIPadLandscape)              \
        RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_PARAM (txtColor, nil, f, fIPad, fIPadLandscape)

/**
 * TextView Theme Style
 */
#define RCUI_TEXTVIEW_THEMESTYLE_WITH_STYLE(style)                         \
        [RCUITextViewThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_TEXTVIEW_THEMESTYLE_WITH_PARAM(txtColor, f)              \
        [RCUITextViewThemeStyle textViewThemeStyleWithTextColor: txtColor font: f]

#define RCUI_TEXTVIEW_THEMESTYLE_WITH_ORIENTATION_PARAM(txtColor, f, fIPad, fIPadLandscape)          \
        [RCUITextViewThemeStyle textViewThemeStyleWithTextColor: txtColor font: f fontIPad: fIPad fontIPadLandscape: fIPadLandscape]

#define RCUI_TEXTVIEW_THEMESTYLE_WITH_FULL_PARAM(txtColor, bgColor, f)    \
        [RCUITextViewThemeStyle textViewThemeStyleWithTextColor: txtColor backgroundColor: bgColor font: f]

#define RCUI_TEXTVIEW_THEMESTYLE_WITH_TEXTCOLOR(txtColor, f)              \
        RCUI_TEXTVIEW_THEMESTYLE_WITH_PARAM(txtColor, f)

#define RCUI_TEXTVIEW_THEMESTYLE_WITH_ORIENTATION_TEXTCOLOR(txtColor, f, fIPad, fIPadLandscape)              \
        RCUI_TEXTVIEW_THEMESTYLE_WITH_ORIENTATION_PARAM (txtColor, f, fIPad, fIPadLandscape)

/**
 * SegmentedControl Theme Style
 */
#define RCUI_SEGMENTEDCONTROL_THEMESTYLE_WITH_STYLE(style)              \
        [RCUISegmentedControlThemeStyle uiThemeStyleWithStyle: style]

/**
 * Slider Theme Style
 */
#define RCUI_SLIDER_THEMESTYLE_WITH_STYLE(style)                        \
        [RCUISliderThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_SLIDER_THEMESTYLE_WITH_PARAM(thbNormal, thbHighlighted, mintNormal, maxtNormal)        \
            [RCUISliderThemeStyle sliderThemeStyleWithNormalThumb: thbNormal            \
                                                 highlightedThumb: thbHighlighted       \
                                               normalMinimumTrack: mintNormal           \
                                               normalMaximumTrack: maxtNormal]

/**
 * Switch Theme Style
 */
#define RCUI_SWITCH_THEMESTYLE_WITH_STYLE(style)                                \
        [RCUISwitchThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_SWITCH_THEMESTYLE_WITH_PARAM(onColor, offColor, aColor, bColor)    \
        [RCUISwitchThemeStyle switchThemeStyleWithBackgroundOn: onColor backgroundOff: offColor activeColor: aColor borderColor: bColor]

/**
 * ActivityIndicatorView Theme Style
 */
#define RCUI_ACTIVITYINDICATOR_THEMESTYLE_WITH_STYLE(style)             \
        [RCUIActivityIndicatorViewThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_ACTIVITYINDICATOR_THEMESTYLE_WITH_PARAM(bgColor)             \
        [RCUIActivityIndicatorViewThemeStyle activityIndicatorWithBackgroundColor: bgColor]

/**
 * ProgressView Theme Style
 */
#define RCUI_PROGRESSVIEW_THEMESTYLE_WITH_STYLE(style)                  \
        [RCUIProgressViewThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_PROGRESSVIEW_THEMESTYLE_WITH_PARAM(bg, bgTrack)            \
        [RCUIProgressViewThemeStyle progressviewThemeStyleWithBackground: bg trackBackground: bgTrack]

/**
 * Stepper Theme Style
 */
#define RCUI_STEPPER_THEMESTYLE_WITH_STYLE(style)                       \
        [RCUIStepperThemeStyle uiThemeStyleWithStyle: style]

/**
 * TableView Theme Style
 */
#define RCUI_TABLEVIEW_THEMESTYLE_WITH_STYLE(style)                     \
        [RCUITableViewThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_TABLEVIEW_THEMESTYLE_WITH_PARAM(bg, indexColor, indexBGColor, spColor)     \
        [RCUITableViewThemeStyle tableViewThemeStyleWithBackground: bg                  \
                                                 sectionIndexColor: indexColor          \
                                       sectionIndexBackgroundColor: indexBGColor        \
                                                    separatorColor: spColor]

#define RCUI_TABLEVIEW_THEMESTYLE_WITH_BACKGROUND(bg)                                   \
        RCUI_TABLEVIEW_THEMESTYLE_WITH_PARAM(bg, nil, nil, nil)

/**
 * TableViewCell Theme Style
 */
#define RCUI_TABLEVIEWCELL_THEMESTYLE_WITH_STYLE(style)                 \
        [RCUITableViewCellThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_TABLEVIEWCELL_THEMESTYLE_WITH_PARAM(bgNormal, bgHighlighted)                       \
        [RCUITableViewCellThemeStyle tableViewCellThemeStyleWithNormalBackground: bgNormal      \
                                                           highlightedBackground: bgHighlighted]

#define RCUI_TABLEVIEWCELL_THEMESTYLE_WITH_HIGHLIGHTED(bgHighlighted)                           \
        RCUI_TABLEVIEWCELL_THEMESTYLE_WITH_PARAM(nil, bgHighlighted)

#define RCUI_TABLEVIEWCELL_THEMESTYLE_WITH_GROUPPARAM(bgNormal, bgHighlighted, bdNormal, bdHighlighted)     \
        [RCUITableViewCellThemeStyle tableViewGroupCellThemeStyleWidthNormalBackground: bgNormal            \
                                                                 highlightedBackground: bgHighlighted       \
                                                                     normalBorderColor: bdNormal            \
                                                                highlightedBorderColor: bdHighlighted]

/**
 * PickerView Theme Style
 */
#define RCUI_PICKERVIEW_THEMESTYLE_WITH_STYLE(style) \
        [RCUIPickerViewThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_PICKERVIEW_THEMESTYLE_WITH_PARAMS(background, textColor) \
        [RCUIPickerViewThemeStyle pickerViewThemeStyleWithBackground: background labelColor: textColor]

/**
 * DatePicker Theme Style
 */
#define RCUI_DATEPICKER_THEMESTYLE_WITH_STYLE(style)                    \
        [RCUIDatePickerThemeStyle uiThemeStyleWithStyle: style]

/**
 * WebView Theme Style
 */
#define RCUI_WEBVIEW_THEMESTYLE_WITH_STYLE(style)                       \
        [RCUIWebViewThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_WEBVIEW_THEMESTYLE_WITH_PARAM(bg)                          \
        [RCUIWebViewThemeStyle webViewThemeStyleWithBackground: bg]

/**
 * PopoverBackgroundView Theme Style
 */
#define RCUI_POPOVERBACKGROUND_THEMESTYLE_WITH_STYLE(style)             \
        [RCUIPopoverBackgroundViewThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_POPOVERBACKGROUND_THEMESTYLE_WITH_PARAM(bg)                \
        [RCUIPopoverBackgroundViewThemeStyle popoverThemeStyleWithBackground: bg]

/**
 * ImageView Theme Style
 */
#define RCUI_IMAGEVIEW_THEMESTYLE_WITH_STYLE(style)                     \
        [RCUIImageViewThemeStyle uiThemeStyleWithStyle: style]

#define RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM(img, img_highligted)       \
        [RCUIImageViewThemeStyle imageViewThemeStyleWithImage: img highlightedImage: img_highligted]

#define RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE(img)                       \
        RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM(img, nil)

#define RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND(bgColor, bdColor)     \
        [RCUIImageViewThemeStyle imageViewThemeStyleWithBackground: bgColor borderColor: bdColor]

#define RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGES(imgs)                     \
        [RCUIImageViewThemeStyle imageViewThemeStyleWithImages: imgs]

/**
 * FilterItem Theme Style
 */
#define RCUI_FILTERITEM_THEMESTYLE_WITH_PARAM(tntColor, txtColorNormal, txtColorHighlighted)    \
        [RCUIFilterItemThemeStyle filterItemThemeStyleWithTintColor: tntColor                   \
                                                   normalTitleColor: txtColorNormal             \
                                              highlightedTitleColor: txtColorHighlighted]

/**
 * Menu Indicator Theme Style
 */
#define RCUI_MENUINDICATOR_THEMESTYLE_WITH_PARAM(tntColor)               \
        [RCUIMenuIndicatorThemeStyle menuIndicatorThemeStyleWithTintColor: tntColor]

/**
 * PageControl Theme Style
 */
#define RCUI_PAGECONTROL_THEMESTYLE_WITH_PARAM(circleColor, pageColor)      \
        [RCUIPageControlThemeStyle pageControlThemeStyleWithCircleIndicatorColor: circleColor   \
                                                              pageIndicatorColor: pageColor]

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////


