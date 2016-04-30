//
//  RCUIThemeStyle.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/25/14.
//
//

#import "RCUIAppAwesomeIcons.h"
#import "RCUIThemeStyleDefined.h"
#import <Foundation/Foundation.h>

@protocol RCUIThemeStyle <NSObject>

- (RCUINavigationBarThemeStyle *) navigationBarThemeWithStyleName: (NSString *)name;
- (RCUIToolBarThemeStyle *) toolBarThemeWithStyleName: (NSString *)name;
- (RCUIBarButtonItemThemeStyle *) barButtonItemThemeWithStyleName: (NSString *)name;
- (RCUITabBarThemeStyle *) tabBarThemeWithStyleName: (NSString *)name;
- (RCUITabBarItemThemeStyle *) tabBarItemThemeWithStyleName: (NSString *)name;
- (RCUISearchBarThemeStyle *) searchBarThemeWithStyleName: (NSString *)name;
- (RCUIViewThemeStyle *) viewThemeWithStyleName: (NSString *)name;
- (RCUIButtonThemeStyle *) buttonThemeWithStyleName: (NSString *)name;
- (RCUIBadgeThemeStyle *) badgeThemeWithStyleName: (NSString *)name;
- (RCUITextFieldThemeStyle *) textFieldThemeWithStyleName: (NSString *)name;
- (RCUINumberTextFieldThemeStyle *) numberTextFieldThemeWithStyleName: (NSString *)name;
- (RCUILabelThemeStyle *) labelThemeWithStyleName: (NSString *)name;
- (RCUITextViewThemeStyle *) textViewThemeWithStyleName: (NSString *)name;
- (RCUISegmentedControlThemeStyle *) segmentedControlThemeWithStyleName: (NSString *)name;
- (RCUISliderThemeStyle *) sliderThemeWithStyleName: (NSString *)name;
- (RCUISwitchThemeStyle *) switchThemeWithStyleName: (NSString *)name;
- (RCUIActivityIndicatorViewThemeStyle *) activityIndicatorViewThemeWithStyleName: (NSString *)name;
- (RCUIProgressViewThemeStyle *) progressViewThemeWithStyleName: (NSString *)name;
- (RCUIStepperThemeStyle *) stepperThemeWithStyleName: (NSString *)name;
- (RCUITableViewThemeStyle *) tableViewThemeWithStyleName: (NSString *)name;
- (RCUITableViewCellThemeStyle *) tableViewCellThemeWithStyleName: (NSString *)name;
- (RCUIPickerViewThemeStyle *) pickerViewThemeWithStyleName: (NSString *)name;
- (RCUIDatePickerThemeStyle *) datePickerThemeWithStyleName: (NSString *)name;
- (RCUIWebViewThemeStyle *) webViewThemeWithStyleName: (NSString *)name;
- (RCUIPopoverBackgroundViewThemeStyle *) popoverBackgroundViewThemeWithStyleName: (NSString *)name;
- (RCUIImageViewThemeStyle *) imageViewThemeWithStyleName: (NSString *)name;
- (RCUIFilterItemThemeStyle *) filterItemThemeWithStyleName: (NSString *)name;
- (RCUIMenuIndicatorThemeStyle *) menuIndicatorThemeWithStyleName: (NSString *)name;
- (RCUIPageControlThemeStyle *) pageControlThemeWithStyleName: (NSString *)name;
- (RCProgressControlThemeStyle *)progressControlThemeWithStyleName:(NSString *)name;

@end



@interface RCUIThemeStyle : NSObject <RCUIThemeStyle>

@property (nonatomic, retain) NSMutableDictionary    *themeStyleDictionary;
@property (nonatomic, retain, readonly) NSDictionary *colorTable;
@property (nonatomic, retain, readonly) NSDictionary *fontTable;

- (NSDictionary *) generateColorTable;
- (NSDictionary *) generateFontTable;
- (void) configureThemeStyleDictionary;

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) configureThemeStyleNavigationBar;
- (void) configureThemeStylenNavigationBarButtonItem;
- (void) configureThemeStyleSearchBar;
- (void) configureThemeStyleLaunchBar;
- (void) configureThemeStyleEditBar;
- (void) configureThemeStyleFilterBar;
- (void) configureThemeStyleMenuIndicator;
- (void) configureThemeStyleBadge;
- (void) configureThemeStyleOffline;
- (void) configureThemeStyleDND;
- (void) configureThemeStyleButton;
- (void) configureThemeStyleView;
- (void) configureThemeStyleSlider;
- (void) configureThemeStyleProgressView;
- (void) configureThemeStyleLabel;
- (void) configureThemeStyleImageView;
- (void) configureThemeStyleTableView;
- (void) configureThemeStyleTableViewCell;
- (void) configureThemeStyleRefreshView;
- (void) configureThemeStyleMeeting;
- (void) configureThemeStyleConference;
- (void) configureThemeStyleToastMessage;
- (void) configureThemeStyleAssetsPicker;
- (void) configureThemeStyleRingoutMode;
- (void) configureThemeStyleSettingsCallerID;
- (void) configureThemeStylePopover;
- (void) configureThemeStylePresence;
- (void) configureThemeStyleVoiceMail;
- (void) configureThemeStylePickerView;
- (void) configureThemeStyleToolBar;
- (void) configureThemeStyleTextField;
- (void) configureThemeStyleEmbeddedBrowser;
- (void) configureThemeStyleSMS;
- (void) configureThemeStyleLogin;
- (void) configureThemeStyleCloudDownload;
- (void) configureThemeStyleGroupMessagingTip;
- (void) configureThemeStyleIntroduction;
- (void) configureThemeStyleLoading;
- (void) configureThemeStyleReports;
- (void) configureThemeStyleDataMigration;
- (void) configureThemeStyleInAppNotification;
- (void) configureThemeStyleMyProfile;
- (void) configureThemeStyleMyProfileMoodMessage;
- (void) configureThemeStyleMyProfilePresence;
- (void) configureThemeStyleDropdown;
- (void) configureThemestyleDialingPlan;
- (void) configureThemeStyleSegmentedControl;
////////////////////////////////////////////////////////////////////////////////////////////////////
- (void) configureThemeStyleForBrand;
////////////////////////////////////////////////////////////////////////////////////////////////////

@end
