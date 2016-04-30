//
//  UIDatePicker+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UIDatePicker+RCUIThemeStyle.h"
#import "UIView+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIDatePicker (RCUIThemeStyle)

+ (id) uiDatePickerWithThemeStyle: (RCUIDatePickerThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UIDatePicker *datePicker = [[[UIDatePicker alloc] initWithFrame: frame] autorelease];
    [datePicker uiApplyThemeStyle: themeStyle];
    return datePicker;
}

+ (id) uiDatePickerWithThemeStyle: (RCUIDatePickerThemeStyle *)themeStyle;
{
    return [UIDatePicker uiDatePickerWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUIDatePickerThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIDatePickerThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIDatePickerThemeStyle *)(themeStyle.style)];
    }
    else
    {
        [super uiApplyThemeStyle: themeStyle];
    }
}

@end
