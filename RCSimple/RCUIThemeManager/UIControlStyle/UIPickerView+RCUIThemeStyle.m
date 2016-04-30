//
//  UIPickerView+RCUIThemeStyle.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/28/14.
//
//

#import "UIPickerView+RCUIThemeStyle.h"
#import "UIView+RCUIThemeStyle.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIPickerView (RCUIThemeStyle)

+ (id) uiPickerViewWithThemeStyle: (RCUIPickerViewThemeStyle *)themeStyle frame: (CGRect)frame;
{
    UIPickerView *pickerView = [[[UIPickerView alloc] initWithFrame: frame] autorelease];
    [pickerView uiApplyThemeStyle: themeStyle];
    return pickerView;
}

+ (id) uiPickerViewWithThemeStyle: (RCUIPickerViewThemeStyle *)themeStyle;
{
    return [UIPickerView uiPickerViewWithThemeStyle: themeStyle frame: CGRectZero];
}

- (void) uiApplyThemeStyle: (RCUIPickerViewThemeStyle *)themeStyle;
{
    if ([themeStyle.style isKindOfClass: [RCUIPickerViewThemeStyle class]])
    {
        [self uiApplyThemeStyle: (RCUIPickerViewThemeStyle *)(themeStyle.style)];
    }
    else
    {
        [super uiApplyThemeStyle: themeStyle];
        
        if (themeStyle.background)
        {
            self.layer.backgroundColor = [RCUICommonThemeStyle convertIDObjectToColor: themeStyle.background].CGColor;
        }
    }
}

@end
