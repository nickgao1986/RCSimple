//
//  RCBrand.h
//  RCFoundation
//
//  Created by steven.zhuang on 3/31/15.
//
//


#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, RCBrandType)
{
    RCBrandTypeUnknown,
    RCBrandTypeRingCentral,
    RCBrandTypeATT,
    RCBrandTypeUK,
    RCBrandTypeCanada,
    RCBrandTypeTelus,
    RCBrandTypeTMobile,
    RCBrandTypeBT,
};


@interface RCBrand : NSObject

+ (NSString*) aggregatedBrandID: (NSString*)brandID;
+ (NSString*) aggregatedBrandIDMergeRCCA: (NSString*)brandID;
+ (NSArray*) allPreferredBrandID;
+ (NSArray*) availablePreferredBrandArray;

+ (NSString*) targetBrandID;
+ (RCBrandType) BrandType: (NSString*)brandID;
+ (NSString *) BrandName: (NSString*)brandID;
+ (BOOL) isRingCentralTargetBrand;
+ (BOOL) isATTTargetBrand;
+ (BOOL) isUKTargetBrand;
+ (BOOL) isCanadaTargetBrand;
+ (BOOL) isTelusTargetBrand;
+ (BOOL) isTMobileTargetBrand;
+ (BOOL) isBTTargetBrand;

+ (NSString*) iTunesAppIDByBrandID: (NSString*)brandID;
+ (NSString*) iTunesAppCountryCodeByBrandID: (NSString*)brandID;
+ (NSString *) schemeNameByBrandID: (NSString *)brandID;

@end





