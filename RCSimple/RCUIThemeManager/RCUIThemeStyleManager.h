//
//  RCUIThemeStyleManager.h
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/11/14.
//
//
#import "RCExtern.h"
#import "RCUIThemeStyle.h"
#import "RCBrand.h"
#import <Foundation/Foundation.h>

#define RCUI_THEME_STYLE()      [[RCUIThemeStyleManager sharedThemeStyleManager] themeStyle]

typedef NS_ENUM (NSInteger, RCUIThemeStyleType)
{
    RCUIThemeStyleTypeRingCentral,
    RCUIThemeStyleTypeATT,
    RCUIThemeStyleTypeTelus,
    RCUIThemeStyleTypeTMobile,
    RCUIThemeStyleTypeRingCentralUK,
    RCUIThemeStyleTypeRingCentralCanada,
    RCUIThemeStyleTypeBT,
};

@interface RCUIThemeStyleManager : NSObject

+ (RCUIThemeStyleManager *) sharedThemeStyleManager;

- (id<RCUIThemeStyle>) generatedThemeStyle: (RCUIThemeStyleType)type;
- (id<RCUIThemeStyle>) themeStyle;
- (void) setThemeStyle: (id<RCUIThemeStyle>)themeStyle;

@end

RC_EXTERN RCUIThemeStyleType RCUIConvertBrandTypeToThemeStyleType (RCBrandType brandType);

