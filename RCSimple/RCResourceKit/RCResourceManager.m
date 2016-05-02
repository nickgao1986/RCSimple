//
//  RCResourceManager.mm
//  RCResourceKit
//
//  Created by Paul on 11/5/08.
//  Copyright 2008 DINS. All rights reserved.
//

#import "RCResourceManager.h"
#import <RCBase/RCVCSVersion.h>

#import <CoreFoundation/CFBundle.h>
#import <UIKit/UIDevice.h>

static RCResourceManager* g_lpResourceManager = nil;

#define RC_DEF_SUBSTITUTE_KEY( name ) \
	NSString* RC_STRING_CONST RC ## name ## SubstituteKey = @"<" #name ">"; RC_DEF_PREF_D( RCSP, name )



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
