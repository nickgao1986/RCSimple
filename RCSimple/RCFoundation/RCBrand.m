//
//  RCBrand.m
//  RCFoundation
//
//  Created by steven.zhuang on 3/31/15.
//
//


#import "RCBrand.h"
//#import <RCFoundation/RCAppDefaults.h>
//#import <RCResourceKit/RCResourceManager.h>

static NSMutableDictionary *__brandIDDictionary = nil;
static NSMutableDictionary *__brandNameDictionary = nil;

@implementation RCBrand

+ (void) initBrandIDDictionary
{
    __brandIDDictionary = [[NSMutableDictionary alloc] init];
    [__brandIDDictionary setObject: [NSNumber numberWithInteger: RCBrandTypeRingCentral]          forKey: @"1210"];
    [__brandIDDictionary setObject: [NSNumber numberWithInteger: RCBrandTypeATT]                  forKey: @"3410"];
    [__brandIDDictionary setObject: [NSNumber numberWithInteger: RCBrandTypeATT]                  forKey: @"3420"];
    [__brandIDDictionary setObject: [NSNumber numberWithInteger: RCBrandTypeCanada]               forKey: @"3610"];
    [__brandIDDictionary setObject: [NSNumber numberWithInteger: RCBrandTypeUK]                   forKey: @"3710"];
    [__brandIDDictionary setObject: [NSNumber numberWithInteger: RCBrandTypeUK]                   forKey: @"3711"];
    [__brandIDDictionary setObject: [NSNumber numberWithInteger: RCBrandTypeUK]                   forKey: @"3712"];
    [__brandIDDictionary setObject: [NSNumber numberWithInteger: RCBrandTypeUK]                   forKey: @"3713"];
    [__brandIDDictionary setObject: [NSNumber numberWithInteger: RCBrandTypeTelus]                forKey: @"7310"];
    [__brandIDDictionary setObject: [NSNumber numberWithInteger: RCBrandTypeTMobile]              forKey: @"8000"];
    [__brandIDDictionary setObject: [NSNumber numberWithInteger: RCBrandTypeBT]                   forKey: @"7710"];
}

+ (void) initBrandNameDictionary
{
    __brandNameDictionary = [[NSMutableDictionary alloc] init];
//    [__brandNameDictionary setObject: RCLocalizedString (@"RingCentral", )                          forKey: @"1210"];
//    [__brandNameDictionary setObject: RCLocalizedString (@"RingCentral Office@Hand from AT&T", )    forKey: @"3410"];
//    [__brandNameDictionary setObject: RCLocalizedString (@"RingCentral Office@Hand from AT&T", )    forKey: @"3420"];
//    [__brandNameDictionary setObject: RCLocalizedString (@"RingCentral", )                          forKey: @"3610"];
//    [__brandNameDictionary setObject: RCLocalizedString (@"RingCentral EU", )                       forKey: @"3710"];
//    [__brandNameDictionary setObject: RCLocalizedString (@"RingCentral EU", )                       forKey: @"3711"];
//    [__brandNameDictionary setObject: RCLocalizedString (@"RingCentral EU", )                       forKey: @"3712"];
//    [__brandNameDictionary setObject: RCLocalizedString (@"RingCentral EU", )                       forKey: @"3713"];
//    [__brandNameDictionary setObject: RCLocalizedString (@"TELUS Business Connect™", )              forKey: @"7310"];
//    [__brandNameDictionary setObject: RCLocalizedString (@"T-Mobile™", )                            forKey: @"8000"];
//    [__brandNameDictionary setObject: RCLocalizedString (@"BT Cloud Phone", )                       forKey: @"7710"];
}

+ (NSString*) aggregatedBrandID: (NSString*)brandID
{
    NSString *newBrandID;
    NSInteger intgerBrandID = brandID ? [brandID integerValue] : 0;
    
    switch (intgerBrandID)
    {
        case 3410:
            newBrandID = @"3420";
            break;
            
        case 3711:
        case 3712:
        case 3713:
            newBrandID = @"3710";
            
        default:
            newBrandID = brandID;
            break;
    }
    
    return newBrandID;
}

+ (NSString*) aggregatedBrandIDMergeRCCA: (NSString*)brandID
{
    NSString *newBrandID = [self aggregatedBrandID: brandID];
    
    return newBrandID;
}

+ (void) initialize;
{
    if (self != [RCBrand class])
    {
        return;
    }
}

+ (NSArray*) allPreferredBrandID
{
    //Caution: Enumerate all supported preferred brandID here.
    return @[@"1210",@"3610", @"3420", @"3710", @"7310", @"7710", @"8000"];
}

+ (NSArray*) availablePreferredBrandArray
{
    NSMutableArray *brandArray = [[[NSMutableArray alloc] init] autorelease];
    
    for (NSString *brandID in [self allPreferredBrandID])
    {
        if ([[NSUserDefaults standardUserDefaults] objectForKey: brandID])
        {
            [brandArray addObject: brandID];
        }
    }
    
    return brandArray;
}

+ (NSString*) targetBrandID;
{
    return [[NSUserDefaults standardUserDefaults] objectForKey: @"RCSPBrandID"];
}

+ (RCBrandType) BrandType: (NSString*)brandID;
{
    if (!__brandIDDictionary)
    {
        [self initBrandIDDictionary];
    }
    
    NSNumber *brandType = (NSNumber *)[__brandIDDictionary objectForKey: brandID];
    
    if (brandType)
    {
        return (RCBrandType)[brandType integerValue];
    }
    
    return RCBrandTypeUnknown;
}

+ (NSString *) BrandName: (NSString*)brandID;
{
    if (!__brandNameDictionary)
    {
        [self initBrandNameDictionary];
    }
    
    NSString *brandName = (NSString *)[__brandNameDictionary objectForKey: brandID];
    return brandName ? brandName : @"";
}

+ (BOOL) isRingCentralTargetBrand;
{
    return ([RCBrand BrandType: [self targetBrandID]] == RCBrandTypeRingCentral);
}

+ (BOOL) isATTTargetBrand;
{
    return ([RCBrand BrandType: [self targetBrandID]] == RCBrandTypeATT);
}

+ (BOOL) isUKTargetBrand;
{
    return ([RCBrand BrandType: [self targetBrandID]] == RCBrandTypeUK);
}

+ (BOOL) isCanadaTargetBrand;
{
    return ([RCBrand BrandType: [self targetBrandID]] == RCBrandTypeCanada);
}

+ (BOOL) isTelusTargetBrand;
{
    return ([RCBrand BrandType: [self targetBrandID]] == RCBrandTypeTelus);
}

+ (BOOL) isTMobileTargetBrand;
{
    return ([RCBrand BrandType: [self targetBrandID]] == RCBrandTypeTMobile);
}

+ (BOOL) isBTTargetBrand;
{
    return ([RCBrand BrandType: [self targetBrandID]] == RCBrandTypeBT);
}

+ (NSString *) schemeNameByBrandID: (NSString *)brandID
{
    NSDictionary *localBrandInfo = [[NSUserDefaults standardUserDefaults] objectForKey: @"RCLocalBrandInfo"];
    
    return localBrandInfo[brandID][@"Scheme"];
}

+ (NSString*) iTunesAppIDByBrandID: (NSString*)brandID
{
    NSDictionary *localBrandInfo = [[NSUserDefaults standardUserDefaults] objectForKey: @"RCLocalBrandInfo"];
    
    return localBrandInfo[brandID][@"AppID"];
}

+ (NSString*) iTunesAppCountryCodeByBrandID: (NSString*)brandID
{
    NSDictionary *localBrandInfo = [[NSUserDefaults standardUserDefaults] objectForKey: @"RCLocalBrandInfo"];
    
    return localBrandInfo[brandID][@"AppCountryCode"];
}

@end





