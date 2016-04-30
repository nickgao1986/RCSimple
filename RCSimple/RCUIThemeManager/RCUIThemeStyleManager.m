//
//  RCUIThemeStyleManager.m
//  RCUIKit
//
//  Created by Kingle.Zhuang on 3/11/14.
//
//

#import "RCUIThemeStyleManager.h"
#import "RCUIRingCentralThemeStyle.h"
//#import <RCUIKit/RCUIATTThemeStyle.h>
//#import <RCUIKit/RCUITelusThemeStyle.h>
//#import <RCUIKit/RCUITMobileThemeStyle.h>
//#import <RCUIKit/RCUIBTThemeStyle.h>

@interface RCUIThemeStyleManager ()
@property (nonatomic, retain) id<RCUIThemeStyle> themeStyle;
@end

@implementation RCUIThemeStyleManager
@synthesize themeStyle = _themeStyle;

+ (RCUIThemeStyleManager *) sharedThemeStyleManager;
{
    static RCUIThemeStyleManager *sharedThemeStyleManager = nil;
    
    if (sharedThemeStyleManager == nil)
    {
        sharedThemeStyleManager = [[super allocWithZone: NULL] init];
    }
    
    return sharedThemeStyleManager;
}

+ (id) allocWithZone: (NSZone *)zone;
{
    return [self sharedThemeStyleManager];
}

- (id) init;
{
    self = [super init];
    
    if (self)
    {}
    
    return self;
}

- (id) copyWithZone: (NSZone *)zone;
{
	return self;
}

- (id) retain;
{
	return self;
}

- (NSUInteger) retainCount;
{
	return NSUIntegerMax;
}

- (oneway void) release;
{}

- (id) autorelease;
{
	return self;
}

- (id<RCUIThemeStyle>) themeStyle;
{
    return _themeStyle;
}

- (void) setThemeStyle: (id<RCUIThemeStyle>)themeStyle;
{
    if (_themeStyle != themeStyle)
    {
        [_themeStyle release];
        _themeStyle = [themeStyle retain];
    }
}

- (id<RCUIThemeStyle>) generatedThemeStyle: (RCUIThemeStyleType)type;
{
    switch (type)
    {
//    case RCUIThemeStyleTypeATT: return [[[RCUIATTThemeStyle alloc] init] autorelease];
//    case RCUIThemeStyleTypeTelus: return [[[RCUITelusThemeStyle alloc] init] autorelease];
//    case RCUIThemeStyleTypeTMobile: return [[[RCUITMobileThemeStyle alloc] init] autorelease];
//    case RCUIThemeStyleTypeRingCentralUK: return [[[RCUIRingCentralThemeStyle alloc] init] autorelease];
//    case RCUIThemeStyleTypeRingCentralCanada: return [[[RCUIRingCentralThemeStyle alloc] init] autorelease];
//    case RCUIThemeStyleTypeBT: return [[[RCUIBTThemeStyle alloc] init] autorelease];
    default: return [[[RCUIRingCentralThemeStyle alloc] init] autorelease];
    }
    
    return [[[RCUIRingCentralThemeStyle alloc] init] autorelease];
}

@end

RCUIThemeStyleType RCUIConvertBrandTypeToThemeStyleType (RCBrandType brandType)
{
    switch (brandType)
    {
//    case RCBrandTypeATT:          return RCUIThemeStyleTypeATT;
//    case RCBrandTypeTelus:        return RCUIThemeStyleTypeTelus;
//    case RCBrandTypeTMobile:      return RCUIThemeStyleTypeTMobile;
//    case RCBrandTypeUK:           return RCUIThemeStyleTypeRingCentralUK;
//    case RCBrandTypeCanada:       return RCUIThemeStyleTypeRingCentralCanada;
//    case RCBrandTypeBT:           return RCUIThemeStyleTypeBT;
    default:                      return RCUIThemeStyleTypeRingCentral;
    }
    
    return RCUIThemeStyleTypeRingCentral;
}



