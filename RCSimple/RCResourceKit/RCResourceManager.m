//
//  RCResourceManager.mm
//  RCResourceKit
//
//  Created by Paul on 11/5/08.
//  Copyright 2008 DINS. All rights reserved.
//

#import "RCResourceManager.h"
#import <RCBase/RCVCSVersion.h>
#import <RCBase/RCBase.h>
#import <RCBase/RCSupplementaryMacros.h>
#import <RCBase/MMWormhole.h>
#import <Foundation/NSThread.h>
#import <Foundation/NSUserDefaults.h>
#import <Foundation/NSBundle.h>
#import <Foundation/NSArray.h>
#import <CoreFoundation/CFBundle.h>
#import <UIKit/UIDevice.h>

static RCResourceManager* g_lpResourceManager = nil;

#define RC_DEF_SUBSTITUTE_KEY( name ) \
	NSString* RC_STRING_CONST RC ## name ## SubstituteKey = @"<" #name ">"; RC_DEF_PREF_D( RCSP, name )

RC_DEF_SUBSTITUTE_KEY (BrandName); 
RC_DEF_SUBSTITUTE_KEY (BRANDNAME);
RC_DEF_SUBSTITUTE_KEY (ProgramName);
RC_DEF_SUBSTITUTE_KEY (ProgramName2); //Necessary in User Defaults
RC_DEF_SUBSTITUTE_KEY (ProgramShortName); //Necessary in User Defaults
RC_DEF_SUBSTITUTE_KEY (AboutProgramName);
RC_DEF_SUBSTITUTE_KEY (LongCompanyName); //Necessary in User Defaults
RC_DEF_SUBSTITUTE_KEY (ShortBrandName);
RC_DEF_SUBSTITUTE_KEY (MainBrandName); //Necessary in User Defaults
RC_DEF_SUBSTITUTE_KEY (LongVersion);
RC_DEF_SUBSTITUTE_KEY (LongBrandName);
RC_DEF_SUBSTITUTE_KEY (LONGBRANDNAME);
RC_DEF_SUBSTITUTE_KEY (CoBrandName);
RC_DEF_SUBSTITUTE_KEY (ProgramVersion);
RC_DEF_SUBSTITUTE_KEY (JenkinsBuildNumber);
RC_DEF_SUBSTITUTE_KEY (ProgramBuild);
RC_DEF_SUBSTITUTE_KEY (VCSVersion);
RC_DEF_SUBSTITUTE_KEY (Info911URLString);
RC_DEF_SUBSTITUTE_KEY (Number911);
RC_DEF_SUBSTITUTE_KEY (WebsiteURL);
RC_DEF_SUBSTITUTE_KEY (ServiceConferenceURLString);

#define RC_EMPTY_STRING   @"<Empty>"

#define RC_SELF RCResourceManager


@interface RC_SELF ()

@property (copy) NSString *latestBrandID;

@end

@implementation RC_SELF

- (id) init
{
  if( self = [ super init ] )
  {
    self.substitutionDictionary = RC_NEW( NSMutableDictionary );
    [ self fillDefaultSubstitutionsWithAccountBrandID: nil ];
  }
  
  return self;
}

+ (RCResourceManager*) currentResourceManager
{
  if( g_lpResourceManager == nil )
  {
    g_lpResourceManager = RC_NEW ( RCResourceManager );
    [ g_lpResourceManager retain ];
  }
  
  return g_lpResourceManager;
}

static
NSString *
RCStringFromDefaultsWithFallbackToKey (NSString *key)
{
	RC_V (defaults, [NSUserDefaults standardUserDefaults]);
	
	RC_V (existingString, [defaults stringForKey: key]);
	
	RC_V (string, RC_FIRST_NNIL (existingString, RC_STRING_WITH_FORMAT (@"<%@>", key)));
	
	return string;
}

static
NSString *
RCStringFromBrandedDefaultsWithFallbackToKey (NSString *key, NSString *brandID)
{
    RC_V (defaults, [NSUserDefaults standardUserDefaults]);
    NSString *brandKey = brandID ? brandID : [defaults stringForKey: @"RCPreferredBrandID"];
    NSDictionary *brandDefaults = [defaults valueForKey: brandKey];
    NSString *existingString = [brandDefaults valueForKey: key];
    
    RC_V (string, RC_FIRST_NNIL (existingString, RC_STRING_WITH_FORMAT (@"<%@>", key)));
    
    return string;
}

+ (BOOL)isCurrentLanguageEnglishUS
{
  RC_V (userDefaults, [NSUserDefaults standardUserDefaults]);
  RC_V( arrayLanguages, [ userDefaults objectForKey: @"AppleLanguages" ] );
  NSString* language = (NSString*)[ arrayLanguages objectAtIndex: 0 ];
  
  return ( [ language caseInsensitiveCompare: @"EN" ] == NSOrderedSame );
}

#pragma mark -

- (void) fillBrandSensitiveSubstituionWithBrandID: (NSString*)brandID
{
    self.latestBrandID = brandID;
    
    RC_V (websiteURLString, RCStringFromBrandedDefaultsWithFallbackToKey (RCSPWebsiteURLD, brandID));
    if (!websiteURLString || [websiteURLString length] == 0)
    {
        websiteURLString = @"<RCSPWebsiteURL>";
    }
    [self addSubstitutionString: RCWebsiteURLSubstituteKey byString: websiteURLString];
    
    RC_V (ServiceConferenceURLString, RCStringFromBrandedDefaultsWithFallbackToKey (RCSPServiceConferenceURLStringD, brandID));
    ServiceConferenceURLString = [self localizedStringForKey: ServiceConferenceURLString];
    [self addSubstitutionString: RCServiceConferenceURLStringSubstituteKey byString: ServiceConferenceURLString];
    
    RC_V (number911String, RCStringFromBrandedDefaultsWithFallbackToKey (RCSPNumber911D, brandID));
    [self addSubstitutionString: RCNumber911SubstituteKey byString: number911String];
}

- (void) fillBrandSensitiveSubstituionInMainThreadWithBrandID: (NSString*)brandID
{
    if ([NSThread isMainThread])
    {
        [self fillBrandSensitiveSubstituionWithBrandID: brandID];
    }
    else
    {
        [self performSelectorOnMainThread: @selector(fillBrandSensitiveSubstituionWithBrandID:) withObject: brandID waitUntilDone: NO];
    }
}

- (void) fillDefaultSubstitutionsWithAccountBrandID: (NSString*)brandID
{
    if (brandID)
    {
        self.latestBrandID = brandID;
    }
    
	[ self removeSubstitutions ];

	RC_V (defaults, [NSUserDefaults standardUserDefaults]);

	RC_V (shortBrandName, RCStringFromDefaultsWithFallbackToKey (RCSPShortBrandNameD));
    shortBrandName = [self localizedStringForKey: shortBrandName];
    
	RC_V (mainBrandName, RCStringFromDefaultsWithFallbackToKey (RCSPMainBrandNameD));
    mainBrandName = [self localizedStringForKey: mainBrandName];
    
	RC_V (origCoBrandName, [defaults stringForKey: RCSPCoBrandNameD]);
    origCoBrandName = [self localizedStringForKey: origCoBrandName];
    
	RC_V (origBrandName, [defaults stringForKey: RCSPBrandNameD]);
    origBrandName = [self localizedStringForKey: origBrandName];
    
	RC_V (longBrandName, RCStringFromDefaultsWithFallbackToKey (RCSPLongBrandNameD));
    longBrandName = [self localizedStringForKey: longBrandName];
    
	RC_V (coBrandName, RC_FIRST_NNIL (origCoBrandName, @""));
    RC_V (origJenkinsBuildNumber, RCJenkinsBuildNumber());
    RC_V (JenkinsBuildNumber, RC_FIRST_NNIL (origJenkinsBuildNumber, @""));
    
	RC_V (
		brandName,
		[origBrandName length]
			? origBrandName
			: ([coBrandName length]
				? RC_STRING_WITH_FORMAT (@"%@ %@", origCoBrandName, mainBrandName)
				: mainBrandName));
    
    RC_V (
          longVersion,
          RC_KCAST (
                    NSString,
                    RC_FIRST_NNIL (
                                   [[NSBundle mainBundle] objectForInfoDictionaryKey: @"RCBundleLongVersionString"],
                                   @"<LongVersion>")));

    [self addSubstitutionString: RCLongVersionSubstituteKey byString: longVersion];
    [self addSubstitutionString: RCJenkinsBuildNumberSubstituteKey byString: JenkinsBuildNumber];
	[self addSubstitutionString: RCShortBrandNameSubstituteKey byString: shortBrandName];
	[self addSubstitutionString: RCMainBrandNameSubstituteKey byString: mainBrandName];
	[self addSubstitutionString: RCCoBrandNameSubstituteKey byString: coBrandName];
	[self addSubstitutionString: RCBrandNameSubstituteKey byString: brandName];
	[self addSubstitutionString: RCBRANDNAMESubstituteKey byString: [brandName uppercaseString]];
	[self addSubstitutionString: RCLongBrandNameSubstituteKey byString: longBrandName];
    [self addSubstitutionString: RCLONGBRANDNAMESubstituteKey byString: [longBrandName uppercaseString]];
  
	RC_V (origProgramName, [defaults stringForKey: RCSPProgramNameD]);
    origProgramName = [self localizedStringForKey: origProgramName];
    
	RC_V (programName2, RCStringFromDefaultsWithFallbackToKey (RCSPProgramName2D));
    programName2 = [self localizedStringForKey: programName2];
    
 	RC_V (programShortName, RCStringFromDefaultsWithFallbackToKey (RCSPProgramShortNameD));
    programShortName = [self localizedStringForKey: programShortName];
    
	RC_V (origAboutProgramName, RCStringFromDefaultsWithFallbackToKey (RCSPAboutProgramNameD));
    origAboutProgramName = [self localizedStringForKey: origAboutProgramName];

	RC_V (
		programName,
		origProgramName.length
			? origProgramName
			: RC_STRING_WITH_FORMAT (@"%@ %@", brandName, programName2));
	
	RC_V (
		aboutProgramName,
		origAboutProgramName.length
			? origAboutProgramName
			: programName);
 
	[ self addSubstitutionString: RCProgramNameSubstituteKey byString: programName ];
	[ self addSubstitutionString: RCProgramName2SubstituteKey byString: programName2 ];
	[ self addSubstitutionString: RCProgramShortNameSubstituteKey byString: programShortName ];
	[ self addSubstitutionString: RCAboutProgramNameSubstituteKey byString: aboutProgramName ];
  
	RC_V (longCompanyName, RCStringFromDefaultsWithFallbackToKey (RCSPLongCompanyNameD));
	[ self addSubstitutionString: RCLongCompanyNameSubstituteKey byString: longCompanyName ];
  
	RC_V (
		versionString,
		RC_KCAST (
			NSString,
			RC_FIRST_NNIL (
				[[NSBundle mainBundle] objectForInfoDictionaryKey: RC_STRING_FROM_CF (kCFBundleVersionKey)],
				@"<Version>")));
  
	RC_V (
		shortVersionString,
		RC_KCAST (
			NSString,
			RC_FIRST_NNIL (
				[[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"],
				@"<ShortVersion>")));
  
	[ self addSubstitutionString: RCProgramVersionSubstituteKey byString: shortVersionString ];
	[ self addSubstitutionString: RCProgramBuildSubstituteKey byString: versionString ];

	[ self addSubstitutionString: RCVCSVersionSubstituteKey byString: RCVCSVersion () ];

	RC_V (info911URLString, RCStringFromDefaultsWithFallbackToKey (RCSPInfo911URLStringD));
	[ self addSubstitutionString: RCInfo911URLStringSubstituteKey byString: info911URLString ];
    
    if (self.latestBrandID)
    {
        [self fillBrandSensitiveSubstituionWithBrandID: self.latestBrandID];
    }
}

- (void)removeSubstitutions
{
  [ self.substitutionDictionary removeAllObjects ];
}

- (void) addSubstitutionString: (NSString*) source byString: (NSString*) replacedBy
{
    if (replacedBy)
  [ self.substitutionDictionary setObject: replacedBy forKey: source ];
}

- (NSString*)substituteString: (NSString*)source
{
    NSDictionary *subsDictionary = [NSDictionary dictionaryWithDictionary: self.substitutionDictionary];
    
    for( NSString* key in [ subsDictionary keyEnumerator ] )
    {
        NSString* replaceBy = [ subsDictionary objectForKey: key ];
        
        source = [ source stringByReplacingOccurrencesOfString: key withString: replaceBy ];
    }
    
    return source;
}

- (NSString*)substituteStringWithKey:(NSString *)key
{
    NSString *value = [self.substitutionDictionary valueForKey: key];
    
    if (value)
    {
        return [[value copy] autorelease];
    }
    
    return @"";
}

#pragma mark -

- (NSString *) localizedStringForKey: (NSString *)key table: (NSString *)tableName bundle: (NSBundle *)bundle;
{
  if( [ key length ] < 1 )
    return key;
  
  NSString* localizedStringValue = nil;
  
  if( [ self.substitutionDictionary objectForKey: key ] == nil )
  {
    localizedStringValue = [ bundle localizedStringForKey: key value: RC_EMPTY_STRING table: tableName ];
    
    if( [ localizedStringValue isEqualToString: RC_EMPTY_STRING ] )
    {
      localizedStringValue = nil;   
    }
  }
  
  if( localizedStringValue == nil )
    localizedStringValue = key;
  
  return [ self substituteString: localizedStringValue ];
}

- (NSString *) localizedStringForKey: (NSString *)key;
{
  return [self localizedStringForKey: key table: nil bundle: [self userBundle]];
}

- (NSString *) localizedStringViaDeviceLangForKey: (NSString *)key;
{
    NSString *deviceLanguage = [self deviceLanguage];
    
    if ([deviceLanguage hasPrefix: @"fr"])
    {
        deviceLanguage = @"fr-FR";
    }
    
    if ([deviceLanguage hasPrefix: @"de"])
    {
        deviceLanguage = @"de-DE";
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource: deviceLanguage ofType: @"lproj"];
    
    NSBundle *bundle = [NSBundle bundleWithPath: path];
    
    return [self localizedStringForKey: key table: nil bundle: bundle];
}

- (NSString *) localizedStringForKey: (NSString *)key inLanguage: (NSString *)language
{
    NSString *path = [[NSBundle mainBundle] pathForResource: language ofType: @"lproj"];
    return [self localizedStringForKey: key table: nil bundle: [NSBundle bundleWithPath: path]];
}

- (NSString*) loadFileToStringWithName: (NSString *)name ofType: (NSString*)type inBundle: (NSBundle *)bundle
{
  if( bundle == nil )
    bundle = [ NSBundle mainBundle ];
  
	RC_V( pathToHTML, [ bundle	pathForResource: name ofType: type ] );	
	RC_CHECK( pathToHTML );
	
	NSError *error;
	
	RC_V( htmlString, [ NSString stringWithContentsOfFile: pathToHTML encoding: NSUTF8StringEncoding error: &error] );
  return [ self substituteString: htmlString ];
}

- (NSString*) loadHTMLToStringWithName: (NSString *)name inBundle: (NSBundle *)bundle
{
  return [ self loadFileToStringWithName: name ofType: @"html" inBundle: bundle ];
}

- (NSString*) loadTextToStringWithName: (NSString *)name inBundle: (NSBundle *)bundle
{
  return [ self loadFileToStringWithName: name ofType: @"txt" inBundle: bundle ];
}

#pragma mark -

- (NSString *) deviceLanguage;
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey: @"AppleLanguages"];
    return (NSString *)[languages objectAtIndex: 0];
}

- (NSString *) appLanguage;
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *language = [defaults valueForKey: @"RCAppLanguage"];
    NSString *localizationLanguage = nil;
    
    BOOL useInHouseAppGroups = [[NSUserDefaults standardUserDefaults] boolForKey: @"RCSPShouldUseInHouseGroups"];
    NSString *appGroupId = useInHouseAppGroups ? [[NSUserDefaults standardUserDefaults] stringForKey: @"RCSPInHouseAppGroupKey"] : [[NSUserDefaults standardUserDefaults] stringForKey: @"RCSPAppGroupKey"];
    if (!appGroupId)
    {
        appGroupId = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"RCSPWatchAppGroupKey"];
    }
    MMWormhole *wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier: appGroupId
                                                                optionalDirectory: @"test"];
    
    localizationLanguage = [wormhole messageWithIdentifier:@"LocalizationLanguage"];
    
    if (!localizationLanguage)
    {
        [wormhole passMessageObject:language identifier:@"LocalizationLanguage"];
    }
    
    [wormhole autorelease];
    return localizationLanguage ? localizationLanguage : language;
}

- (void) setAppLanguage: (NSString *)language;
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue: language forKey: @"RCAppLanguage"];
    BOOL setupWormhole = [[NSUserDefaults standardUserDefaults] boolForKey: @"RCSPAreAppGroupsEnabled"];

    if (setupWormhole)
    {
        BOOL useInHouseAppGroups = [[NSUserDefaults standardUserDefaults] boolForKey: @"RCSPShouldUseInHouseGroups"];
        NSString *appGroupId = useInHouseAppGroups ? [[NSUserDefaults standardUserDefaults] stringForKey: @"RCSPInHouseAppGroupKey"] : [[NSUserDefaults standardUserDefaults] stringForKey: @"RCSPAppGroupKey"];
        MMWormhole *wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier: appGroupId
                                                                    optionalDirectory: @"test"];
        
        [wormhole passMessageObject:language identifier:@"LocalizationLanguage"];
        
        [wormhole autorelease];
    }
    [defaults synchronize];
    
    [self fillDefaultSubstitutionsWithAccountBrandID: nil];
}

- (NSBundle *) userBundle;
{
    NSString *path = [[NSBundle mainBundle] pathForResource: [self appLanguage] ofType: @"lproj"];
    return [NSBundle bundleWithPath: path];
}

- (NSBundle *) userBundleOfBrand: (NSString*)brandID subPath: (NSString*)subPath
{
    NSString *inDirectory;
    
    if (subPath && [subPath length] > 0)
    {
        inDirectory = [NSString stringWithFormat: @"%@/%@", brandID, subPath];
    }
    else
    {
        inDirectory = brandID;
    }
    
    NSString *path = [NSString stringWithFormat: @"%@/%@", [[NSBundle mainBundle] bundlePath], inDirectory];
    
    return [NSBundle bundleWithPath: path];
}

- (NSBundle *) userLocalizedBundleOfBrand: (NSString*)brandID subPath: (NSString*)subPath
{
    NSString *inDirectory;
    
    if (subPath && [subPath length] > 0)
    {
        inDirectory = [NSString stringWithFormat: @"%@/%@", brandID, subPath];
    }
    else
    {
        inDirectory = brandID;
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource: [self appLanguage]
                                                     ofType: @"lproj"
                                                inDirectory: inDirectory];
    
    return [NSBundle bundleWithPath: path];
}

#pragma mark -

RC_PP_SELF_SYNTHESIZE_AND_DEALLOC;

@end

#pragma mark -

void RCRemoveAllStringSubstitutions( void )
{
  [ [ RCResourceManager currentResourceManager ] removeSubstitutions ];
}

void RCAddStringSubstitution( NSString* source, NSString* replacedBy)
{
  [ [ RCResourceManager currentResourceManager ]  addSubstitutionString: source byString: replacedBy ];
}

NSString* RCSubstituteString( NSString* source )
{
  return [ [ RCResourceManager currentResourceManager ] substituteString: source ];
}

NSString* RCLoadHTMLStringFromLocalizedBundle( NSString* name )
{
    NSString *localizedString = [ [ RCResourceManager currentResourceManager ] loadHTMLToStringWithName: name inBundle: [[RCResourceManager currentResourceManager] userBundle] ];
    if (localizedString == nil)
    {
        localizedString = [ [ RCResourceManager currentResourceManager ] loadHTMLToStringWithName: name inBundle: nil ];
    }
    return localizedString;
}

NSString* RCLoadHTMLStringFromBrandLocalizedBundle(NSString* brandID, NSString* name)
{
    RCResourceManager *resourceManager = [RCResourceManager currentResourceManager];
    NSString *localizedString = [resourceManager loadHTMLToStringWithName: name
                                                                 inBundle: [resourceManager userLocalizedBundleOfBrand: brandID
                                                                                                               subPath: @"Localizations"]];
    return localizedString;
}

NSString*
RCLoadTXTStringFromMainBundle (NSString *name)
{
	return [[RCResourceManager currentResourceManager] loadTextToStringWithName: name inBundle: nil];
}
