//
//  UISearchBar+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UISearchBar+RCUIThemeStyle.h"
#import "UIImage+RCUIPathCategory.h"
#import "RCUIGlobalCommon.h"
#import "RCUIGlobalStyle.h"
//#import <RCResourceKit/RCResourceManager.h>
#import <QuartzCore/QuartzCore.h>

@implementation UISearchBar (RCUIThemeStyle)

+ (id) uiSearchBarWithThemeStyle: (RCUISearchBarThemeStyle *)themeStyle;
{
    UISearchBar *searchBar = [[[UISearchBar alloc] init] autorelease];
    [searchBar uiApplyThemeStyle: themeStyle];
    return searchBar;
}

- (void) uiApplyThemeStyle: (RCUISearchBarThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUISearchBarThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUISearchBarThemeStyle *)(themeStyle.style)];
    }
    else
    {
        if (themeStyle.barTintColor)
        {
            if ([self respondsToSelector: @selector (barTintColor)])
            {
                self.barTintColor = themeStyle.barTintColor;
            }
            else
            {
                self.tintColor = themeStyle.barTintColor;
            }
        }
        
        if (themeStyle.searchIcon)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.searchIcon]
          forSearchBarIcon: UISearchBarIconSearch state: UIControlStateNormal];
        }
        
        if (themeStyle.clearIcon)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.clearIcon]
          forSearchBarIcon: UISearchBarIconClear state: UIControlStateNormal];
        }
        
        if (themeStyle.bookmarkIcon)
        {
            [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.bookmarkIcon]
          forSearchBarIcon: UISearchBarIconBookmark state: UIControlStateNormal];
        }
        
        if (themeStyle.background)
        {
            [self setBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.background]];
        }
        
        if (themeStyle.searchFieldBackground)
        {
            [self setSearchFieldBackgroundImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.searchFieldBackground]
                                       forState: UIControlStateNormal];
        }
    }
}

- (void) uiApplyiOS7ThemeStyle: (RCUISearchBarThemeStyle *)themeStyle;
{
    NSArray *subviews = RCUIIsIOSSDKVersionAbove7 () ? [[[self subviews] objectAtIndex: 0] subviews] : [self subviews];
    
    if (themeStyle.searchIcon)
    {
        [self setImage: [RCUICommonThemeStyle convertIDObjectToImage: themeStyle.searchIcon] forSearchBarIcon: UISearchBarIconSearch state:UIControlStateNormal];
    }
    
    if (RCUIIsIOSSDKVersionAbove7 ())
    {
        self.searchTextPositionAdjustment = UIOffsetMake (8, 0);
    }
    
    for (UIView *v in subviews)
    {
        if ([NSStringFromClass([v class]) isEqualToString: @"UISearchBarBackground"])
        {
            UIImageView *searchBarBackgroundView = [[[UIImageView alloc] initWithImage: [UIImage uiImageWithBannerColor: themeStyle.background
                                                                                                              lineColor: themeStyle.borderColor
                                                                                                               lineEdge: UIEdgeInsetsMake (0, 0, .5, 0)]] autorelease];
            
            searchBarBackgroundView.frame = CGRectMake (v.superview.bounds.origin.x, v.superview.bounds.origin.y, v.superview.bounds.size.width, v.superview.bounds.size.height);
            searchBarBackgroundView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
            [v addSubview: searchBarBackgroundView];
        }
        
        if ([v isKindOfClass: [UITextField class]])
        {
            UITextField *textField = (UITextField *)v;
            [textField setBorderStyle: UITextBorderStyleNone];
            [textField setTextColor: themeStyle.searchFieldTextColor];
            [textField setFont: RCUIRegularSystemFont(15)];
//            [textField setAttributedPlaceholder: [[[NSAttributedString alloc] initWithString: RCLocalizedString (@"Search", ) attributes: @{ NSForegroundColorAttributeName : themeStyle.searchFieldPlaceholderColor, NSFontAttributeName : RCUIRegularSystemFont(15) }] autorelease]];
            [textField setBackground: [UIImage uiImageWithBezierType: RCUIBezierTypeAll fillColor: themeStyle.searchFieldBackground borderColor: themeStyle.searchFieldBorderColor radius: 5.f]];
        }
    }
}

- (void) uiApplyiOS7CancelThemeStyle: (RCUISearchBarThemeStyle *)themeStyle;
{
    NSArray *subviews = RCUIIsIOSSDKVersionAbove7 () ? [[[self subviews] objectAtIndex: 0] subviews] : [self subviews];
    
    for (UIView *v in subviews)
    {
        if ([v isKindOfClass: [UIButton class]])
        {
            UIButton *cancelButton = (UIButton *)v;
            [cancelButton.titleLabel setFont: RCUIRegularSystemFont(17)];
//            [cancelButton setTitle: RCLocalizedString (@"Cancel ", ) forState: UIControlStateNormal];
//            [cancelButton setTitle: RCLocalizedString (@"Cancel ", ) forState: UIControlStateHighlighted];
            
            NSShadow *shadow = [[[NSShadow alloc] init] autorelease];
            [shadow setShadowColor: [UIColor clearColor]];
            [shadow setShadowOffset: CGSizeZero];
            [shadow setShadowBlurRadius: 0.f];
            
            NSAttributedString *text = [[[NSAttributedString alloc] initWithString: [cancelButton titleForState: UIControlStateNormal]
																		attributes: @{NSForegroundColorAttributeName: themeStyle.cancelTitleColorNormal,
                                                                                      NSShadowAttributeName: shadow}] autorelease];
			[cancelButton setAttributedTitle: text forState: UIControlStateNormal];
            
            if (!RCUIIsIOSSDKVersionAbove7 ())
            {
                NSAttributedString *highlightedText = [[[NSAttributedString alloc] initWithString: [cancelButton titleForState: UIControlStateHighlighted]
                                                                                       attributes: @{NSForegroundColorAttributeName: themeStyle.cancelTitleColorHighlighted,
                                                                                                     NSShadowAttributeName: shadow}] autorelease];
                [cancelButton setAttributedTitle: highlightedText forState: UIControlStateHighlighted];
            }
            
            [cancelButton setBackgroundImage: [UIImage uiImageWithColor: [UIColor clearColor]]
                                    forState: UIControlStateNormal];
            [cancelButton setBackgroundImage: [UIImage uiImageWithColor: [UIColor clearColor]]
                                    forState: UIControlStateHighlighted];
        }
    }
}

@end

