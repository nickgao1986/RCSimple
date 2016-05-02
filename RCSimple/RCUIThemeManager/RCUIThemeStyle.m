//
//  RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/25/14.
//
//

#import "RCUIThemeStyle.h"
#import "RCUIThemeStyleHeader.h"
#import "UIImage+RCUIPathCategory.h"
#import "UIImage+RCUIStretchable.h"
#import "UIImage+RCUIMergeCategory.h"

#pragma mark - Standard colors constants

#define kStandardColor1     (self.colorTable[@"1"])
#define kStandardColor3     (self.colorTable[@"3"])
#define kStandardColor3a    (self.colorTable[@"3a"])
#define kStandardColor1a    (self.colorTable[@"1a"])
#define kStandardColor4     (self.colorTable[@"4"])
#define kStandardColor4a    (self.colorTable[@"4a"])
#define kStandardColor6     (self.colorTable[@"6"])
#define kStandardColor7     (self.colorTable[@"7"])
#define kStandardColor7b    (self.colorTable[@"7b"])
#define kStandardColor7d    (self.colorTable[@"7d"])
#define kStandardColor10    (self.colorTable[@"10"])


#pragma mark -

@interface RCUIThemeStyle ()

@property (nonatomic, retain) NSDictionary *colorTable;
@property (nonatomic, retain) NSDictionary *fontTable;

@end

@implementation RCUIThemeStyle

- (id) init;
{
    self = [super init];
    
    if (self)
    {
        self.colorTable             = [self generateColorTable];
        self.fontTable              = [self generateFontTable];
        self.themeStyleDictionary   = [NSMutableDictionary dictionary];
        [self configureThemeStyleDictionary];
    }
    
    return self;
}

- (NSDictionary *) generateColorTable;
{
    return nil;
}

- (NSDictionary *) generateFontTable;
{
    return nil;
}

- (void) configureThemeStyleDictionary;
{
//    [self configureThemeStyleNavigationBar];
//    [self configureThemeStylenNavigationBarButtonItem];
//    [self configureThemeStyleSearchBar];
//    [self configureThemeStyleLaunchBar];
//    [self configureThemeStyleEditBar];
//    [self configureThemeStyleFilterBar];
//    [self configureThemeStyleMenuIndicator];
//    [self configureThemeStyleBadge];
//    [self configureThemeStyleOffline];
//    [self configureThemeStyleVoIPUnavailable];
//    [self configureThemeStyleVoIPOnly];
//    [self configureThemeStyleDND];
    [self configureThemeStyleButton];
    [self configureThemeStyleMeeting];
//    [self configureThemeStyleView];
//    [self configureThemeStyleSlider];
//    [self configureThemeStyleProgressView];
//    [self configureThemeStyleLabel];
//    [self configureThemeStyleImageView];
//    [self configureThemeStyleSwitch];
//    
    [self configureThemeStyleTableView];
    [self configureThemeStyleTableViewCell];
//    [self configureThemeStyleRefreshView];
//    [self configureThemeStyleMeeting];
//    [self configureThemeStyleConference];
//    [self configureThemeStyleToastMessage];
//    [self configureThemeStyleAssetsPicker];
//    [self configureThemeStyleRingoutMode];
//    [self configureThemeStyleSettingsCallerID];
//    [self configureThemeStylePopover];
//    [self configureThemeStylePresence];
//    [self configureThemeStyleVoiceMail];
//    [self configureThemeStylePickerView];
//    [self configureThemeStyleToolBar];
//    [self configureThemeStyleTextField];
//    [self configureThemeStyleEmbeddedBrowser];
//    [self configureThemeStyleSMS];
//    [self configureThemeStyleLogin];
//    [self configureThemeStyleCloudDownload];
//    [self configureThemeStyleGroupMessagingTip];
//    [self configureThemeStyleIntroduction];
//    [self configureThemeStyleLegalDocs];
//    [self configureThemeStyleLoading];
//    [self configureThemeStyleReports];
//    [self configureThemeStyleDataMigration];
//    [self configureThemeStyleInAppNotification];
//    [self configureThemeStyleMyProfile];
//    [self configureThemeStyleMyProfileMoodMessage];
//    [self configureThemeStyleMyProfilePresence];
//    [self configureThemeStyleDropdown];
//    [self configureThemestyleDialingPlan];
//    [self configureThemeStyleSegmentedControl];
//    [self configureThemeStyleCloudContactEditView];
//    [self configureThemeStylePersonalContactAccessView];
//    [self configureThemeStyleCalendarView];
//    
//    [self configureThemeStyleForBrand];
}

- (RCUINavigationBarThemeStyle *) navigationBarThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUINavigationBarThemeStyle class]])
    {
        return (RCUINavigationBarThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIToolBarThemeStyle *) toolBarThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIToolBarThemeStyle class]])
    {
        return (RCUIToolBarThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIBarButtonItemThemeStyle *) barButtonItemThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIBarButtonItemThemeStyle class]])
    {
        return (RCUIBarButtonItemThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUITabBarThemeStyle *) tabBarThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUITabBarThemeStyle class]])
    {
        return (RCUITabBarThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUITabBarItemThemeStyle *) tabBarItemThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUITabBarItemThemeStyle class]])
    {
        return (RCUITabBarItemThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUISearchBarThemeStyle *) searchBarThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUISearchBarThemeStyle class]])
    {
        return (RCUISearchBarThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIViewThemeStyle *) viewThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIViewThemeStyle class]])
    {
        return (RCUIViewThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIButtonThemeStyle *) buttonThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    
    if ([themeStyle isKindOfClass: [RCUIButtonThemeStyle class]])
    {
        return (RCUIButtonThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIBadgeThemeStyle *) badgeThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIBadgeThemeStyle class]])
    {
        return (RCUIBadgeThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUITextFieldThemeStyle *) textFieldThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUITextFieldThemeStyle class]])
    {
        return (RCUITextFieldThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUINumberTextFieldThemeStyle *) numberTextFieldThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUINumberTextFieldThemeStyle class]])
    {
        return (RCUINumberTextFieldThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUILabelThemeStyle *) labelThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUILabelThemeStyle class]])
    {
        return (RCUILabelThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUITextViewThemeStyle *) textViewThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUITextViewThemeStyle class]])
    {
        return (RCUITextViewThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUISegmentedControlThemeStyle *) segmentedControlThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUISegmentedControlThemeStyle class]])
    {
        return (RCUISegmentedControlThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUISliderThemeStyle *) sliderThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUISliderThemeStyle class]])
    {
        return (RCUISliderThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUISwitchThemeStyle *) switchThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUISwitchThemeStyle class]])
    {
        return (RCUISwitchThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIActivityIndicatorViewThemeStyle *) activityIndicatorViewThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIActivityIndicatorViewThemeStyle class]])
    {
        return (RCUIActivityIndicatorViewThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIProgressViewThemeStyle *) progressViewThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIProgressViewThemeStyle class]])
    {
        return (RCUIProgressViewThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIStepperThemeStyle *) stepperThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIStepperThemeStyle class]])
    {
        return (RCUIStepperThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUITableViewThemeStyle *) tableViewThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUITableViewThemeStyle class]])
    {
        return (RCUITableViewThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUITableViewCellThemeStyle *) tableViewCellThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUITableViewCellThemeStyle class]])
    {
        return (RCUITableViewCellThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIPickerViewThemeStyle *) pickerViewThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIPickerViewThemeStyle class]])
    {
        return (RCUIPickerViewThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIDatePickerThemeStyle *) datePickerThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIDatePickerThemeStyle class]])
    {
        return (RCUIDatePickerThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIWebViewThemeStyle *) webViewThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIWebViewThemeStyle class]])
    {
        return (RCUIWebViewThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIPopoverBackgroundViewThemeStyle *) popoverBackgroundViewThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIPopoverBackgroundViewThemeStyle class]])
    {
        return (RCUIPopoverBackgroundViewThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIImageViewThemeStyle *) imageViewThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIImageViewThemeStyle class]])
    {
        return (RCUIImageViewThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIFilterItemThemeStyle *) filterItemThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIFilterItemThemeStyle class]])
    {
        return (RCUIFilterItemThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIMenuIndicatorThemeStyle *) menuIndicatorThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIMenuIndicatorThemeStyle class]])
    {
        return (RCUIMenuIndicatorThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCUIPageControlThemeStyle *) pageControlThemeWithStyleName: (NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey: name];
    
    if ([themeStyle isKindOfClass: [RCUIPageControlThemeStyle class]])
    {
        return (RCUIPageControlThemeStyle *)themeStyle;
    }
    
    return nil;
}

- (RCProgressControlThemeStyle *)progressControlThemeWithStyleName:(NSString *)name;
{
    id themeStyle = [self.themeStyleDictionary objectForKey:name];
    
    if ([themeStyle isKindOfClass: [RCProgressControlThemeStyle class]])
    {
        return (RCProgressControlThemeStyle *)themeStyle;
    }
    
    return nil;
}


////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) configureThemeStyleNavigationBar;
{
//    self.themeStyleDictionary[RCCommonNavigationBarDefault] = RCUI_NAVIGATIONBAR_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"],
//                                                                                                        RCUIMediumSystemFont((RCUIIsIPHONE5 () || RCUIIsIPHONE4 ()) ? 15.f : 17.f),
//                                                                                                        self.colorTable[@"6"],
//                                                                                                        self.colorTable[@"6"],
//                                                                                                        self.colorTable[@"10"]);
//    
//    self.themeStyleDictionary[RCCommonNavigationBarSecondary] = RCUI_NAVIGATIONBAR_THEMESTYLE_WITH_PARAM (self.colorTable[@"6"],
//                                                                                                          RCUIMediumSystemFont((RCUIIsIPHONE5 () || RCUIIsIPHONE4 ()) ? 15.f : 17.f),
//                                                                                                          self.colorTable[@"7"],
//                                                                                                          self.colorTable[@"7"],
//                                                                                                          self.colorTable[@"7b"]);
}

- (void) configureThemeStylenNavigationBarButtonItem;
{
//    self.themeStyleDictionary[RCCommonNavigationBarItemDefault] = RCUI_NAVIGATION_BARBUTTONITEM_THEMESTYLE_WITH_PARAM (self.colorTable[@"6"], self.colorTable[@"6a"], self.colorTable[@"6"]);
//    self.themeStyleDictionary[RCCommonNavigationBarItemSecondary] = RCUI_NAVIGATION_BARBUTTONITEM_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"6a"], self.colorTable[@"7"]);
//    self.themeStyleDictionary[RCNavigationBarItemMenu] = RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"6"], self.colorTable[@"6a"]);
//    self.themeStyleDictionary[RCNavigationBarItemReload] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowReloadIconWithSize: 21 color: self.colorTable[@"6"]],
//                                                                                             [RCUIAppAwesomeIcons hollowReloadIconWithSize: 21 color: self.colorTable[@"6a"]]);
//    self.themeStyleDictionary[RCNavigationBarItemAddContact] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowAddContactIconWithSize: 28 color: self.colorTable[@"6"]],
//                                                                                                 [RCUIAppAwesomeIcons hollowAddContactIconWithSize: 28 color: self.colorTable[@"6a"]]);
//    self.themeStyleDictionary[RCNavigationBarItemBackDefault] = RCUI_BUTTON_THEMESTYLE_WITH_ICON (self.colorTable[@"6"], self.colorTable[@"6a"]);
//    self.themeStyleDictionary[RCNavigationBarItemBackSecondary] = RCUI_BUTTON_THEMESTYLE_WITH_ICON (self.colorTable[@"7"], self.colorTable[@"7a"]);
//    self.themeStyleDictionary[RCNavigationBarItemPopup] = RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUNDICONSELECTED (nil, nil, nil,
//                                                                                                              [RCUIAppAwesomeIcons moreBoldIconWithSize: 16 color: self.colorTable[@"6"]],
//                                                                                                              [RCUIAppAwesomeIcons moreBoldIconWithSize: 16 color: self.colorTable[@"6a"]],
//                                                                                                              [RCUIAppAwesomeIcons moreBoldIconWithSize: 16 color: self.colorTable[@"6a"]]);
//    
//    self.themeStyleDictionary[RCNavigationBarItemEdit] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowEditIconWithSize: 20 color: self.colorTable[@"6"]],
//                                                                                           [RCUIAppAwesomeIcons hollowEditIconWithSize: 20 color: self.colorTable[@"6a"]]);
//    
//    self.themeStyleDictionary[RCNavigationBarItemEditContact] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons contactEditIconWithSize: 19 color: self.colorTable[@"6"]],
//                                                                                             [RCUIAppAwesomeIcons contactEditIconWithSize: 19 color: self.colorTable[@"6a"]]);
//    
//    self.themeStyleDictionary[RCNavigationBarItemImport] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons contactImportIconWithSize: 27 color: self.colorTable[@"6"]],
//                                                                                           [RCUIAppAwesomeIcons contactImportIconWithSize: 27 color: self.colorTable[@"6a"]]);
//    
//    self.themeStyleDictionary[RCNavigationBarItemPlus] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons plusBoldIconWithSize: 18 color: self.colorTable[@"6"]],
//                                                                                           [RCUIAppAwesomeIcons plusBoldIconWithSize: 18 color: self.colorTable[@"6a"]]);
//    self.themeStyleDictionary[RCNavigationBarItemFilter] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowFilterIconWithSize: 19 color: self.colorTable[@"6"]],
//                                                                                             [RCUIAppAwesomeIcons hollowFilterIconWithSize: 19 color: self.colorTable[@"6a"]]);
//    self.themeStyleDictionary[RCNavigationBarItemEmpty] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowEmptyBoldIconWithSize: 21 color: self.colorTable[@"6"]],
//                                                                                            [RCUIAppAwesomeIcons hollowEmptyBoldIconWithSize: 21 color: self.colorTable[@"6a"]]);
//    self.themeStyleDictionary[RCNavigationBarItemPhone] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowPhoneBoldIconWithSize: 20 color: self.colorTable[@"6"]],
//                                                                                            [RCUIAppAwesomeIcons hollowPhoneBoldIconWithSize: 20 color: self.colorTable[@"6a"]]);
//    self.themeStyleDictionary[RCNavigationBarItemForward] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowForwardIconWithSize: 25 color: self.colorTable[@"6"]],
//                                                                                              [RCUIAppAwesomeIcons hollowForwardIconWithSize: 25 color: self.colorTable[@"6a"]]);
//    self.themeStyleDictionary[RCNavigationBarItemFaxout] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowFaxoutBoldIconWithSize: 24 color: self.colorTable[@"6"]],
//                                                                                             [RCUIAppAwesomeIcons hollowFaxoutBoldIconWithSize: 24 color: self.colorTable[@"6a"]]);
//    self.themeStyleDictionary[RCNavigationBarItemMark] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons markIconWithSize: 20 color: self.colorTable[@"6"]],
//                                                                                           [RCUIAppAwesomeIcons markIconWithSize: 20 color: self.colorTable[@"6a"]]);
//    self.themeStyleDictionary[RCNavigationBarItemUnMark] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowMarkIconWithSize: 20 color: self.colorTable[@"6"]],
//                                                                                             [RCUIAppAwesomeIcons hollowMarkIconWithSize: 20 color: self.colorTable[@"6a"]]);
//    
//    self.themeStyleDictionary[RCNavigationBarItemUnMute] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowMuteIconWithSize:20 color: self.colorTable[@"6"]],
//                                                                                           [RCUIAppAwesomeIcons hollowMuteIconWithSize: 20 color: self.colorTable[@"6a"]]);
//    
//    self.themeStyleDictionary[RCNavigationBarItemLockedUnMute] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowLockedMuteIconWithSize:20 color: self.colorTable[@"6"]],
//                                                                                           [RCUIAppAwesomeIcons hollowLockedMuteIconWithSize: 20 color: self.colorTable[@"6a"]]);
//    
//    self.themeStyleDictionary[RCNavigationBarItemMute] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowUnMuteIconWithSize:20 color: self.colorTable[@"6"]],
//                                                                                             [RCUIAppAwesomeIcons hollowUnMuteIconWithSize: 20 color: self.colorTable[@"6a"]]);
//    
//    self.themeStyleDictionary[RCNavigationBarItemCopy] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowCopyIconWithSize:20 color:self.colorTable[@"6"]],
//                                                                                           [RCUIAppAwesomeIcons hollowCopyIconWithSize: 20 color: self.colorTable[@"6a"]]);
    
}

- (void) configureThemeStyleSearchBar;
{
//    self.themeStyleDictionary[RCCommonSearchBarDefault] = RCUI_SEARCHBAR_THEMESTYLE_WITH_PARAM (self.colorTable[@"7e"],
//                                                                                                self.colorTable[@"7b"],
//                                                                                                self.colorTable[@"1"],
//                                                                                                self.colorTable[@"6"],
//                                                                                                self.colorTable[@"6"],
//                                                                                                self.colorTable[@"7"],
//                                                                                                self.colorTable[@"7b"],
//																								self.colorTable[@"1"],
//																								self.colorTable[@"1a"],
//                                                                                                [RCUIAppAwesomeIcons hollowSearchIconWithSize: 12 color: self.colorTable[@"7b"]]);
}

- (void) configureThemeStyleLaunchBar;
{
//    self.themeStyleDictionary[RCLaunchBarImageViewBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"1"], self.colorTable[@"1"]);
//    
//    self.themeStyleDictionary[RCLaunchBarButtonTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"1"], RCUIRegularSystemFont(11));
//    
//    self.themeStyleDictionary[RCLaunchBarButtonKeypad] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowKeypadIconWithSize: 19 color: self.colorTable[@"7"]],
//                                                                                               [RCUIAppAwesomeIcons keypadIconWithSize: 19 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCLaunchBarButtonUnifiedbox] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowMessageIconWithSize: 23 color: self.colorTable[@"7"]],
//                                                                                                   [RCUIAppAwesomeIcons messageIconWithSize: 23 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCLaunchBarButtonCalllog] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowCalllogIconWithSize: 23 color: self.colorTable[@"7"]],
//                                                                                                [RCUIAppAwesomeIcons calllogIconWithSize: 23 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCLaunchBarButtonContacts] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowContactsIconWithSize: 23 color: self.colorTable[@"7"]],
//                                                                                                 [RCUIAppAwesomeIcons contactsIconWithSize: 23 color: self.colorTable[@"1"]]);
//
//    self.themeStyleDictionary[RCLaunchBarButtonConference] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowConferenceCircleWithRadius: 21 size: 23 color: self.colorTable[@"7"]],
//                                                                                                   [RCUIAppAwesomeIcons conferenceCircleWithRadius: 21 size: 23 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCLaunchBarButtonMeeting] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowMeetingCircleWithRadius: 21 size: 26 color: self.colorTable[@"7"]],
//                                                                                                [RCUIAppAwesomeIcons meetingCircleWithRadius: 21 size: 26 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCLaunchBarButtonGlip] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowGlipCircleWithRadius: 21 size: 19 color: self.colorTable[@"7"]],
//                                                                                                [RCUIAppAwesomeIcons glipCircleWithRadius: 21 size: 19 color: self.colorTable[@"1"]]);
//    
//    self.themeStyleDictionary[RCLaunchBarButtonDocuments] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowDocumentsCircleWithRadius: 21 size: 22 color: self.colorTable[@"7"]],
//                                                                                                  [RCUIAppAwesomeIcons documentsCircleWithRadius: 21 size: 22 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCLaunchBarButtonText] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowTextCircleWithRadius: 21 size: 21 color: self.colorTable[@"7"]],
//                                                                                             [RCUIAppAwesomeIcons textCircleWithRadius: 21 size: 21 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCLaunchBarButtonTextWithOutCircle] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowTextIconWithSize: 23 color: self.colorTable[@"7"]],
//                                                                                                               [RCUIAppAwesomeIcons hollowTextIconWithSize: 23 color: self.colorTable[@"1"]]);
//    
//    self.themeStyleDictionary[RCLaunchBarButtonFavorites] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowFavoritesCircleWithRadius: 21 size: 22 color: self.colorTable[@"7"]],
//                                                                                                  [RCUIAppAwesomeIcons favoritesCircleWithRadius: 21 size: 22 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCLaunchBarButtonFavoritesWithOutCircle] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowFavoritesIconWithSize: 23 color: self.colorTable[@"7"]],
//                                                                                                               [RCUIAppAwesomeIcons hollowFavoritesIconWithSize: 23 color: self.colorTable[@"1"]]);
//    
//    self.themeStyleDictionary[RCLaunchBarButtonFax] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowFaxCircleWithRadius: 21 size: 25 color: self.colorTable[@"7"]],
//                                                                                            [RCUIAppAwesomeIcons faxCircleWithRadius: 21 size: 25 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCLaunchBarButtonFaxWithOutCircle] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowFaxIconWithSize: 23 color: self.colorTable[@"7"]],
//                                                                                                               [RCUIAppAwesomeIcons hollowFaxIconWithSize: 23 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCLaunchBarButtonCalendar] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowCalendarCircleWithRadius: 21 size: 22 color: self.colorTable[@"7"]],
//                                                                                                 [RCUIAppAwesomeIcons calendarCircleWithRadius: 21 size: 22 color: self.colorTable[@"1"]]);
}

- (void) configureThemeStyleEditBar;
{
//    self.themeStyleDictionary[RCEditBarImageViewBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"7e"], self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCEditBarButtonDelete] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"3"], self.colorTable[@"3a"], self.colorTable[@"7d"], nil);
//    self.themeStyleDictionary[RCEditBarButtonForward] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"7"], self.colorTable[@"7a"], self.colorTable[@"7d"], nil);
//    self.themeStyleDictionary[RCEditBarImageViewArrow] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"]);
}

- (void) configureThemeStyleButton;
{
    self.themeStyleDictionary[RCToViewButtonAddContact] = RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUNDICON (nil, nil, self.colorTable[@"1"], self.colorTable[@"1a"]);
    
    self.themeStyleDictionary[RCUserDetailCellButtonPhone] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowPhoneIconWithSize: 24 color: self.colorTable[@"1"]],
                                                                                               [RCUIAppAwesomeIcons hollowPhoneIconWithSize: 24 color: self.colorTable[@"1a"]]);
    self.themeStyleDictionary[RCUserDetailCellButtonText] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowTextIconWithSize: 22 color: self.colorTable[@"1"]],
                                                                                              [RCUIAppAwesomeIcons hollowTextIconWithSize: 22 color: self.colorTable[@"1a"]]);
    
    /*
     * To View
     */
    self.themeStyleDictionary[RCToViewButtonContact] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"1"],
                                                                                               self.colorTable[@"1"],
                                                                                               self.colorTable[@"6"],
                                                                                               nil, nil, nil,
                                                                                               self.colorTable[@"6"],
                                                                                               self.colorTable[@"6"],
                                                                                               self.colorTable[@"1"],
                                                                                               nil, nil, nil,
                                                                                               nil, nil, nil, nil, nil, nil);
    
    self.themeStyleDictionary[RCToViewImageviewMoreDetail] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"]);
    
    self.themeStyleDictionary[RCToViewButtonInvalideContact] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"3"],
                                                                                                       self.colorTable[@"3"],
                                                                                                       self.colorTable[@"6"],
                                                                                                       nil, nil, nil,
                                                                                                       self.colorTable[@"6"],
                                                                                                       self.colorTable[@"6"],
                                                                                                       self.colorTable[@"3"],
                                                                                                       nil, nil, nil,
                                                                                                       nil, nil, nil, nil, nil, nil);
    
    /*
     * New Fax
     */
    self.themeStyleDictionary[RCNewFaxButtonEdit] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowPenIconWithSize: 20 color: self.colorTable[@"1"]],
                                                                                      [RCUIAppAwesomeIcons hollowPenIconWithSize: 20 color: self.colorTable[@"1a"]]);
    self.themeStyleDictionary[RCNewFaxButtonAddDocument] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons pinIconWithSize: 24 color: self.colorTable[@"1"]],
                                                                                             [RCUIAppAwesomeIcons pinIconWithSize: 24 color: self.colorTable[@"1a"]]);
    self.themeStyleDictionary[RCNewFaxButtonDone] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"],
                                                                                                 self.colorTable[@"1"],
                                                                                                 self.colorTable[@"1"],
                                                                                                 self.colorTable[@"1a"]);
    
    /*
     * Conference
     */
    self.themeStyleDictionary[RCConferenceButtonDefaultDialInNumberSelection] = RCUI_BUTTON_THEMESTYLE_WITH_ICON (self.colorTable[@"7b"], self.colorTable[@"7c"]);
    
    
    /*
     * Common tableViewCell accessory button
     */
    self.themeStyleDictionary[RCTableViewCellButtonAccessory] = RCUI_BUTTON_THEMESTYLE_WITH_ICON (self.colorTable[@"7b"], self.colorTable[@"7c"]);
    self.themeStyleDictionary[RCTableViewCellButtonInformation] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowInformationCircleIconWithSize: 22 color: self.colorTable[@"7b"]],
                                                                                                    [RCUIAppAwesomeIcons hollowInformationCircleIconWithSize: 22 color: self.colorTable[@"7c"]]);
    
    self.themeStyleDictionary[RCTableViewCellButtonMute] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowUnMuteIconWithSize: 22 color: self.colorTable[@"1"]],
                                                                                             [RCUIAppAwesomeIcons hollowUnMuteIconWithSize: 22 color: self.colorTable[@"1a"]]);
    
    self.themeStyleDictionary[RCTableViewCellButtonMuteDisabled] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowUnMuteIconWithSize: 22 color: self.colorTable[@"7b"]],
                                                                                             [RCUIAppAwesomeIcons hollowUnMuteIconWithSize: 22 color: self.colorTable[@"7d"]]);
    

    self.themeStyleDictionary[RCTableViewCellButtonUnmute] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowMuteIconWithSize: 22 color: self.colorTable[@"3"]],
                                                                                               [RCUIAppAwesomeIcons hollowMuteIconWithSize: 22 color: self.colorTable[@"3a"]]);

    self.themeStyleDictionary[RCTableViewCellButtonUnmute] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowMuteIconWithSize: 22 color: self.colorTable[@"7b"]],
                                                                                               [RCUIAppAwesomeIcons hollowMuteIconWithSize: 22 color: self.colorTable[@"7d"]]);
    

    /*
     * Voicemail
     */
    self.themeStyleDictionary[RCVoiceMailButtonPrev] = RCUI_BUTTON_THEMESTYLE_WITH_ICON (self.colorTable[@"7b"], self.colorTable[@"7c"]);
    
    self.themeStyleDictionary[RCVoiceMailButtonNext] = RCUI_BUTTON_THEMESTYLE_WITH_ICON (self.colorTable[@"7b"], self.colorTable[@"7c"]);
    
    CGFloat playSizeLarge = (RCUIIsIPAD () ? 70.0f : 60.0f);
    self.themeStyleDictionary[RCVoiceMailButtonPlayLarge] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowPlayCircleIconWithSize: playSizeLarge - 1 color: self.colorTable[@"1"]],
                                                                                              [RCUIAppAwesomeIcons hollowPlayCircleIconWithSize: playSizeLarge - 1 color: self.colorTable[@"1a"]]);
    self.themeStyleDictionary[RCVoiceMailButtonPauseLarge] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowStopCircleIconWithSize: playSizeLarge - 1 color: self.colorTable[@"1"]],
                                                                                               [RCUIAppAwesomeIcons hollowStopCircleIconWithSize: playSizeLarge - 1 color: self.colorTable[@"1a"]]);
    self.themeStyleDictionary[RCVoiceMailButtonLoadingLarge] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowLoadingCircleIconWithSize: playSizeLarge - 1 color: self.colorTable[@"1"]],
                                                                                                 [RCUIAppAwesomeIcons hollowLoadingCircleIconWithSize: playSizeLarge - 1 color: self.colorTable[@"1a"]]);
    self.themeStyleDictionary[RCVoiceMailImageViewSpinLoadingNormal] = RCUI_ACTIVITYINDICATOR_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"]);
    self.themeStyleDictionary[RCVoiceMailButtonDownloadLarge] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowDownloadCircleIconWithSize: playSizeLarge - 1 color: self.colorTable[@"1"]],
                                                                                                  [RCUIAppAwesomeIcons hollowDownloadCircleIconWithSize: playSizeLarge - 1 color: self.colorTable[@"1a"]]);

    CGFloat playSizeSmall = RCUIIsIPAD () ? 58.0f : 40.0f;
    self.themeStyleDictionary[RCVoiceMailButtonPlaySmall] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowPlayCircleIconWithSize: playSizeSmall - 1 color: self.colorTable[@"1"]],
                                                                                              [RCUIAppAwesomeIcons hollowPlayCircleIconWithSize: playSizeSmall - 1 color: self.colorTable[@"1a"]]);
    self.themeStyleDictionary[RCVoiceMailButtonPauseSmall] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowStopCircleIconWithSize: playSizeSmall - 1 color: self.colorTable[@"1"]],
                                                                                               [RCUIAppAwesomeIcons hollowStopCircleIconWithSize: playSizeSmall - 1 color: self.colorTable[@"1a"]]);
    self.themeStyleDictionary[RCVoiceMailButtonLoadingSmall] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowLoadingCircleIconWithSize: playSizeSmall - 1 color: self.colorTable[@"1"]],
                                                                                                 [RCUIAppAwesomeIcons hollowLoadingCircleIconWithSize: playSizeSmall - 1 color: self.colorTable[@"1a"]]);
    self.themeStyleDictionary[RCVoiceMailImageViewSpinLoadingColorful] = RCUI_ACTIVITYINDICATOR_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"]);
    self.themeStyleDictionary[RCVoiceMailButtonDownloadSmall] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowDownloadCircleIconWithSize: playSizeSmall - 1 color: self.colorTable[@"1"]],
                                                                                                  [RCUIAppAwesomeIcons hollowDownloadCircleIconWithSize: playSizeSmall - 1 color: self.colorTable[@"1a"]]);

    CGFloat audioSourceSize = (RCUIIsIPAD () ? 29.0f : 23.0f);
    self.themeStyleDictionary[RCVoiceMailButtonAudioHeadset] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowAudioIconWithSize: audioSourceSize color: self.colorTable[@"7"]],
                                                                                                 [RCUIAppAwesomeIcons hollowAudioIconWithSize: audioSourceSize color: self.colorTable[@"7a"]]);
    self.themeStyleDictionary[RCVoiceMailButtonAudioSpeaker] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowSpeakerIconWithSize: audioSourceSize color: self.colorTable[@"7"]],
                                                                                                 [RCUIAppAwesomeIcons hollowSpeakerIconWithSize: audioSourceSize color: self.colorTable[@"7a"]]);
    self.themeStyleDictionary[RCVoiceMailButtonAudioBluetooth] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowBluetoothIconWithSize: audioSourceSize color: self.colorTable[@"7"]],
                                                                                                   [RCUIAppAwesomeIcons hollowBluetoothIconWithSize: audioSourceSize color: self.colorTable[@"7a"]]);

    CGFloat transcriptionReloadSize = (RCUIIsIPAD () ? 70.0f : 60.0f);
    self.themeStyleDictionary[RCVoiceMailButtonTranscriptionReload] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowDownloadCircleIconWithSize: transcriptionReloadSize color: self.colorTable[@"1"]],
                                                                                                        [RCUIAppAwesomeIcons hollowDownloadCircleIconWithSize: transcriptionReloadSize color: self.colorTable[@"1a"]]);

    
    self.themeStyleDictionary[RCVoiceMailButtonText] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"7b"],
                                                                                               self.colorTable[@"10"],
                                                                                               nil, nil,
                                                                                               self.colorTable[@"7d"], nil,
                                                                                               self.colorTable[@"6"],
                                                                                               self.colorTable[@"1a"],
                                                                                               nil, nil,
                                                                                               self.colorTable[@"6"], nil,
                                                                                               [RCUIAppAwesomeIcons hollowTextIconWithSize: 26 color: self.colorTable[@"1"]],
                                                                                               [RCUIAppAwesomeIcons hollowTextIconWithSize: 26 color: self.colorTable[@"1"]], nil, nil,
                                                                                               [RCUIAppAwesomeIcons hollowTextIconWithSize: 26 color: self.colorTable[@"7d"]], nil);
    
    self.themeStyleDictionary[RCVoiceMailButtonDelete] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"7b"],
                                                                                                 self.colorTable[@"10"],
                                                                                                 nil, nil,
                                                                                                 self.colorTable[@"7d"], nil,
                                                                                                 self.colorTable[@"6"],
                                                                                                 self.colorTable[@"1a"],
                                                                                                 nil, nil,
                                                                                                 self.colorTable[@"6"], nil,
                                                                                                 [RCUIAppAwesomeIcons hollowEmptyIconWithSize: 24 color: self.colorTable[@"1"]],
                                                                                                 [RCUIAppAwesomeIcons hollowEmptyIconWithSize: 24 color: self.colorTable[@"1"]], nil, nil,
                                                                                                 [RCUIAppAwesomeIcons hollowEmptyIconWithSize: 24 color: self.colorTable[@"7d"]], nil);
    
    self.themeStyleDictionary[RCVoiceMailButtonCall] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"10"],
                                                                                               self.colorTable[@"10"],
                                                                                               nil, nil,
                                                                                               self.colorTable[@"7d"], nil,
                                                                                               self.colorTable[@"4"],
                                                                                               self.colorTable[@"4a"],
                                                                                               nil, nil,
                                                                                               self.colorTable[@"6"], nil,
                                                                                               [RCUIAppAwesomeIcons hollowPhoneIconWithSize: 31 color: self.colorTable[@"6"]],
                                                                                               [RCUIAppAwesomeIcons hollowPhoneIconWithSize: 31 color: self.colorTable[@"6"]], nil, nil,
                                                                                               [RCUIAppAwesomeIcons hollowPhoneIconWithSize: 31 color: self.colorTable[@"7d"]], nil);
    /*
     * Keypad
     */
    self.themeStyleDictionary[RCKeypadButtonKeyNumber] = RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUNDICON (nil, self.colorTable[@"1"], self.colorTable[@"1"], self.colorTable[@"6"]);
    self.themeStyleDictionary[RCActiveCallButtonKeyNumber] = RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUNDICON (self.colorTable[@"1"], nil, self.colorTable[@"6"], self.colorTable[@"1"]);
    self.themeStyleDictionary[RCKeypadButtonAddContact] = RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUNDICONDISABLE (nil, nil, nil,
                                                                                                             [RCUIAppAwesomeIcons hollowAddContactIconWithSize: 28 color: self.colorTable[@"1"]],
                                                                                                             [RCUIAppAwesomeIcons hollowAddContactIconWithSize: 28 color: self.colorTable[@"1a"]],
                                                                                                             [RCUIAppAwesomeIcons hollowAddContactIconWithSize: 28 color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCKeypadButtonDelete] = RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUNDICONDISABLE (nil, nil, nil,
                                                                                                         [RCUIAppAwesomeIcons hollowDeleteIconWithSize: 26 color: self.colorTable[@"1"]],
                                                                                                         [RCUIAppAwesomeIcons hollowDeleteIconWithSize: 26 color: self.colorTable[@"1a"]],
                                                                                                         [RCUIAppAwesomeIcons hollowDeleteIconWithSize: 26 color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCKeypadButtonCall] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"10"],
                                                                                            self.colorTable[@"10"],
                                                                                            nil, nil, nil, nil,
                                                                                            self.colorTable[@"4"],
                                                                                            self.colorTable[@"4a"],
                                                                                            nil, nil, nil, nil,
                                                                                            [RCUIAppAwesomeIcons hollowPhoneIconWithSize: 31 color: self.colorTable[@"6"]],
                                                                                            [RCUIAppAwesomeIcons hollowPhoneIconWithSize: 31 color: self.colorTable[@"6"]],
                                                                                            nil, nil, nil, nil);
    
    self.themeStyleDictionary[RCKeypadButtonFromArrow] = RCUI_BUTTON_THEMESTYLE_WITH_ICON (self.colorTable[@"7b"], self.colorTable[@"7c"]);
    
    /*
     * Documents
     */
    self.themeStyleDictionary[RCDocumentsTableViewCellButtonRename] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"], self.colorTable[@"1"], self.colorTable[@"1"], self.colorTable[@"1a"]);
    
    /*
     * Flip
     */
    self.themeStyleDictionary[RCFlipTableViewCellLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], RCUIMediumSystemFont(17));
    self.themeStyleDictionary[RCFlipTableViewCellLabelDetail] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], RCUIRegularSystemFont(12));
    self.themeStyleDictionary[RCFlipTableViewCellButtonFlip] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"],
                                                                                                            self.colorTable[@"1"],
                                                                                                            self.colorTable[@"1"],
                                                                                                            self.colorTable[@"1a"]);
    self.themeStyleDictionary[RCCallFlipLabelPromptEmpty]   = RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_PARAM (self.colorTable[@"7b"],
                                                                                                            self.colorTable[@"7b"],
                                                                                                            RCUIRegularSystemFont(14),
                                                                                                            RCUIRegularSystemFont(18),
                                                                                                            RCUIRegularSystemFont(18));
    self.themeStyleDictionary[RCCallFlipLabelPromptLoading]      = RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_PARAM (self.colorTable[@"7b"],
                                                                                                                 self.colorTable[@"7b"],
                                                                                                                 RCUIMediumSystemFont(15),
                                                                                                                 RCUIMediumSystemFont(18),
                                                                                                                 RCUIMediumSystemFont(18));
    self.themeStyleDictionary[RCCallFlipLabelPromptErrorTitle]   = RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_PARAM (self.colorTable[@"7b"],
                                                                                                                 self.colorTable[@"7b"],
                                                                                                                 RCUIMediumSystemFont(18),
                                                                                                                 RCUIMediumSystemFont(18),
                                                                                                                 RCUIMediumSystemFont(18));
    self.themeStyleDictionary[RCCallFlipLabelPromptErrorDetail]  = RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_PARAM (self.colorTable[@"7b"],
                                                                                                                 self.colorTable[@"7b"],
                                                                                                                 RCUIMediumSystemFont(12),
                                                                                                                 RCUIMediumSystemFont(18),
                                                                                                                 RCUIMediumSystemFont(18));
    
    /*
     * Active Call
     */
    CGFloat activeCallSize = RCUIIsIPAD () ? 98 : RCUIIsIPHONE4 () ? 58 : 66;
    self.themeStyleDictionary[RCActiveCallButtonHold] = RCUI_BUTTON_THEMESTYLE_WITH_TITLECOLOR_AND_ICON (self.colorTable[@"1"],
                                                                                                         self.colorTable[@"1"],
                                                                                                         self.colorTable[@"7d"],
                                                                                                         [RCUIAppAwesomeIcons hollowHoldCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                         [RCUIAppAwesomeIcons holdCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                         [RCUIAppAwesomeIcons unHoldCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                         [RCUIAppAwesomeIcons unHoldCircleIconWithSize: activeCallSize color: self.colorTable[@"1a"]],
                                                                                                         [RCUIAppAwesomeIcons hollowHoldCircleIconWithSize: activeCallSize color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCActiveCallButtonRecord] = RCUI_BUTTON_THEMESTYLE_WITH_TITLECOLOR_AND_ICON (self.colorTable[@"1"],
                                                                                                           self.colorTable[@"1"],
                                                                                                           self.colorTable[@"7d"],
                                                                                                           [RCUIAppAwesomeIcons hollowRecordCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                           [RCUIAppAwesomeIcons recordCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                           [RCUIAppAwesomeIcons unRecordCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                           [RCUIAppAwesomeIcons unRecordCircleIconWithSize: activeCallSize color: self.colorTable[@"1a"]],
                                                                                                           [RCUIAppAwesomeIcons hollowRecordCircleIconWithSize: activeCallSize color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCActiveCallButtonPark] = RCUI_BUTTON_THEMESTYLE_WITH_TITLECOLOR_AND_ICON (self.colorTable[@"1"],
                                                                                                         self.colorTable[@"1"],
                                                                                                         self.colorTable[@"7d"],
                                                                                                         [RCUIAppAwesomeIcons hollowParkCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                         [RCUIAppAwesomeIcons parkCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                         nil, nil,
                                                                                                         [RCUIAppAwesomeIcons hollowParkCircleIconWithSize: activeCallSize color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCActiveCallButtonKeypad] = RCUI_BUTTON_THEMESTYLE_WITH_TITLECOLOR_AND_ICON (self.colorTable[@"1"],
                                                                                                           self.colorTable[@"1"],
                                                                                                           self.colorTable[@"7d"],
                                                                                                           [RCUIAppAwesomeIcons hollowKeypadCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                           [RCUIAppAwesomeIcons keypadCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                           nil, nil,
                                                                                                           [RCUIAppAwesomeIcons hollowKeypadCircleIconWithSize: activeCallSize color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCActiveCallButtonAudioHeadset] = RCUI_BUTTON_THEMESTYLE_WITH_TITLECOLOR_AND_ICON (self.colorTable[@"1"],
                                                                                                                 self.colorTable[@"1"],
                                                                                                                 self.colorTable[@"7d"],
                                                                                                                 [RCUIAppAwesomeIcons hollowAudioCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                                 [RCUIAppAwesomeIcons audioCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                                 nil, nil,
                                                                                                                 [RCUIAppAwesomeIcons hollowAudioCircleIconWithSize: activeCallSize color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCActiveCallButtonAudioSpeaker] = RCUI_BUTTON_THEMESTYLE_WITH_TITLECOLOR_AND_ICON (self.colorTable[@"1"],
                                                                                                                 self.colorTable[@"1"],
                                                                                                                 self.colorTable[@"7d"],
                                                                                                                 [RCUIAppAwesomeIcons hollowSpeakerCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]] ,
                                                                                                                 [RCUIAppAwesomeIcons speakerCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                                 nil, nil,
                                                                                                                 [RCUIAppAwesomeIcons hollowSpeakerCircleIconWithSize: activeCallSize color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCActiveCallButtonAudioBluetooth] = RCUI_BUTTON_THEMESTYLE_WITH_TITLECOLOR_AND_ICON (self.colorTable[@"1"],
                                                                                                                   self.colorTable[@"1"],
                                                                                                                   self.colorTable[@"7d"],
                                                                                                                   [RCUIAppAwesomeIcons hollowBluetoothCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                                   [RCUIAppAwesomeIcons bluetoothCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                                   nil, nil,
                                                                                                                   [RCUIAppAwesomeIcons hollowBluetoothCircleIconWithSize: activeCallSize color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCActiveCallButtonSwitchToCarrier] = RCUI_BUTTON_THEMESTYLE_WITH_TITLECOLOR_AND_ICON (self.colorTable[@"1"],
                                                                                                                    self.colorTable[@"1"],
                                                                                                                    self.colorTable[@"7d"],
                                                                                                                    [RCUIAppAwesomeIcons hollowCarrierCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                                    [RCUIAppAwesomeIcons carrierCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                                    nil,
                                                                                                                    nil,
                                                                                                                    [RCUIAppAwesomeIcons hollowCarrierCircleIconWithSize: activeCallSize color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCActiveCallButtonMute] = RCUI_BUTTON_THEMESTYLE_WITH_TITLECOLOR_AND_ICON (self.colorTable[@"1"],
                                                                                                         self.colorTable[@"1"],
                                                                                                         self.colorTable[@"7d"],
                                                                                                         [RCUIAppAwesomeIcons hollowUnMuteCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                         [RCUIAppAwesomeIcons muteCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                         [RCUIAppAwesomeIcons muteCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                         [RCUIAppAwesomeIcons muteCircleIconWithSize: activeCallSize color: self.colorTable[@"1a"]],
                                                                                                         [RCUIAppAwesomeIcons hollowUnMuteCircleIconWithSize: activeCallSize color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCActiveCallButtonFlip] = RCUI_BUTTON_THEMESTYLE_WITH_TITLECOLOR_AND_ICON (self.colorTable[@"1"],
                                                                                                         self.colorTable[@"1"],
                                                                                                         self.colorTable[@"7d"],
                                                                                                         [RCUIAppAwesomeIcons hollowFlipCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                         [RCUIAppAwesomeIcons flipCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                         nil, nil,
                                                                                                         [RCUIAppAwesomeIcons hollowFlipCircleIconWithSize: activeCallSize color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCActiveCallButtonTransfer] = RCUI_BUTTON_THEMESTYLE_WITH_TITLECOLOR_AND_ICON (self.colorTable[@"1"],
                                                                                                             self.colorTable[@"1"],
                                                                                                             self.colorTable[@"7d"],
                                                                                                             [RCUIAppAwesomeIcons hollowTransferCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                             [RCUIAppAwesomeIcons transferCircleIconWithSize: activeCallSize color: self.colorTable[@"1"]],
                                                                                                             nil, nil,
                                                                                                             [RCUIAppAwesomeIcons hollowTransferCircleIconWithSize: activeCallSize color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCActiveCallButtonRectMute] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"7b"],
                                                                                                    self.colorTable[@"10"],
                                                                                                    self.colorTable[@"10"],
                                                                                                    self.colorTable[@"10"],
                                                                                                    self.colorTable[@"7d"],
                                                                                                    self.colorTable[@"7d"],
                                                                                                    self.colorTable[@"6"],
                                                                                                    self.colorTable[@"1a"],
                                                                                                    self.colorTable[@"7d"],
                                                                                                    self.colorTable[@"1a"],
                                                                                                    self.colorTable[@"6"],
                                                                                                    self.colorTable[@"6"],
                                                                                                    [RCUIAppAwesomeIcons hollowUnMuteIconWithSize: 29 color: self.colorTable[@"1"]],
                                                                                                    [RCUIAppAwesomeIcons hollowUnMuteIconWithSize: 29 color: self.colorTable[@"1"]],
                                                                                                    [RCUIAppAwesomeIcons hollowMuteIconWithSize: 29 color: self.colorTable[@"1"]],
                                                                                                    [RCUIAppAwesomeIcons hollowMuteIconWithSize: 29 color: self.colorTable[@"1"]],
                                                                                                    [RCUIAppAwesomeIcons hollowUnMuteIconWithSize: 29 color: self.colorTable[@"7d"]],
                                                                                                    [RCUIAppAwesomeIcons hollowMuteIconWithSize: 29 color: self.colorTable[@"7d"]]);
    
    self.themeStyleDictionary[RCActiveCallButtonEndcallBig] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"3"],
                                                                                                      self.colorTable[@"10"],
                                                                                                      nil, nil,
                                                                                                      self.colorTable[@"7d"], nil,
                                                                                                      self.colorTable[@"3"],
                                                                                                      self.colorTable[@"3a"],
                                                                                                      nil, nil,
                                                                                                      self.colorTable[@"6"], nil,
                                                                                                      [RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"6"]],
                                                                                                      [RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"6"]], nil, nil,
                                                                                                      [RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"7d"]], nil);
    
    self.themeStyleDictionary[RCActiveCallButtonEndcallSmall] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"3"],
                                                                                                        self.colorTable[@"10"],
                                                                                                        nil, nil,
                                                                                                        self.colorTable[@"7d"], nil,
                                                                                                        self.colorTable[@"3"],
                                                                                                        self.colorTable[@"3a"],
                                                                                                        nil, nil,
                                                                                                        self.colorTable[@"6"], nil,
                                                                                                        [RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"6"]],
                                                                                                        [RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"6"]], nil, nil,
                                                                                                        [RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"7d"]], nil);

    self.themeStyleDictionary[RCActiveCallButtonHideKeypad] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"7b"],
                                                                                                      self.colorTable[@"10"],
                                                                                                      nil, nil,
                                                                                                      self.colorTable[@"7d"], nil,
                                                                                                      self.colorTable[@"6"],
                                                                                                      self.colorTable[@"1a"],
                                                                                                      nil, nil,
                                                                                                      self.colorTable[@"6"], nil,
                                                                                                      [RCUIAppAwesomeIcons hollowHideKeypadIconWithSize: 31 color: self.colorTable[@"1"]],
                                                                                                      [RCUIAppAwesomeIcons hollowHideKeypadIconWithSize: 31 color: self.colorTable[@"1"]],
                                                                                                      nil, nil,
                                                                                                      [RCUIAppAwesomeIcons hollowHideKeypadIconWithSize: 31 color: self.colorTable[@"7d"]], nil);
    
    self.themeStyleDictionary[RCActiveCallButtonFlipComplete] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"6"],
                                                                                                        self.colorTable[@"6"],
                                                                                                        nil, nil,
                                                                                                        self.colorTable[@"7d"],
                                                                                                        self.colorTable[@"7d"],
                                                                                                        self.colorTable[@"4"],
                                                                                                        self.colorTable[@"4a"],
                                                                                                        nil, nil,
                                                                                                        self.colorTable[@"10"],
                                                                                                        self.colorTable[@"10"],
                                                                                                        self.colorTable[@"10"],
                                                                                                        self.colorTable[@"10"],
                                                                                                        nil, nil,
                                                                                                        self.colorTable[@"7d"],
                                                                                                        self.colorTable[@"7d"]);
    /*
     * Incoming Call
     */
    self.themeStyleDictionary[RCIncomingCallButtonReplyWithMessage] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"1"],
                                                                                                              self.colorTable[@"1"],
                                                                                                              nil, nil, nil, nil,
                                                                                                              self.colorTable[@"6"],
                                                                                                              self.colorTable[@"1a"],
                                                                                                              nil, nil, nil, nil,
                                                                                                              self.colorTable[@"7b"],
                                                                                                              self.colorTable[@"10"],
                                                                                                              nil, nil, nil, nil);

    self.themeStyleDictionary[RCIncomingCallButtonVoicemail] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"10"],
                                                                                                       self.colorTable[@"10"],
                                                                                                       nil, nil, nil, nil,
                                                                                                       self.colorTable[@"3"],
                                                                                                       self.colorTable[@"3a"],
                                                                                                       nil, nil, nil, nil,
                                                                                                       [RCUIAppAwesomeIcons hollowVoicemailIconWithSize: 40 color: self.colorTable[@"6"]],
                                                                                                       [RCUIAppAwesomeIcons hollowVoicemailIconWithSize: 40 color: self.colorTable[@"6"]],
                                                                                                       nil, nil, nil, nil);

    self.themeStyleDictionary[RCIncomingCallButtonAnswer] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"10"],
                                                                                                    self.colorTable[@"10"],
                                                                                                    nil, nil, nil, nil,
                                                                                                    self.colorTable[@"4"],
                                                                                                    self.colorTable[@"4a"],
                                                                                                    nil, nil, nil, nil,
                                                                                                    [RCUIAppAwesomeIcons hollowPhoneIconWithSize: 35 color: self.colorTable[@"6"]],
                                                                                                    [RCUIAppAwesomeIcons hollowPhoneIconWithSize: 35 color: self.colorTable[@"6"]],
                                                                                                    nil, nil, nil, nil);
    
    /*
     * Two Leg
     */
    self.themeStyleDictionary[RCTwoLegButtonEndCall] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"3"],
                                                                                               self.colorTable[@"10"],
                                                                                               nil, nil,
                                                                                               self.colorTable[@"7d"], nil,
                                                                                               self.colorTable[@"3"],
                                                                                               self.colorTable[@"3a"],
                                                                                               nil, nil,
                                                                                               self.colorTable[@"6"], nil,
                                                                                               [RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"6"]],
                                                                                               [RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"6"]], nil, nil,
                                                                                               [RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"7d"]], nil);
    
    /*
     * User Detail
     */
    self.themeStyleDictionary[RCUserDetailFooterButtonFavorite] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM(nil, nil, nil, nil,
                                                                                                         nil, nil, nil, nil,
                                                                                                         nil, nil, nil, nil,
                                                                                                         [RCUIAppAwesomeIcons hollowFavoritesIconWithSize: 24 color: self.colorTable[@"1"]],
                                                                                                         [RCUIAppAwesomeIcons hollowFavoritesIconWithSize: 24 color: self.colorTable[@"1a"]],
                                                                                                         [RCUIAppAwesomeIcons favoritesIconWithSize: 24 color: self.colorTable[@"1"]],
                                                                                                         [RCUIAppAwesomeIcons favoritesIconWithSize: 24 color: self.colorTable[@"1a"]],
                                                                                                         nil,nil);
    self.themeStyleDictionary[RCUserDetailFooterImageViewFax] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowFaxIconWithSize: 25 color: self.colorTable[@"1"]]);
    self.themeStyleDictionary[RCUserDetailFooterImageViewBanner] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"10"], self.colorTable[@"7b"]);
	/*
     * Cloud
     */
    self.themeStyleDictionary[RCCloudAccountInfoButtonUnlink] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"6"],
                                                                                                        self.colorTable[@"6"],
                                                                                                        nil, nil, nil, nil,
                                                                                                        self.colorTable[@"3"],
                                                                                                        self.colorTable[@"3a"],
                                                                                                        nil, nil, nil, nil,
                                                                                                        self.colorTable[@"10"],
                                                                                                        self.colorTable[@"10"],
                                                                                                        nil, nil, nil, nil);
}

- (void) configureThemeStyleFilterBar;
{
//    self.themeStyleDictionary[RCFilterBarImageViewBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"6"], self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCFilterBarItemBackground] = RCUI_FILTERITEM_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"], self.colorTable[@"6"]);
//    self.themeStyleDictionary[RCCallLogFilterBarButtonBackground] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"6"],
//                                                                                                            self.colorTable[@"6"],
//                                                                                                            nil, nil, nil, nil,
//                                                                                                            self.colorTable[@"1"],
//                                                                                                            self.colorTable[@"1a"],
//                                                                                                            nil, nil, nil, nil,
//                                                                                                            self.colorTable[@"6"],
//                                                                                                            self.colorTable[@"6"],
//                                                                                                            nil, nil, nil, nil);
}

- (void) configureThemeStyleMenuIndicator;
{
//    self.themeStyleDictionary[RCMenuIndicatorBackground] = RCUI_MENUINDICATOR_THEMESTYLE_WITH_PARAM (self.colorTable[@"3"]);
}

- (void) configureThemeStyleBadge;
{
//    self.themeStyleDictionary[RCCommonBadgeViewDefault] = RCUI_BADGE_THEMESTYLE_WITH_PARAM (self.colorTable[@"3"], self.colorTable[@"6"]);
}

- (void) configureThemeStyleSwitch;
{
//    self.themeStyleDictionary[RCCommonSwitchDefault] = RCUI_SWITCH_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"6"], self.colorTable[@"6"], self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCMobileSettingsSwitchBackground] = RCUI_SWITCH_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"6"], self.colorTable[@"6"], self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCConferenceSwitchWhiteBGDefault] = RCUI_SWITCH_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"6"], self.colorTable[@"6"], self.colorTable[@"7b"]);
}

- (void) configureThemeStyleOffline;
{
//    self.themeStyleDictionary[RCOfflineBannerImageviewBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND ([(UIColor *)self.colorTable[@"3b"] colorWithAlphaComponent: 0.98], self.colorTable[@"3b"]);
//    self.themeStyleDictionary[RCOfflineBannerLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], nil, RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCOfflineBannerLabelDetail] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], nil, RCUIRegularSystemFont(12));
//    self.themeStyleDictionary[RCOfflineBannerImageviewIcon] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons offlineIconWithSize: 16 color: self.colorTable[@"3"]]);
}

- (void) configureThemeStyleVoIPUnavailable;
{
//    self.themeStyleDictionary[RCVoIPUnavailableBannerImageviewBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"3b"], self.colorTable[@"3b"]);
//    self.themeStyleDictionary[RCVoIPUnavailableBannerLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], nil, RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCVoIPUnavailableBannerImageviewIcon] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowVoIPUnavailableWithSize: 19 color: self.colorTable[@"3"]]);
//    
//    self.themeStyleDictionary[RCCommonVoIPUnavailableIconDefault] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowVoIPUnavailableWithSize: 19 color: self.colorTable[@"6"]],[RCUIAppAwesomeIcons hollowVoIPUnavailableWithSize: 19 color: self.colorTable[@"6a"]]);
}

- (void) configureThemeStyleVoIPOnly;
{
//    self.themeStyleDictionary[RCVoIPOnlyBannerImageviewBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"3b"], self.colorTable[@"3b"]);
//    self.themeStyleDictionary[RCVoIPOnlyBannerLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], nil, RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCVoIPOnlyBannerImageviewIcon] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowVoIPOnlyWithSize: 19 color: self.colorTable[@"3"]]);
}

//- (void) configureThemeStyleDND;
//{
//    self.themeStyleDictionary[RCDNDBannerImageviewBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"3b"], self.colorTable[@"3b"]);
//    self.themeStyleDictionary[RCDNDBannerLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], nil, RCUIRegularSystemFont(12));
//    self.themeStyleDictionary[RCDNDBannerImageviewIconQueue] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons dndIconWithSize: 14 color: self.colorTable[@"2"]]);
//    self.themeStyleDictionary[RCDNDBannerImageviewIconNoCall] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons dndIconWithSize: 14 color: self.colorTable[@"3"]]);
//    self.themeStyleDictionary[RCDNDBannerButtonDelete] = RCUI_BUTTON_THEMESTYLE_WITH_ICON (self.colorTable[@"7b"], self.colorTable[@"7c"]);
//}
//
//- (void) configureThemeStyleView;
//{
//    self.themeStyleDictionary[RCCommonViewDefault] = RCUI_VIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"6"]);
//    self.themeStyleDictionary[RCCommonViewSecondary] = RCUI_VIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"1"]);
//    self.themeStyleDictionary[RCVoiceMailViewBanner] = RCUI_VIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"6"]);
//    self.themeStyleDictionary[RCActiveCallView] = RCUI_VIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"1"]);
//}
//
//- (void) configureThemeStyleSlider;
//{
//    self.themeStyleDictionary[RCCommonSliderDefault] = RCUI_SLIDER_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1a"],
//                                                                                          self.colorTable[@"7d"], self.colorTable[@"7d"]);
//}
//
//- (void) configureThemeStyleProgressView;
//{
//    self.themeStyleDictionary[RCCommonProgressViewDefault] = RCUI_PROGRESSVIEW_THEMESTYLE_WITH_PARAM (self.colorTable[@"4"], self.colorTable[@"4"]);
//}
//
//- (void) configureThemeStyleLabel;
//{
//    /**
//     * Conference
//     */
//    UIFont *conferenceTitleCaptionFont = RCUIRegularSystemFont(15.0);
//    self.themeStyleDictionary[RCConferenceLabelPickerViewTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], conferenceTitleCaptionFont);
//    
//    UIFont *conferencePickerViewItemFont = RCUIRegularSystemFont(17.0);
//    self.themeStyleDictionary[RCConferenceLabelPickerViewItem] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], conferencePickerViewItemFont);
//    
//    /**
//     * Cover page selection
//     */
//    self.themeStyleDictionary[RCCoverPageLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], nil);
//    self.themeStyleDictionary[RCCoverPageLabelType] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], nil);
//    self.themeStyleDictionary[RCCoverPageLabelNote] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7d"], self.colorTable[@"7d"], nil);
//    self.themeStyleDictionary[RCCoverPageLabelInput] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], nil);
//    
//    /**
//     * Keypad
//     */
//    self.themeStyleDictionary[RCKeypadFieldPhoneNumber] = RCUI_TEXTFIELD_THEMESTYLE_WITH_COLOR_FONT(self.colorTable[@"6"],
//                                                                                                    self.colorTable[@"6"],
//                                                                                                    RCUIRegularSystemFont(36),
//                                                                                                    RCUIRegularSystemFont(45));
//
//    self.themeStyleDictionary[RCKeypadLabelFrom] = RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(12),
//                                                                                                     RCUIRegularSystemFont(15), RCUIRegularSystemFont(15));
//    
//    self.themeStyleDictionary[RCKeypadLabelFromPhoneNumber] = RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(12),
//                                                                                                                RCUIRegularSystemFont(20), RCUIRegularSystemFont(20));
//    
//    self.themeStyleDictionary[RCKeypadLabelFromButton] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowDownArrowIconWithSize: 16 color: self.colorTable[@"7"]], [RCUIAppAwesomeIcons hollowDownArrowIconWithSize: 16 color: self.colorTable[@"7a"]]);
//    
//    self.themeStyleDictionary[RCNewFaxLabelNoDocument] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], nil);
//    self.themeStyleDictionary[RCNewFaxLabelCoverPageTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], nil);
//    self.themeStyleDictionary[RCNewFaxLabelCoverPageValue] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], nil);
//    
//    /**
//     * Incoming Call
//     */
//    UIFont *incomingCallLabelFontTitle = RCUIMediumSystemFont(15);
//    self.themeStyleDictionary[RCIncomingCallLabelStatus] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"6"], self.colorTable[@"6"], incomingCallLabelFontTitle);
//    
//    UIFont *incomingCallLabelFontCaller = RCUIThinSystemFont(31.8f);
//    UIFont *incomingCallLabelFontCallerIPad = [incomingCallLabelFontCaller fontWithSize: 57.5f];
//    UIFont *incomingCallLabelFontCallerIPadLandscape = [incomingCallLabelFontCaller fontWithSize: 44.2f];
//    self.themeStyleDictionary[RCIncomingCallLabelCaller] = RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_PARAM (self.colorTable[@"6"],
//                                                                                                         self.colorTable[@"6"],
//                                                                                                         incomingCallLabelFontCaller,
//                                                                                                         incomingCallLabelFontCallerIPad,
//                                                                                                         incomingCallLabelFontCallerIPadLandscape);
//    
//    UIFont *replyWithMessageFontReminderLabel = RCUIMediumSystemFont(14);
//    self.themeStyleDictionary[RCPrecallReplyWithMessageLabelReminder] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], replyWithMessageFontReminderLabel);
//    
//    self.themeStyleDictionary[RCPrecallReplyWithMessageLabelReminderTimeTextColor] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], nil);
//    self.themeStyleDictionary[RCPrecallReplyWithCustomMessageTextPlaceHolder] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], nil);
//    self.themeStyleDictionary[RCPrecallReplyWithCustomMessageText] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], nil);
//    self.themeStyleDictionary[RCPrecallReplyWithCustomMessageIndicatorValid] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], nil);
//    self.themeStyleDictionary[RCPrecallReplyWithCustomMessageIndicatorInvalid] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"3"], nil);
//    self.themeStyleDictionary[RCPrecallReplyWithCustomMessageWarningMessage] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"3"], nil);
//    
//    /**
//     * Two Leg
//     */
//    UIFont *twoLegLabelFontStatusTitle = RCUIMediumSystemFont(18.0f);
//    self.themeStyleDictionary[RCTwoLegLabelStatusTitle] = RCUI_LABEL_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"6"], self.colorTable[@"6"],
//                                                                                                 self.colorTable[@"1"], twoLegLabelFontStatusTitle);
//
//    UIFont *twoLegLabelFontStatusValue = RCUILightSystemFont(20);
//    self.themeStyleDictionary[RCTwoLegLabelStatusValue] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"6"], self.colorTable[@"6"], twoLegLabelFontStatusValue);
//    
//    UIFont *twoLegLabelFontPromptTitle = RCUILightSystemFont(20);
//    self.themeStyleDictionary[RCTwoLegLabelPromptTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], twoLegLabelFontPromptTitle);
//    
//    UIFont *twoLegLabelFontPromptValue = RCUILightSystemFont(20);
//    self.themeStyleDictionary[RCTwoLegLabelPromptValue] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], twoLegLabelFontPromptValue);
//    
//    UIFont *twoLegLabelFontToTitle = RCUIRegularSystemFont(14);
//    self.themeStyleDictionary[RCTwoLegLabelToTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"], twoLegLabelFontToTitle);
//    
//    UIFont *twoLegLabelFontToValue = RCUIRegularSystemFont(20);
//    self.themeStyleDictionary[RCTwoLegLabelToValue] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"], twoLegLabelFontToValue);
//    
//    UIFont *twoLegLabelFontFromTitle = RCUIRegularSystemFont(14);
//    self.themeStyleDictionary[RCTwoLegLabelFromTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"], twoLegLabelFontFromTitle);
//    
//    UIFont *twoLegLabelFontFromValue = RCUIRegularSystemFont(20);
//    self.themeStyleDictionary[RCTwoLegLabelFromValue] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"], twoLegLabelFontFromValue);
//    
//    
//    /*
//     * Active Call
//     */
//    UIFont *connectionTypeLabelFont = RCUILightSystemFont(14.0f);
//    UIFont *connectionTypeLabelFontIPad = [connectionTypeLabelFont fontWithSize: 21.0f];
//    UIFont *connectionTypeLabelFontIPadLandscape = [connectionTypeLabelFont fontWithSize: 15.0f];
//    self.themeStyleDictionary[RCActiveCallLabelConnectionType] = RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_PARAM (self.colorTable[@"7b"],
//                                                                                                               self.colorTable[@"7b"],
//                                                                                                               connectionTypeLabelFont,
//                                                                                                               connectionTypeLabelFontIPad,
//                                                                                                               connectionTypeLabelFontIPadLandscape);
//    
//    UIFont *fromTitleLabelFont = RCUILightSystemFont(15.0f);
//    UIFont *fromTitleLabelFontIPad = RCUILightSystemFont(18.0f);
//    UIFont *fromTitleLabelFontIPadLandscape = RCUILightSystemFont(18.0f);
//    self.themeStyleDictionary[RCActiveCallLabelFromTitle] = RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_PARAM (self.colorTable[@"6"],
//                                                                                                          self.colorTable[@"6"],
//                                                                                                          fromTitleLabelFont,
//                                                                                                          fromTitleLabelFontIPad,
//                                                                                                          fromTitleLabelFontIPadLandscape);
//    
//    UIFont *statusLabelFont = RCUILightSystemFont(18);
//    self.themeStyleDictionary[RCActiveCallLabelStatus] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"6"], self.colorTable[@"6"], statusLabelFont);
//    
//    UIFont *callDurationLabelFont = RCUILightSystemFont(18);
//    self.themeStyleDictionary[RCActiveCallLabelCallDuration] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"6"], self.colorTable[@"6"], callDurationLabelFont);
//    
//    UIFont *destinationLabelFont = RCUIThinSystemFont(36.0f);
//    UIFont *destinationLabelFontIPad = [destinationLabelFont fontWithSize: 50.0f];
//    UIFont *destinationLabelFontIPadLandscape = [destinationLabelFont fontWithSize: 45.0f];
//    self.themeStyleDictionary[RCActiveCallLabelDestination] = RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_PARAM (self.colorTable[@"6"],
//                                                                                                            self.colorTable[@"6"],
//                                                                                                            destinationLabelFont,
//                                                                                                            destinationLabelFontIPad,
//                                                                                                            destinationLabelFontIPadLandscape);
//    
//    UIFont *originLabelFont = RCUILightSystemFont(15.0f);
//    UIFont *originLabelFontIPad = RCUILightSystemFont(18.0f);
//    UIFont *originLabelFontIPadLandscape = RCUILightSystemFont(18.0f);
//    self.themeStyleDictionary[RCActiveCallLabelOrigin] = RCUI_LABEL_THEMESTYLE_WITH_ORIENTATION_PARAM (self.colorTable[@"6"],
//                                                                                                       self.colorTable[@"6"],
//                                                                                                       originLabelFont,
//                                                                                                       originLabelFontIPad,
//                                                                                                       originLabelFontIPadLandscape);
//    
//    /*
//     * Cloud
//     */
//    UIFont *accountLabelFont = RCUIRegularSystemFont(14.0);
//    self.themeStyleDictionary[RCCloudAccountInfoLabelAccount] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], accountLabelFont);
//    
//    UIFont *accountNameLabelFont = RCUIMediumSystemFont(17);
//    self.themeStyleDictionary[RCCloudAccountInfoLabelAccountName] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], accountNameLabelFont);
//    
//    UIFont *infoLabelFont = RCUIRegularSystemFont(14.0);
//    self.themeStyleDictionary[RCCloudAccountInfoLabelInfo] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], infoLabelFont);
//    
//	/*
//	 * To Label
//	 */
//	self.themeStyleDictionary[RCToViewLabelToValue] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(15));
//    self.themeStyleDictionary[RCToViewLabelToTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(15));
//    self.themeStyleDictionary[RCToViewLabelToComma] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], nil);
//}
//
//- (void) configureThemeStyleImageView;
//{
//    self.themeStyleDictionary[RCKeypadImageViewPhoneNumber] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"1"], self.colorTable[@"1"]);
//    self.themeStyleDictionary[RCKeypadImageViewFromPhoneNumber] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"6"], self.colorTable[@"7b"]);
//    
//    /* User Detail */
//    self.themeStyleDictionary[RCUserDetailHeaderImageViewContactHead] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowContactCircleRegularIconWithSize: 58 color: self.colorTable[@"7b"]]);
//    self.themeStyleDictionary[RCUserDetailHeaderImageViewGroupContactHead] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowGroupContactCircleRegularIconWithSize: 58 color: self.colorTable[@"7b"]]);
//    self.themeStyleDictionary[RCUserDetailCellImageViewPhone] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowPhoneIconWithSize: 24 color: self.colorTable[@"1"]],
//                                                                                                      [RCUIAppAwesomeIcons hollowPhoneIconWithSize: 24 color: self.colorTable[@"1a"]]);
//    self.themeStyleDictionary[RCUserDetailCellImageViewText] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowTextIconWithSize: 22 color: self.colorTable[@"1"]],
//                                                                                                     [RCUIAppAwesomeIcons hollowTextIconWithSize: 22 color: self.colorTable[@"1a"]]);
//    self.themeStyleDictionary[RCUserDetailCellImageViewFax] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowFaxIconWithSize: 22 color: self.colorTable[@"1"]],
//                                                                                                     [RCUIAppAwesomeIcons hollowFaxIconWithSize: 22 color: self.colorTable[@"1a"]]);
//    
//    self.themeStyleDictionary[RCUserDetailCellImageViewFavorite] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons favoritesIconWithSize: 14 color: self.colorTable[@"7b"]]);
//    
//    /* Two Leg */
//    self.themeStyleDictionary[RCTwoLegImageViewToBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (self.colorTable[@"7e"]);
//    self.themeStyleDictionary[RCTwoLegImageViewFromBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (self.colorTable[@"7e"]);
//    self.themeStyleDictionary[RCTwoLegImageViewSeperatorView] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCTwoLegImageViewHeader] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"1"], self.colorTable[@"1"]);
//    
//    /*
//     * Incoming Call
//     */
//    CGFloat fontSize = RCUIIsIPAD () ? (RCUIIsOrientationLandscapeSupported () ? 212 : 299) : 164;
//    self.themeStyleDictionary[RCIncomingCallImageViewPhotoPlaceholder] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowContactCircleThinIconWithSize: fontSize color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCIncomingCallImageViewHead] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"1"], self.colorTable[@"1"]);
//    self.themeStyleDictionary[RCPrecallReplyWithMessageBackgroundImageViewReminderLabel] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"6"], self.colorTable[@"7b"]);
//    
//    /*
//     * Active Call
//     */
//    self.themeStyleDictionary[RCActiveCallBackgroundImageView] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"6"], self.colorTable[@"6"]);
//    self.themeStyleDictionary[RCActiveCallBackgroundImageViewTop] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"1"], self.colorTable[@"1"]);
//    self.themeStyleDictionary[RCActiveCallBackgroundImageViewToNumber] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"1"], self.colorTable[@"1"]);
//    self.themeStyleDictionary[RCActiveCallBackgroundImageViewFromNumber] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"1"], self.colorTable[@"1"]);
//
//    self.themeStyleDictionary[RCActiveCallImageViewCallQualityIndicatorUnusable] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons qosUnusedIconWithSize: 35 color: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCActiveCallImageViewCallQualityIndicatorPoor] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons qosPoorIconWithSize: 35 color: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCActiveCallImageViewCallQualityIndicatorAverage] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons qosAverageIconWithSize: 35 color: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCActiveCallImageViewCallQualityIndicatorPerfect] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons qosPerfectIconWithSize: 35 color: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCCallImageViewSecureIcon] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons secureIconWithSize: 15 color: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCActiveCallImageViewHDVoiceIndicator] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowHDVoiceIndicatorWithSize: 22 color: self.colorTable[@"6"]]);
//    
//    /*
//     * Cloud
//     */
//    self.themeStyleDictionary[RCCloudAccountInfoImageViewLogoBox] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage imageNamed: @"RCSPBoxLogo.png"]);
//    self.themeStyleDictionary[RCCloudAccountInfoImageViewLogoDropbox] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage imageNamed: @"RCSPDropboxLogo.png"]);
//    self.themeStyleDictionary[RCConferenceImageViewSeparateLine] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"10"], self.colorTable[@"7b"]);
//    
//}
//
- (void) configureThemeStyleTableView;
{
    self.themeStyleDictionary[RCCommonTableViewDefault] = RCUI_TABLEVIEW_THEMESTYLE_WITH_PARAM (self.colorTable[@"6"], self.colorTable[@"1"], self.colorTable[@"10"], nil);
    self.themeStyleDictionary[RCTableViewSectionBackground] = RCUI_VIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"7e"]);
    self.themeStyleDictionary[RCTableViewFilterBackground] = RCUI_TABLEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"7e"]);
    self.themeStyleDictionary[RCTableViewSectionLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"1"], RCUIMediumSystemFont(16));
    self.themeStyleDictionary[RCTableViewSectionHeaderLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], nil);
    self.themeStyleDictionary[RCTableViewLabelEmpty] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], nil);
}
//
- (void) configureThemeStyleTableViewCell;
{
    /**
     * Normal & Highlighted
     */
    self.themeStyleDictionary[RCTableViewPlainCellDefaultBackground] = RCUI_TABLEVIEWCELL_THEMESTYLE_WITH_HIGHLIGHTED (self.colorTable[@"7e"]);
    self.themeStyleDictionary[RCTableViewGroupCellDefaultBackground] = RCUI_TABLEVIEWCELL_THEMESTYLE_WITH_GROUPPARAM (self.colorTable[@"6"], self.colorTable[@"7e"],
                                                                                                                      self.colorTable[@"7b"], self.colorTable[@"7b"]);
    self.themeStyleDictionary[RCTableViewGroupCellSecondaryBackground] = RCUI_TABLEVIEWCELL_THEMESTYLE_WITH_GROUPPARAM (self.colorTable[@"6"], self.colorTable[@"1a"],
                                                                                                                        self.colorTable[@"7b"], self.colorTable[@"7b"]);
    
    /**
     * common
     */
    self.themeStyleDictionary[RCTableViewCellLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], RCUIRegularSystemFont(17));
    self.themeStyleDictionary[RCTableViewCellLabelTitleDisabled] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7d"], self.colorTable[@"7d"], RCUIRegularSystemFont(17));
    self.themeStyleDictionary[RCMessageTableViewCellLabelUnReadTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"], RCUIMediumSystemFont(17));
    self.themeStyleDictionary[RCMessageTableViewCellLabelUnReadDetail] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], RCUIRegularSystemFont(13));
    
    self.themeStyleDictionary[RCTableViewCellLabelDetail] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], RCUIRegularSystemFont(13));
    self.themeStyleDictionary[RCTableViewCellLabelTime] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], nil);
    self.themeStyleDictionary[RCTableViewCellLabelEmail] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], nil);
    self.themeStyleDictionary[RCCallLogTableViewCellLabelTitleMissed] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"3"], self.colorTable[@"3"], nil);
    self.themeStyleDictionary[RCContactsTableViewCellLabelExtension] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], nil);
    self.themeStyleDictionary[RCDocumentsOutboxTableViewCellLabelFailedTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"3"], self.colorTable[@"3"], nil);
    self.themeStyleDictionary[RCTableViewCellImageViewAccessory] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"]);
    self.themeStyleDictionary[RCTableViewCellImageViewArrow] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"]);
    
    /*
     * Contact Detail
     */
    UIFont *contactCompanyLabelFont = RCUIMediumSystemFont(14);
    UIFont *contactNameFont = RCUIRegularSystemFont(19);
    UIFont *contactCompanyMoodFont = RCUIRegularSystemFont(14);
    self.themeStyleDictionary[RCUserDetailHeaderLabelCompany] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], contactCompanyLabelFont);
    self.themeStyleDictionary[RCUserDetailHeaderLabelMood] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], contactCompanyMoodFont);
    self.themeStyleDictionary[RCUserDetailHeaderLabelName] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], contactNameFont);
    
    UIFont *contactDescriptionLabelFont = RCUIRegularSystemFont(14);
    self.themeStyleDictionary[RCUserDetailDescriptionLabelStatus] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], contactDescriptionLabelFont);
    UIFont *contactDescriptionValueFont = RCUILightSystemFont(14);
    self.themeStyleDictionary[RCUserDetailDescriptionLabelAddress] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], contactDescriptionValueFont);
    UIFont *contactDescriptionTimestampFont = RCUIRegularSystemFont(12);
    self.themeStyleDictionary[RCUserDetailDescriptionLabelTime] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], contactDescriptionTimestampFont);
    
    UIFont *cellCaptionLabelFont = RCUIRegularSystemFont(14);
    self.themeStyleDictionary[RCUserDetailCellLabelCaption] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"], cellCaptionLabelFont);
    self.themeStyleDictionary[RCUserDetailCellLabelDestination] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], cellCaptionLabelFont);
    UIFont *cellCaptionValueFont = RCUILightSystemFont(17);
    self.themeStyleDictionary[RCUserDetailCellLabelValue] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], cellCaptionValueFont);
    UIFont *cellCaptionTitleHighlighted = RCUIRegularSystemFont(14);
    UIFont *cellCaptionValueHighlighted = RCUILightSystemFont(17);
    self.themeStyleDictionary[RCUserDetailCellLabelTitleHighlighted] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"2"], self.colorTable[@"2"], cellCaptionTitleHighlighted);
    self.themeStyleDictionary[RCUserDetailCellLabelValueHighlighted] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"2"], self.colorTable[@"2"], cellCaptionValueHighlighted);
    self.themeStyleDictionary[RCUserDetailCellCreator] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"], nil);
    
    
    /*
     * Message
     */
    self.themeStyleDictionary[RCMessageTableViewCellImageViewIconVoiceRead] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowVoicemailIconWithSize: 22 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCMessageTableViewCellImageViewIconVoiceReadUndownload] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (@"RCSPTableViewCellVoicemailDownloadOpened.png");
    self.themeStyleDictionary[RCMessageTableViewCellImageViewIconVoiceUnread] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowVoicemailIconWithSize: 22 color: self.colorTable[@"1"]]);
    self.themeStyleDictionary[RCMessageTableViewCellImageViewIconVoiceUnreadUndownload] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (@"RCSPTableViewCellVoicemailDownloadUnopened.png");
    
    self.themeStyleDictionary[RCMessageTableViewCellImageViewIconFaxRead] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowFaxIconWithSize: 22 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCMessageTableViewCellImageViewIconFaxReadUndownload] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (@"RCSPTableViewCellFaxDownloadOpened.png");
    self.themeStyleDictionary[RCMessageTableViewCellImageViewIconFaxUnread] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowFaxIconWithSize: 22 color: self.colorTable[@"1"]]);
    self.themeStyleDictionary[RCMessageTableViewCellImageViewIconFaxUnreadUndownload] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (@"RCSPTableViewCellFaxDownloadUnopened.png");
    
    self.themeStyleDictionary[RCMessageTableViewCellImageViewIconTextRead] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowTextIconWithSize: 20 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCMessageTableViewCellImageViewIconTextReadGroup] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowGroupTextIconWithSize: 20 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCMessageTableViewCellImageViewIconTextUnread] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowTextIconWithSize: 22 color: self.colorTable[@"1"]]);
    self.themeStyleDictionary[RCMessageTableViewCellImageViewIconTextUnreadGroup] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowGroupTextIconWithSize: 22 color: self.colorTable[@"1"]]);
    
    self.themeStyleDictionary[RCMessageTableViewCellUtilityButtonRead] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons lightMarkIconWithSize: 24 color: self.colorTable[@"1"]],
                                                                                                           [RCUIAppAwesomeIcons lightMarkIconWithSize: 24 color: self.colorTable[@"1a"]]);
    self.themeStyleDictionary[RCMessageTableViewCellUtilityButtonUnread] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowLightMarkIconWithSize: 24 color: self.colorTable[@"1"]],
                                                                                                             [RCUIAppAwesomeIcons hollowLightMarkIconWithSize: 24 color: self.colorTable[@"1a"]]);
    self.themeStyleDictionary[RCMessageTableViewCellUtilityButtonForward] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowLightForwardIconWithSize: 28 color: self.colorTable[@"7"]],
                                                                                                              [RCUIAppAwesomeIcons hollowLightForwardIconWithSize: 28 color: self.colorTable[@"7a"]]);
    self.themeStyleDictionary[RCMessageTableViewCellUtilityButtonPhone] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowPhoneIconWithSize: 24 color: self.colorTable[@"4"]],
                                                                                                            [RCUIAppAwesomeIcons hollowPhoneIconWithSize: 24 color: self.colorTable[@"4a"]]);
    self.themeStyleDictionary[RCMessageTableViewCellUtilityButtonDelete] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowEmptyIconWithSize: 23 color: self.colorTable[@"3"]],
                                                                                                             [RCUIAppAwesomeIcons hollowEmptyIconWithSize: 23 color: self.colorTable[@"3a"]]);
    self.themeStyleDictionary[RCMessageTableViewCellUtilityButtonFax] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowFaxOutIconWithSize: 25 color: self.colorTable[@"1"]],
                                                                                                          [RCUIAppAwesomeIcons hollowFaxOutIconWithSize: 25 color: self.colorTable[@"1a"]]);
    
    /*
     * Incoming Call
     */
    self.themeStyleDictionary[RCTableViewCellPreCallLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], RCUIMediumSystemFont(17));
    
    /*
     * Call Log
     */
    self.themeStyleDictionary[RCCallLogTableViewCellImageViewFaxFailed] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowFaxFailedIconWithSize: 21 color: self.colorTable[@"3"]]);
    self.themeStyleDictionary[RCCallLogTableViewCellImageViewFaxIncoming] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowFaxInIconWithSize: 21 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCCallLogTableViewCellImageViewFaxOutgoing] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowFaxOutIconWithSize: 21 color: self.colorTable[@"7b"]]);
    
    self.themeStyleDictionary[RCCallLogTableViewCellImageViewPhoneCallMissed] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowCallFailedIconWithSize: 21 color: self.colorTable[@"3"]]);
    self.themeStyleDictionary[RCCallLogTableViewCellImageViewPhoneCallOpened] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowCallOutIconWithSize: 21 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCCallLogTableViewCellImageViewPhoneCallUnopened] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowCallInIconWithSize: 21 color: self.colorTable[@"7b"]]);
    
    /*
     * Outbox
     */
    self.themeStyleDictionary[RCDocumentsDraftsTableViewCellImageViewFax] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowFaxIconWithSize: 23 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsOutboxTableViewCellImageViewLoading] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (@"RCSPOutboxLoading.png");
    self.themeStyleDictionary[RCDocumentsOutboxTableViewCellImageViewFailed] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowFaxFailedIconWithSize: 23 color: self.colorTable[@"3"]]);
    self.themeStyleDictionary[RCDocumentsOutboxTableViewCellImageViewOut] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowFaxOutIconWithSize: 23 color: self.colorTable[@"1"]]);
    
    self.themeStyleDictionary[RCSelectSourceTableViewCellImageViewDocuments] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowDocumentIconWithSize: 20 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCSelectSourceTableViewCellImageViewPhotos] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowPhotosIconWithSize: 19 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCSelectSourceTableViewCellImageViewDropbox] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowDropboxIconWithSize: 21 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCSelectSourceTableViewCellImageViewBox] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowBoxIconWithSize: 22 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCSelectSourceTableViewCellImageViewGoogleDrive] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowGoogleDriveIconWithSize: 22 color: self.colorTable[@"7b"]]);
    
    /*
     * Documents Draft
     */
    self.themeStyleDictionary[RCDocumentsDraftsTableViewCellImageViewFax] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowFaxIconWithSize: 22 color: self.colorTable[@"7b"]]);
    
    /*
     * Documents fax document type
     */
    CGFloat fontSize = 30;
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeDefault] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowDocumentIconWithSize: 21 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeDOC] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowDOCIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeGIF] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowGIFIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeJPG] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowJPGIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypePDF] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowPDFIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypePNG] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowPNGIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypePPT] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowPPTIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeTIFF] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowTIFFIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeVSD] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowVSDIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeXLS] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowXLSIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeAWD] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowAWDIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeBMP] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowBMPIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeC] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowCIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeCPP] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowCPPIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeCSV] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowCSVIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeDOCM] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowDOCMIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeDOCX] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowDOCXIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeDOT] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowDOTIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeDXF] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowDXFIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeEPS] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowEPSIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeERR] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowERRIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeH] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowHIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeHPP] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowHPPIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeHTM] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowHTMIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeHTML] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowHTMLIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeJPEG] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowJPEGIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeLOG] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowLOGIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeMCW] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowMCWIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeMHT] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowMHTIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeMHTML] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowMHTMLIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypePCX] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowPCXIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypePPTM] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowPPTMIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypePPTX] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowPPTXIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypePSD] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowPSDIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypePUB] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowPUBIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeRTF] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowRTFIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeTGA] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowTGAIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeTIF] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowTIFIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeTXT] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowTXTIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeVDX] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowVDXIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeWK1] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowWK1IconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeWK4] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowWK4IconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeWPS] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowWPSIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeWQ1] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowWQ1IconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeWRI] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowWRIIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeXLSB] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowXLSBIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeXLSM] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowXLSMIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeXLSX] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowXLSXIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeXML] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowXMLIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeWPD] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowWPDIconWithSize: fontSize color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeFolder] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowDocumentsIconWithSize: 21 color: self.colorTable[@"7b"]]);
    self.themeStyleDictionary[RCDocumentsFaxDocumentTypeUnsupport] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowDocumentIconWithSize: 21 color: self.colorTable[@"7b"]]);
    
    /*
     * Select source
     */
    self.themeStyleDictionary[RCSelectSourceTableViewCellLabelSelectSource] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], nil);
    
    /**
     * Settings
     */
    self.themeStyleDictionary[RCMobileSettingsTableViewCellLabelCloudStorage] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], nil);
    
    /**
     * Filters
     */
    self.themeStyleDictionary[RCFiltersTableViewCellHideShow] = RCUI_TABLEVIEWCELL_THEMESTYLE_WITH_GROUPPARAM (self.colorTable[@"1"], self.colorTable[@"1a"],
                                                                                                               self.colorTable[@"10"], self.colorTable[@"10"]);
    self.themeStyleDictionary[RCFiltersTableViewCellHideShowLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"6"], self.colorTable[@"1"], nil);
    self.themeStyleDictionary[RCFiltersTableViewCellLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], nil);
    self.themeStyleDictionary[RCFiltersTableViewCellLabelTitleHighlighted] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"], nil);
    
    /**
     *  Conferencing
     */
    self.themeStyleDictionary[RCConferenceParticipantCellUtilityButtonInfo] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowInformationCircleIconWithSize: 28 color: self.colorTable[@"7"]],
                                                                                                              [RCUIAppAwesomeIcons hollowInformationCircleIconWithSize: 28 color: self.colorTable[@"7a"]]);
    self.themeStyleDictionary[RCConferenceParticipantCellUtilityButtonDissmiss] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"], self.colorTable[@"6a"],
                                                                                                  self.colorTable[@"3"], self.colorTable[@"3a"]);
}

- (void) configureThemeStyleRefreshView;
{
    self.themeStyleDictionary[RCRefreshViewBackground] = RCUI_VIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"6"]);
    self.themeStyleDictionary[RCRefreshViewLabelStatus] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIMediumSystemFont(12));
    self.themeStyleDictionary[RCRefreshViewLabelTime] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(11.f));
    self.themeStyleDictionary[RCRefreshViewImageViewArrow] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (self.colorTable[@"7b"]);
}
//
- (void) configureThemeStyleMeeting;
{
    self.themeStyleDictionary[RCMeetingButtonJoin] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"], self.colorTable[@"1"],
                                                                                                  self.colorTable[@"1"], self.colorTable[@"1a"]);
    self.themeStyleDictionary[RCMeetingLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(17));
    self.themeStyleDictionary[RCMeetingDetailLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(15));
    self.themeStyleDictionary[RCMeetingLabelPrompt] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(17));
}
//
//- (void) configureThemeStyleConference;
//{
//    
//    self.themeStyleDictionary[RCConferenceButtonInvite] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND(self.colorTable[@"1"], self.colorTable[@"1a"],
//                                                                                                      self.colorTable[@"1"], self.colorTable[@"1a"]);
//    
//    self.themeStyleDictionary[RCConferenceButtonInviteWithOptions] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM(self.colorTable[@"1"], //titleNormal
//                                                                                                 self.colorTable[@"1a"], //titleHighlighted,
//                                                                                                 nil, //titleSelected,
//                                                                                                 nil, //titleSelectedHighlighted,
//                                                                                                 nil, //titleDisable,
//                                                                                                 nil, //titleSelectedDisable
//                                                                                                 self.colorTable[@"1"], //bgNormal,
//                                                                                                 self.colorTable[@"1a"], //bgHighlighted,
//                                                                                                 nil, //bgSelected,
//                                                                                                 nil, //bgSelectedHighlighted,
//                                                                                                 nil, //bgDisable,
//                                                                                                 nil, //bgSelectedDisable,
//                                                                                                 [RCUIAppAwesomeIcons hollowThinDownArrowIconWithSize: 18 color: self.colorTable[@"1"]], //iconNormal,
//                                                                                                 [RCUIAppAwesomeIcons hollowThinDownArrowIconWithSize: 18 color: self.colorTable[@"1"]],// iconHighlighted,
//                                                                                                 [RCUIAppAwesomeIcons hollowThinDownArrowIconWithSize: 18 color: self.colorTable[@"1a"]],  //iconSelected,
//                                                                                                 nil, //iconSelectedHighlighted,
//                                                                                                 nil, //iconDisable,
//                                                                                                 nil //iconSelectedDisable
//                                                                                                 );
//    
//    RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"1"], self.colorTable[@"1a"],
//                                                                                                       self.colorTable[@"1"], self.colorTable[@"1a"]);
//    
//    
//    self.themeStyleDictionary[RCConferenceButtonEndCall] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"3"],
//                                                                                                   self.colorTable[@"10"],
//                                                                                                   nil, nil,
//                                                                                                   self.colorTable[@"7d"], nil,
//                                                                                                   self.colorTable[@"3"],
//                                                                                                   self.colorTable[@"3a"],
//                                                                                                   nil, nil,
//                                                                                                   self.colorTable[@"6"], nil,
//                                                                                                   [RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"6"]],
//                                                                                                   [RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"6"]], nil, nil,
//                                                                                                   [RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"7d"]], nil);
//    
//
//    self.themeStyleDictionary[RCConferenceButtonEndCallWithOptions] =
//        RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (
//                                                self.colorTable[@"3"],
//                                                self.colorTable[@"10"],
//                                                nil, nil,
//                                                self.colorTable[@"7d"], nil,
//                                                self.colorTable[@"3"],
//                                                self.colorTable[@"3a"],
//                                                nil, nil,
//                                                self.colorTable[@"6"], nil,
//                                                [UIImage
//                                                    imageCombining:[RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"6"]]
//                                                    at:CGRectMake(0, 0, 41, 41)
//                                                    and:[RCUIAppAwesomeIcons downArrowIconWithSize: 18 color: self.colorTable[@"6"]]
//                                                    at:CGRectMake(42, 12, 18, 18)],
//                                                [UIImage
//                                                    imageCombining:[RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"6"]]
//                                                    at:CGRectMake(0, 0, 41, 41)
//                                                    and:[RCUIAppAwesomeIcons downArrowIconWithSize: 18 color: self.colorTable[@"6"]]
//                                                    at:CGRectMake(42, 12, 18, 18)],
//                                                nil,
//                                                nil,
//                                                [UIImage
//                                                    imageCombining:[RCUIAppAwesomeIcons hollowEndCallIconWithSize: 41 color: self.colorTable[@"7d"]]
//                                                    at:CGRectMake(0, 0, 41, 41)
//                                                    and:[RCUIAppAwesomeIcons downArrowIconWithSize: 18 color: self.colorTable[@"7d"]]
//                                                    at:CGRectMake(42, 12, 18, 18)],
//                                                nil);
//    
//    
//    
//    
//    
//    
//    self.themeStyleDictionary[RCConferenceButtonReconnect] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"], self.colorTable[@"1"],
//                                                                                                          self.colorTable[@"1"], self.colorTable[@"1a"]);
//    
//    self.themeStyleDictionary[RCConferenceMeetingIDLabel] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1a"], RCUIRegularSystemFont(16));
//    self.themeStyleDictionary[RCConferenceLabelReconnectTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"], RCUIMediumSystemFont(17));
//    
//    self.themeStyleDictionary[RCConferenceLabelParticipantTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], RCUIRegularSystemFont(17));
//
//    self.themeStyleDictionary[RCConferenceLabelHostParticipantTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"], RCUIRegularSystemFont(17));
//
//    self.themeStyleDictionary[RCConferenceLabelParticipantSubtitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], RCUIRegularSystemFont(14));
//    
//    
//    self.themeStyleDictionary[RCConferenceButtonContinue] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"], self.colorTable[@"6a"],
//                                                                                                         self.colorTable[@"4"], self.colorTable[@"4a"]);
//    
//    self.themeStyleDictionary[RCConferenceButtonAudio] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND(self.colorTable[@"1"], self.colorTable[@"1a"],
//                                                                                                      self.colorTable[@"1"], self.colorTable[@"1a"]);
//
//    self.themeStyleDictionary[RCConferenceButtonMute] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"7b"],
//                                                                                                self.colorTable[@"10"],
//                                                                                                self.colorTable[@"10"],
//                                                                                                self.colorTable[@"10"],
//                                                                                                self.colorTable[@"7d"],
//                                                                                                self.colorTable[@"7d"],
//                                                                                                self.colorTable[@"1"],
//                                                                                                self.colorTable[@"1a"],
//                                                                                                self.colorTable[@"7d"],
//                                                                                                self.colorTable[@"1a"],
//                                                                                                self.colorTable[@"6"],
//                                                                                                self.colorTable[@"6"],
//                                                                                                [RCUIAppAwesomeIcons hollowUnMuteIconWithSize: 29 color: self.colorTable[@"1"]],
//                                                                                                [RCUIAppAwesomeIcons hollowUnMuteIconWithSize: 29 color: self.colorTable[@"1"]],
//                                                                                                [RCUIAppAwesomeIcons hollowMuteIconWithSize: 29 color: self.colorTable[@"1"]],
//                                                                                                [RCUIAppAwesomeIcons hollowMuteIconWithSize: 29 color: self.colorTable[@"1"]],
//                                                                                                [RCUIAppAwesomeIcons hollowUnMuteIconWithSize: 29 color: self.colorTable[@"7d"]],
//                                                                                                [RCUIAppAwesomeIcons hollowMuteIconWithSize: 29 color: self.colorTable[@"7d"]]);
//    
//
//    self.themeStyleDictionary[RCConferenceButtonJoin] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"], self.colorTable[@"1"],
//                                                                                                     self.colorTable[@"1"], self.colorTable[@"1a"]);
//    self.themeStyleDictionary[RCConferenceLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"1"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCConferenceLabelValue] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"1"], RCUIRegularSystemFont(18));
//    self.themeStyleDictionary[RCConferenceTableViewCellLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"], RCUIMediumSystemFont(17));
//}
//
//- (void) configureThemeStyleToastMessage;
//{
//    self.themeStyleDictionary[RCToastImageViewBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"3b"], self.colorTable [@"3b"]);
//    self.themeStyleDictionary[RCToastImageViewIcon] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons contactSuccessHintIconWithSize: 28 color: self.colorTable[@"7"]]);
//    self.themeStyleDictionary[RCToastLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(14));
//}
//
//- (void) configureThemeStyleAssetsPicker;
//{
//    self.themeStyleDictionary[RCAssetsPickerLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIMediumSystemFont(17));
//    self.themeStyleDictionary[RCThumbPickerTableViewCellLableTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], RCUIMediumSystemFont(17));
//}
//
//- (void) configureThemeStyleRingoutMode;
//{
//    self.themeStyleDictionary[RCRingOutModeTableViewCellRingoutCallsCellLableText] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(16));
//    self.themeStyleDictionary[RCRingOutModeTableViewCellRingoutCallsCellLableTextSelected] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"1"], RCUIRegularSystemFont(16));
//    
//    self.themeStyleDictionary[RCRingOutModeTableViewCellRingoutCallMeCellLableText] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCRingOutModeTableViewCellRingoutCallMeCellLableTextSelected] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"1"], RCUIRegularSystemFont(14));
//    
//    self.themeStyleDictionary[RCRingOutModeTableViewCellRingoutcallMeCellLableValue] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCRingOutModeTableViewCellRingoutcallMeCellLableValueSelected] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"1"], RCUIRegularSystemFont(14));
//    
//    self.themeStyleDictionary[RCRingOutModeTableViewCellConfirmConnectionCellLableText] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(16));
//    self.themeStyleDictionary[RCRingOutModeTableViewCellChangeMyPhoneNumberCellLableText] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"1"], RCUIRegularSystemFont(16));
//    self.themeStyleDictionary[RCRingOutModeTableViewHeaderViewLableTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCRingOutModeTableViewAddphoneTableViewCellLableTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCRingOutModeTableViewAddphoneTableViewCellTextfieldValue] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(17));
//}
//
//- (void) configureThemeStyleSettingsCallerID;
//{
//    self.themeStyleDictionary[RCSettingsCallerIDTableViewHeaderText] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCSettingsCallerIDTableViewCellLableText] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCSettingsCallerIDTableViewCellLableValue] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCSettingsCallerIDTableViewCellLableTextSelected] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"1"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCSettingsCallerIDTableViewCellLableValueSelected] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"1"], RCUIRegularSystemFont(14));
//}
//
//- (void) configureThemeStylePopover;
//{
//    self.themeStyleDictionary[RCPopoverButtonBackground] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"7"], self.colorTable[@"7a"], nil, nil);
//    self.themeStyleDictionary[RCImageViewCheckmark] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"1"]);
//    self.themeStyleDictionary[RCPopoverSeperateViewBackground] = RCUI_VIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCPopoverTableViewCellLableTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"1"], RCUIMediumSystemFont(14));
//    self.themeStyleDictionary[RCPopoverTableViewCellLableValue] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"1"], RCUIMediumSystemFont(16));
//}
//
//- (void) configureThemeStylePresence;
//{
//    self.themeStyleDictionary[RCFavoritesTableViewCellImageViewAvailable] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (self.colorTable[@"4"]);
//    self.themeStyleDictionary[RCFavoritesTableViewCellImageViewOffline] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (self.colorTable[@"7d"]);
//    self.themeStyleDictionary[RCFavoritesTableViewCellImageViewBusy] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (self.colorTable[@"3"]);
//    self.themeStyleDictionary[RCFavoritesTableViewCellImageViewBusyhold] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (self.colorTable[@"5"]);
//    self.themeStyleDictionary[RCFavoritesTableViewCellImageViewBusyRinging] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (self.colorTable[@"4"]);
//}
//
//- (void) configureThemeStyleVoiceMail;
//{
//    self.themeStyleDictionary[RCVoiceMailLabelBanner] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(13));
//    self.themeStyleDictionary[RCVoiceMailLabelFromTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUILightSystemFont(14));
//    self.themeStyleDictionary[RCVoiceMailLabelFromValue] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUILightSystemFont(24));
//    self.themeStyleDictionary[RCVoiceMailLabelFromDetail] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUILightSystemFont(14));
//    self.themeStyleDictionary[RCVoiceMailLabelToTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUILightSystemFont(14));
//    self.themeStyleDictionary[RCVoiceMailLabelToValue] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUILightSystemFont(14));
//    self.themeStyleDictionary[RCVoiceMailLabelStartTime] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUILightSystemFont(11));
//    self.themeStyleDictionary[RCVoiceMailLabelEndTime] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUILightSystemFont(11));
//    self.themeStyleDictionary[RCVoiceMailTextTranscription] = RCUI_TEXTVIEW_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUILightSystemFont(17));
//    self.themeStyleDictionary[RCVoiceMailTextTranscriptionFullscreen] = RCUI_TEXTVIEW_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(17));
//    self.themeStyleDictionary[RCVoiceMailLabelTranscriptionReload] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"1"], RCUILightSystemFont(11));
//    self.themeStyleDictionary[RCVoiceMailViewSeparator] = RCUI_VIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"7d"]);
//    self.themeStyleDictionary[RCVoiceMailLabelTranscriptionNotAvailable] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCVoiceMailButtonFullscreenClose] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons closeIconWithSize: 22 color:self.colorTable[@"7a"]],
//                                                                                                    [RCUIAppAwesomeIcons closeIconWithSize: 22 color:self.colorTable[@"7c"]]);
//    self.themeStyleDictionary[RCVoiceMailButtonTip] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowInformationCircleIconWithSize: 22 color: self.colorTable[@"1"]],
//                                                                                        [RCUIAppAwesomeIcons hollowInformationCircleIconWithSize: 22 color: self.colorTable[@"1a"]]);
//}
//
//- (void) configureThemeStylePickerView;
//{
//    self.themeStyleDictionary[RCCustomerPickerImageviewBanner] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"7e"], self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCCustomerPickerButtonDone] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"1"], self.colorTable[@"1a"], nil, nil);
//    self.themeStyleDictionary[RCCustomerPickerLableTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIMediumSystemFont(15));
//    self.themeStyleDictionary[RCCustomerPickerLabelValue] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIMediumSystemFont(15));
//}
//
//- (void) configureThemeStyleToolBar;
//{
//    self.themeStyleDictionary[RCMobileSettingsToolBarBackgroundDefault] = RCUI_TOOLBAR_THEMESTYLE_WITHBACKGROUND (self.colorTable[@"1"], self.colorTable[@"1"]);
//    self.themeStyleDictionary[RCMobileSettingsToolBarBackgroundSecondary] = RCUI_TOOLBAR_THEMESTYLE_WITHBACKGROUND (self.colorTable[@"7e"], self.colorTable[@"7e"]);
//    self.themeStyleDictionary[RCMobileSettingsToolBarItemDefault] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowHomeIconWithSize: 24 color: self.colorTable[@"6"]],
//                                                                                               [RCUIAppAwesomeIcons hollowHomeIconWithSize: 24 color: self.colorTable[@"6a"]]);
//    self.themeStyleDictionary[RCMobileSettingsToolBarItemSecondary] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowHomeIconWithSize: 24 color: self.colorTable[@"1"]],
//                                                                                                  [RCUIAppAwesomeIcons hollowHomeIconWithSize: 24 color: self.colorTable[@"1a"]]);
//    self.themeStyleDictionary[RCAlbumToolBarBackground] = RCUI_TOOLBAR_THEMESTYLE_WITHBACKGROUND (self.colorTable[@"6"], self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCAlbumToolBarItemDone] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"1"], self.colorTable[@"1a"], nil, nil);
//}
//
//- (void) configureThemeStyleTextField;
//{
//    self.themeStyleDictionary[RCTextFieldNormal] = RCUI_TEXTFIELD_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], nil, nil);
//    self.themeStyleDictionary[RCCommonHiddenKeypadBannerDefault] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowKeyboardQuitIconWithSize: 28 color: self.colorTable[@"6"]]);
//}
//
//- (void) configureThemeStyleEmbeddedBrowser;
//{
//    self.themeStyleDictionary[RCMobileSettingsEmbeddedLabelBanner] = RCUI_LABEL_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"7"], nil, self.colorTable[@"7"], nil);
//    self.themeStyleDictionary[RCMobileSettingsEmbeddedLabelProgress] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], nil);
//    self.themeStyleDictionary[RCMobileSettingsEmbeddedLabelError] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(20));
//}
//
//- (void) configureThemeStyleSMS;
//{
//    self.themeStyleDictionary[RCConversationTableViewCellLabelTime] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(12));
//    self.themeStyleDictionary[RCConversationTableViewCellLabelSender] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(12));
//    
//    self.themeStyleDictionary[RCConversationTableViewCellLabelSelfLinkedContent] = RCUI_LABEL_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"7"], nil, self.colorTable[@"7d"], nil);
//    self.themeStyleDictionary[RCConversationTableViewCellLabelOtherLinkedContent] = RCUI_LABEL_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"7"], nil, self.colorTable[@"7d"], nil);
//    
//    self.themeStyleDictionary[RCConversationTableViewCellImageViewFCCSeperator] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"7b"], nil);
//    
//    self.themeStyleDictionary[RCSMSTableViewCellLabelDetect] = RCUI_LABEL_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"1"], nil, self.colorTable[@"5b"], nil);
//    self.themeStyleDictionary[RCSMSTableViewCellLabelTapjoin] = RCUI_LABEL_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"1"], self.colorTable[@"1a"], nil, nil);
//    self.themeStyleDictionary[RCConversationTableViewCellImageViewFCC] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowConferenceIconWithSize: 22 color: self.colorTable[@"7"]]);
//    self.themeStyleDictionary[RCConversationTableViewCellLabelError] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"3"],  RCUIMediumSystemFont(12));
//    self.themeStyleDictionary[RCConversationTableViewCellButtonError] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowAlertCircleIconWithSize: 22 color: self.colorTable[@"3"]],
//                                                                                                          [RCUIAppAwesomeIcons hollowAlertCircleIconWithSize: 22 color: self.colorTable[@"3a"]]);
//    
//    self.themeStyleDictionary[RCConversationTableViewCellTextViewSendingMessage] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], nil);
//    self.themeStyleDictionary[RCConversationTableViewCellLabelSendingMessagePlaceholder] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], nil);
//    self.themeStyleDictionary[RCConversationTableViewCellImageViewSendingMessage] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"6"], nil);
//    self.themeStyleDictionary[RCConversationTableViewCellButtonSendingMessage] = RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUNDICONDISABLE (nil, nil, nil,
//                                                                                                                                    [RCUIAppAwesomeIcons hollowSendIconWithSize: 18 color: self.colorTable[@"1"]],
//                                                                                                                                    [RCUIAppAwesomeIcons hollowSendIconWithSize: 18 color: self.colorTable[@"1a"]],
//                                                                                                                                    [RCUIAppAwesomeIcons hollowSendIconWithSize: 18 color: self.colorTable[@"7d"]]);
//    self.themeStyleDictionary[RCConversationSendingProgressLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"6"],RCUIMediumSystemFont(17));
//    self.themeStyleDictionary[RCSMSFromTitleLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], nil);
//    self.themeStyleDictionary[RCSMSFromLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], nil);
//}
//                                                                                               
//- (void) configureThemeStyleLogin;
//{
//    /*
//     * Login
//     */
//    self.themeStyleDictionary[RCLoginImageViewLogo] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (@"RCSPLoginLogo.png");
//    self.themeStyleDictionary[RCLoginButtonLogin] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"], self.colorTable[@"1"],
//                                                                                                 self.colorTable[@"1"], self.colorTable[@"1a"]);
//    self.themeStyleDictionary[RCLoginButtonResetPassword] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"1"], self.colorTable[@"2"],
//                                                                                               nil, RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCLoginDoNotHaveAnAccountLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(RCUIIsIPAD() ? 14 : 12));
//    self.themeStyleDictionary[RCLoginButtonSignup] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"1"], self.colorTable[@"1a"], nil, RCUIRegularSystemFont(RCUIIsIPAD() ? 14 : 12));
//	self.themeStyleDictionary[RCLoginTextFieldDefault] = RCUI_TEXTFIELD_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7b"], RCUIRegularSystemFont(17));
//    self.themeStyleDictionary[RCLoginButtonFlagBackground] = RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUND ([UIImage uiImageWithBannerColor: self.colorTable[@"10"]
//                                                                                                                           lineColor: self.colorTable[@"7b"]
//                                                                                                                            lineEdge: UIEdgeInsetsMake (0, 0, 0, 1)],
//                                                                                                     [UIImage uiImageWithBannerColor: self.colorTable[@"10"]
//                                                                                                                           lineColor: self.colorTable[@"7b"]
//                                                                                                                            lineEdge: UIEdgeInsetsMake (0, 0, 0, 1)]);
//    
//    /*
//     * TOS
//     */
//    self.themeStyleDictionary[RCTOSButtonDecline] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"], self.colorTable[@"6"],
//                                                                                                 self.colorTable[@"3"], self.colorTable[@"3a"]);
//    self.themeStyleDictionary[RCTOSButtonAccept] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"], self.colorTable[@"6"],
//                                                                                                self.colorTable[@"4"], self.colorTable[@"4a"]);
//    
//    /*
//     * E911
//     */
//    self.themeStyleDictionary[RCE911ButtonAccept] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"], self.colorTable[@"6"],
//                                                                                                 self.colorTable[@"4"], self.colorTable[@"4a"]);
//    self.themeStyleDictionary[RCE911ButtonDecline] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"], self.colorTable[@"6"],
//                                                                                                  self.colorTable[@"3"], self.colorTable[@"3a"]);
//    
//    /*
//     * Account setup
//     */
//    self.themeStyleDictionary[RCAccountSetupBusinessPhonenumberCompanyLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCAccountSetupBusinessPhonenumberCompanyValue] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"2"], RCUILightSystemFont(22));
//    self.themeStyleDictionary[RCAccountSetupBusinessPhonenumberExtensionLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(15));
//    self.themeStyleDictionary[RCAccountSetupBusinessPhonenumberExtensionValue] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"2"], RCUILightSystemFont(22));
//    self.themeStyleDictionary[RCAccountSetupDescriptionLightLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCAccountSetupDescriptionDarkLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(15));
//    self.themeStyleDictionary[RCAccountSetupEnterPhonenumberText] = RCUI_TEXTFIELD_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7b"], RCUIRegularSystemFont(17));
//}
//
//- (void) configureThemeStyleCloudDownload;
//{
//    self.themeStyleDictionary[RCCloudDownloadImageViewBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (self.colorTable[@"6"]);
//    self.themeStyleDictionary[RCCloudDownloadLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIMediumSystemFont(14));
//    self.themeStyleDictionary[RCCloudDownloadLabelDetail] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(11));
//    self.themeStyleDictionary[RCCloudDownloadLabelStatus] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIMediumSystemFont(12));
//    self.themeStyleDictionary[RCCloudDownloadLabelProgress] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIMediumSystemFont(12));
//    self.themeStyleDictionary[RCCloudDownloadProgressBackground] = RCUI_PROGRESSVIEW_THEMESTYLE_WITH_PARAM (self.colorTable[@"7d"], self.colorTable[@"1"]);
//    self.themeStyleDictionary[RCCloudDownloadImageViewSeperateLine] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCCloudDownloadButtonCancel] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"7"], self.colorTable[@"7a"],
//                                                                                                nil, RCUIMediumSystemFont(17));
//    self.themeStyleDictionary[RCCloudTableViewSectionLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIMediumSystemFont(16));
//}
//
//- (void) configureThemeStyleGroupMessagingTip;
//{
//    self.themeStyleDictionary[RCGroupMessagingTipHeaderLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"1"], RCUIMediumSystemFont(19));
//    self.themeStyleDictionary[RCGroupMessagingTipSeparatorView] = RCUI_VIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCGroupMessagingTipInfoLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCGroupMessagingTipOkButton] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"1"], self.colorTable[@"1"],
//                                                                                                          self.colorTable[@"7b"], self.colorTable[@"1a"]);
//    self.themeStyleDictionary[RCGroupMessagingHintLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCGroupMessagingHintInfoLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"1"], RCUIRegularSystemFont(21));
//}
//
//- (void) configureThemeStyleIntroduction;
//{
//    self.themeStyleDictionary[RCIntroductionButtonDone] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"7"], self.colorTable[@"7a"], nil, nil);
//    self.themeStyleDictionary[RCIntroductionButtonSkip] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"7"], self.colorTable[@"7a"], nil, nil);
//    self.themeStyleDictionary[RCIntroductionPageControlDot] = RCUI_PAGECONTROL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7d"], self.colorTable[@"1"]);
//    self.themeStyleDictionary[RCIntroductionImageViewBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"6"], self.colorTable[@"7b"]);
//}
//
//- (void) configureThemeStyleLegalDocs;
//{
//    self.themeStyleDictionary[RCLegalDocsReloadingLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(16));
//}
//
//- (void) configureThemeStyleLoading;
//{
//    self.themeStyleDictionary[RCActivityIndicatorLoading] = RCUI_ACTIVITYINDICATOR_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCActivityIndicatorLabelLoading] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], nil);
//}
//
//- (void) configureThemeStyleReports;
//{
//    self.themeStyleDictionary[RCReportsNoInternetIcon] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowNoInternetIconWithSize: 30 color: self.colorTable[@"7b"]]);
//}
//
//- (void) configureThemeStyleDataMigration;
//{
//    self.themeStyleDictionary[RCDataMigrationTextLabel] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (kStandardColor7, nil);
//    self.themeStyleDictionary[RCDataMigrationHeaderSeparator] = RCUI_VIEW_THEMESTYLE_WITH_BACKGROUND (kStandardColor7b);
//    self.themeStyleDictionary[RCDataMigrationStartButton] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (kStandardColor6,
//                                                                                                    kStandardColor6,
//                                                                                                    nil, nil,
//                                                                                                    kStandardColor7d,
//                                                                                                    kStandardColor7d,
//                                                                                                    kStandardColor4,
//                                                                                                    kStandardColor4a,
//                                                                                                    nil, nil,
//                                                                                                    kStandardColor10,
//                                                                                                    kStandardColor10,
//                                                                                                    kStandardColor10,
//                                                                                                    kStandardColor10,
//                                                                                                    nil, nil,
//                                                                                                    kStandardColor7d,
//                                                                                                    kStandardColor7d);
//    self.themeStyleDictionary[RCDataMigrationOKButton] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (kStandardColor6,
//                                                                                                 kStandardColor1,
//                                                                                                 nil, nil,
//                                                                                                 kStandardColor7d,
//                                                                                                 kStandardColor7d,
//                                                                                                 kStandardColor1,
//                                                                                                 kStandardColor1a,
//                                                                                                 nil, nil,
//                                                                                                 kStandardColor10,
//                                                                                                 kStandardColor10,
//                                                                                                 kStandardColor10,
//                                                                                                 kStandardColor10,
//                                                                                                 nil, nil,
//                                                                                                 kStandardColor7d,
//                                                                                                 kStandardColor7d);
//    self.themeStyleDictionary[RCDataMigrationSendLogsButton] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (kStandardColor6,
//                                                                                                       kStandardColor1,
//                                                                                                       nil, nil,
//                                                                                                       kStandardColor7d,
//                                                                                                       kStandardColor7d,
//                                                                                                       kStandardColor1,
//                                                                                                       kStandardColor1a,
//                                                                                                       nil, nil,
//                                                                                                       kStandardColor10,
//                                                                                                       kStandardColor10,
//                                                                                                       kStandardColor10,
//                                                                                                       kStandardColor10,
//                                                                                                       nil, nil,
//                                                                                                       kStandardColor7d,
//                                                                                                       kStandardColor7d);
//    self.themeStyleDictionary[RCDataMigrationProgressControl] = [RCProgressControlThemeStyle progressControlThemeStyleWithColor:kStandardColor1 failureColor:kStandardColor3];
//}
//
//- (void) configureThemeStyleInAppNotification;
//{
//    self.themeStyleDictionary[RCInAppNotificationImageViewDNDBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND ([(UIColor *)self.colorTable[@"3b"] colorWithAlphaComponent: 0.98], self.colorTable[@"10"]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewOfflineBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND ([(UIColor *)self.colorTable[@"3b"] colorWithAlphaComponent: 0.98], self.colorTable[@"10"]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewVoIPBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND ([(UIColor *)self.colorTable[@"3b"] colorWithAlphaComponent: 0.98], self.colorTable[@"10"]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewVoIPOnlyBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND ([(UIColor *)self.colorTable[@"3b"] colorWithAlphaComponent: 0.98], self.colorTable[@"10"]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewMessageBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"1"], self.colorTable[@"10"]);
//    self.themeStyleDictionary[RCInAppNotificationDNDLabelMessage] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], nil, RCUIRegularSystemFont(12));
//    self.themeStyleDictionary[RCInAppNotificationOfflineLabelMessage] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], nil, RCUIRegularSystemFont(12));
//    self.themeStyleDictionary[RCInAppNotificationVoIPLabelMessage] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], nil, RCUIRegularSystemFont(12));
//    self.themeStyleDictionary[RCInAppNotificationVoIPOnlyLabelMessage] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], nil, RCUIRegularSystemFont(12));
//    self.themeStyleDictionary[RCInAppNotificationLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"6"], nil, RCUIRegularSystemFont(17));
//    self.themeStyleDictionary[RCInAppNotificationLabelMessage] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"6a"], nil, RCUIRegularSystemFont(12));
//    
//    self.themeStyleDictionary[RCInAppNotificationImageViewOffline] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons offlineIconWithSize: 16 color: self.colorTable[@"3"]]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewDNDNoCalls] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons dndIconWithSize: 14 color: self.colorTable[@"3"]]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewDNDQueue] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons dndIconWithSize: 14 color: self.colorTable[@"2"]]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewVoIPUnavailable] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons noInternetIconWithSize: 19 color: self.colorTable[@"3"]]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewVoIPOnly] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons voipOnlyIconWithSize: 16 color: self.colorTable[@"3"]]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewVoIPFailed] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons noInternetIconWithSize: 19 color: self.colorTable[@"3"]]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewMessageText] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowTextIconWithSize: 20 color: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewMessageGroupText] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowGroupTextIconWithSize: 22 color: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewMessageFax] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowFaxIconWithSize: 22 color: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCInAppNotificationImageViewMessageVoicemail] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([RCUIAppAwesomeIcons hollowVoicemailIconWithSize: 22 color: self.colorTable[@"6"]]);
//}
//
//- (void) configureThemeStyleMyProfile;
//{
//    self.themeStyleDictionary[RCMyProfileLabelVersion] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], nil);
//    self.themeStyleDictionary[RCMyProfileLabelCopyright] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], nil);
//    self.themeStyleDictionary[RCMyProfileImageViewLogo] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE (@"RCSPLogo.png");
//    self.themeStyleDictionary[RCMyProfileImageViewBannerBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"7e"], self.colorTable[@"7b"]);
//    
//    self.themeStyleDictionary[RCMyProfileHeaderButtonPictureCircle] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7c"]);
//    self.themeStyleDictionary[RCMyProfileHeaderButtonPicture] = RCUI_BUTTON_THEMESTYLE_WITH_BACKGROUND ([RCUIAppAwesomeIcons hollowContactCircleRegularIconWithSize: 58 color: self.colorTable[@"7b"]],
//                                                                                                        [RCUIAppAwesomeIcons hollowContactCircleRegularIconWithSize: 58 color: self.colorTable[@"7c"]]);
//    
//    self.themeStyleDictionary[RCMyProfileHeaderLabelName] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(20));
//    self.themeStyleDictionary[RCMyProfileHeaderLabelMood] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCMyProfileHeaderButtonEdit] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons hollowPenIconWithSize: 14 color: self.colorTable[@"1"]],
//                                                                                               [RCUIAppAwesomeIcons hollowPenIconWithSize: 14 color: self.colorTable[@"1a"]]);
//    
//    self.themeStyleDictionary[RCMyProfileTableViewCellLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], RCUIRegularSystemFont(17));
//    self.themeStyleDictionary[RCMyProfileTableViewCellLabelDetail] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], RCUIRegularSystemFont(14));
//    
//    self.themeStyleDictionary[RCMyProfileImageViewApplicationSettings] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowSettingsIconWithSize: 24 color: self.colorTable[@"1"]],
//                                                                                                               [RCUIAppAwesomeIcons hollowSettingsIconWithSize: 24 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCMyProfileImageViewExtensionSettings] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowExtensionSettingIconWithSize: 25 color: self.colorTable[@"1"]],
//                                                                                                             [RCUIAppAwesomeIcons hollowExtensionSettingIconWithSize: 25 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCMyProfileImageViewPhoneSystem] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowPhonesystemIconWithSize: 25 color: self.colorTable[@"1"]],
//                                                                                                       [RCUIAppAwesomeIcons hollowPhonesystemIconWithSize: 25 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCMyProfileImageViewBillings] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowBillingIconWithSize: 24 color: self.colorTable[@"1"]],
//                                                                                                    [RCUIAppAwesomeIcons hollowBillingIconWithSize: 24 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCMyProfileImageViewBillingsEurope] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowBillingEuropeIconWithSize: 24 color: self.colorTable[@"1"]],
//                                                                                                          [RCUIAppAwesomeIcons hollowBillingEuropeIconWithSize: 24 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCMyProfileImageViewReports] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowReportsIconWithSize: 24 color: self.colorTable[@"1"]],
//                                                                                                   [RCUIAppAwesomeIcons hollowReportsIconWithSize: 24 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCMyProfileImageViewRolesNPermissions] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons rolesPermissionsIconWithSize: 24 color: self.colorTable[@"1"]],
//                                                                                                   [RCUIAppAwesomeIcons rolesPermissionsIconWithSize: 24 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCMyProfileImageViewAbout] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowInformationCircleIconWithSize: 24 color: self.colorTable[@"1"]],
//                                                                                                 [RCUIAppAwesomeIcons hollowInformationCircleIconWithSize: 24 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCMyProfileImageViewLogout] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_PARAM ([RCUIAppAwesomeIcons hollowLogoutIconWithSize: 25 color: self.colorTable[@"1"]],
//                                                                                                  [RCUIAppAwesomeIcons hollowLogoutIconWithSize: 25 color: self.colorTable[@"1"]]);
//    self.themeStyleDictionary[RCMyProfileTableViewCellSwitchToggle] = RCUI_SWITCH_THEMESTYLE_WITH_PARAM (self.colorTable[@"1"], self.colorTable[@"6"], self.colorTable[@"6"], self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCMyProfileTableViewCellSwitchToggleDisabled] = RCUI_SWITCH_THEMESTYLE_WITH_PARAM (self.colorTable[@"1a"], self.colorTable[@"6"], self.colorTable[@"6"], self.colorTable[@"7d"]);
//    
//    self.themeStyleDictionary[RCMyProfileTableViewCellImageViewAvailable] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage uiImageWithCircle: 7 fillColor: self.colorTable[@"4"]]);
//    self.themeStyleDictionary[RCMyProfileTableViewCellImageViewBusy] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage uiImageWithCircle: 7 fillColor: self.colorTable[@"3"]]);
//    self.themeStyleDictionary[RCMyProfileTableViewCellImageViewInvisible] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage uiImageWithCircle: 7 fillColor: self.colorTable[@"7b"]]);
//}
//
//- (void) configureThemeStyleMyProfileMoodMessage;
//{
//    self.themeStyleDictionary[RCMyProfileMoodMessageImageViewBackground] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"7e"], self.colorTable[@"7e"]);
//    self.themeStyleDictionary[RCMyProfileMoodMessageTextFieldMood] = RCUI_NUMBER_TEXTFIELD_THEMESTYLE_WITH_PARAM (self.colorTable[@"6"],
//                                                                                                                  self.colorTable[@"7b"], 1., 3.,
//                                                                                                                  self.colorTable[@"7"],
//                                                                                                                  RCUIRegularSystemFont(17),
//                                                                                                                  self.colorTable[@"7b"],
//                                                                                                                  self.colorTable[@"3"],
//                                                                                                                  RCUIRegularSystemFont(15));
//}
//
//- (void) configureThemeStyleMyProfilePresence;
//{
//    self.themeStyleDictionary[RCMyProfilePresenceImageViewHeader] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"7e"], self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCMyProfilePresenceLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], nil);
//    self.themeStyleDictionary[RCMyProfilePresenceButtonDone] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"7"], self.colorTable[@"7a"], self.colorTable[@"7d"], nil);
//    
//    self.themeStyleDictionary[RCMyProfilePresenceTableViewCellImageViewAvailable] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage uiImageWithCheckRadius: 13 fillColor: self.colorTable[@"4"] borderColor: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCMyProfilePresenceTableViewCellImageViewBusy] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage uiImageWithDeleteRadius: 13 fillColor: self.colorTable[@"3"] borderColor: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCMyProfilePresenceTableViewCellImageViewInvisible] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage uiImageWithDeleteRadius: 13 fillColor: self.colorTable[@"7b"] borderColor: self.colorTable[@"6"]]);
//    
//    self.themeStyleDictionary[RCMyProfileHeaderImageViewAvailable] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage uiImageWithCircle: 9 fillColor: self.colorTable[@"4"]  borderColor: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCMyProfileHeaderImageViewBusy] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage uiImageWithCircle: 9 fillColor: self.colorTable[@"3"]  borderColor: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCMyProfileHeaderImageViewInvisible] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage uiImageWithCircle: 9 fillColor: self.colorTable[@"7b"]  borderColor: self.colorTable[@"6"]]);
//    self.themeStyleDictionary[RCMainUIAvatarAvailable] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage uiImageWithBezierCircle: 5 fillColor: self.colorTable[@"4"]  borderColor: self.colorTable[@"1"] borderWidth: 1.]);
//    self.themeStyleDictionary[RCMainUIAvatarBusy] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage uiImageWithBezierCircle: 5 fillColor: self.colorTable[@"3"]  borderColor: self.colorTable[@"1"] borderWidth: 1.]);
//    self.themeStyleDictionary[RCMainUIAvatarInvisible] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE ([UIImage uiImageWithBezierCircle: 5 fillColor: self.colorTable[@"7b"]  borderColor: self.colorTable[@"1"] borderWidth: 1.]);
//}
//
//- (void) configureThemeStyleDropdown;
//{
//    self.themeStyleDictionary[RCDropdownImageViewSperatorLine] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_BACKGROUND (self.colorTable[@"10"], self.colorTable[@"7b"]);
//    self.themeStyleDictionary[RCDropdownButtonItem] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (self.colorTable[@"7"], self.colorTable[@"1"], self.colorTable[@"1"], self.colorTable[@"1"], nil, nil,
//                                                                                              nil, nil, nil, nil, nil, nil,
//                                                                                              nil, nil, nil, nil, nil, nil);
//    CGFloat size = (RCUIIsIPHONE4 () || RCUIIsIPHONE5 ()) ? 12 : 14;
//    self.themeStyleDictionary[RCDropdownButtonArrow] = RCUI_BUTTON_THEMESTYLE_WITH_ICON ([RCUIAppAwesomeIcons downArrowIconWithSize: size color: self.colorTable[@"6"]],
//                                                                                         [RCUIAppAwesomeIcons downArrowIconWithSize: size color: self.colorTable[@"6a"]]);
//}
//
//- (void) configureThemestyleDialingPlan
//{
//    self.themeStyleDictionary[RCDialingPlanDescription] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIRegularSystemFont(14));
//    self.themeStyleDictionary[RCDialingPlanTableViewCellLabelTitle] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7b"], RCUIIsIPAD() ? RCUIRegularSystemFont(17) : RCUILightSystemFont(16));
//    self.themeStyleDictionary[RCDialingPlanTableViewCellLabelDetail] = RCUI_LABEL_THEMESTYLE_WITH_TEXTCOLOR (self.colorTable[@"7"], RCUIIsIPAD() ? RCUIRegularSystemFont(17) : RCUILightSystemFont(16));
//    self.themeStyleDictionary[RCDialingPlanAreaCodeTextFieldDefault] = RCUI_TEXTFIELD_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7b"], RCUIRegularSystemFont(RCUIIsIPAD() ? 17 : 16));
//}
//
//- (void) configureThemeStyleSegmentedControl;
//{
//    self.themeStyleDictionary[RCCommonSegmentedControlDefault] = ({
//        RCUISegmentedControlThemeStyle *style = [[[RCUISegmentedControlThemeStyle alloc] init] autorelease];
//        style.backgroundNormal = self.colorTable[@"1"];
//        style.backgroundSelected = self.colorTable[@"1"];
//        style.backgroundHighlighted = self.colorTable[@"1a"];
//        style.backgroundSelectedHighlighted = self.colorTable[@"1a"];        
//        style.titleTextAttributesNormal = @{UITextAttributeTextColor: self.colorTable[@"1"]};
//        style.titleTextAttributesSelected = @{UITextAttributeTextColor: self.colorTable[@"6"]};
//        style.titleTextAttributesHighlighted = @{UITextAttributeTextColor: self.colorTable[@"1a"]};
//        style.titleTextAttributesSelectedHighlighted = @{UITextAttributeTextColor: self.colorTable[@"1a"]};
//        
//        style.tintColor = self.colorTable[@"1"];
//        style;
//
//    });
//}
//
///// Cloud contact Edit
//- (void) configureThemeStyleCloudContactEditView;
//{
//    self.themeStyleDictionary[RCCloudContactEditLabel] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7"], self.colorTable[@"7"], RCUIRegularSystemFont(17));
//    
//    self.themeStyleDictionary[RCCloudContactEditButtonDefault] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"1"], self.colorTable[@"1a"], nil, RCUIRegularSystemFont(15));
//    
//    self.themeStyleDictionary[RCCloudContactEditButtonDelete] = RCUI_BUTTON_THEMESTYLE_WITH_TITLE (self.colorTable[@"3"], self.colorTable[@"3a"], nil, RCUIRegularSystemFont(17));
//}
//
//- (void) configureThemeStylePersonalContactAccessView;
//{
//    self.themeStyleDictionary[RCPermissionLockIcon] = RCUI_IMAGEVIEW_THEMESTYLE_WITH_IMAGE([RCUIAppAwesomeIcons contactLockIconWithSize:95 color:self.colorTable[@"7b"]]);
//    
//    self.themeStyleDictionary[RCPermissionAccessButton] = RCUI_BUTTON_THEMESTYLE_WITH_TITLEBACKGROUND (self.colorTable[@"6"], self.colorTable[@"1"],
//                                                                                              self.colorTable[@"1"], self.colorTable[@"1a"]);
//    
//    self.themeStyleDictionary[RCPermissionAccessLabel] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], RCUIRegularSystemFont(14));
//    
//    self.themeStyleDictionary[RCPermissionInfoLabel] = RCUI_LABEL_THEMESTYLE_WITH_PARAM (self.colorTable[@"7b"], self.colorTable[@"7b"], RCUIRegularSystemFont(17));
//}
//
///// Calendar
//- (void) configureThemeStyleCalendarView;
//{
//    self.themeStyleDictionary[RCCalendarGlancePrimaryButton] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (nil,
//                                                                                                       nil,
//                                                                                                       nil, nil, nil, nil,
//                                                                                                       self.colorTable[@"1"],
//                                                                                                       self.colorTable[@"1a"],
//                                                                                                       nil, nil, nil, nil,
//                                                                                                       nil,
//                                                                                                       nil,
//                                                                                                       nil, nil, nil, nil);
//    self.themeStyleDictionary[RCCalendarGlanceSecondaryButton] = RCUI_BUTTON_THEMESTYLE_WITH_FULL_PARAM (nil,
//                                                                                                         nil,
//                                                                                                         nil, nil, nil, nil,
//                                                                                                         self.colorTable[@"4"],
//                                                                                                         self.colorTable[@"4a"],
//                                                                                                         nil, nil, nil, nil,
//                                                                                                         nil,
//                                                                                                         nil,
//                                                                                                         nil, nil, nil, nil);
//}

- (void) configureThemeStyleForBrand;
{}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////

- (void) dealloc;
{
    self.themeStyleDictionary   = nil;
    self.colorTable             = nil;
    self.fontTable              = nil;
    
    [super dealloc];
}

@end
