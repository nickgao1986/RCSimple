//
//  RCResourceManager.h
//  RCResourceKit
//
//  Created by Paul on 11/5/08.
//  Copyright 2008 DINS. All rights reserved.
//

#import <RCBase/RCNSStringDeclarations.h>
#import <RCBase/RCPropMacros.h>
#import <Foundation/NSObject.h>
#import <Foundation/NSBundle.h>

#define RC_DECL_SUBSTITUTE_KEY( name ) \
    RC_DECL_STRING_SUF_PREF( SubstituteKey, RC, name )

RC_DECL_SUBSTITUTE_KEY (BrandName);
RC_DECL_SUBSTITUTE_KEY (BRANDNAME);
RC_DECL_SUBSTITUTE_KEY (ProgramName);
RC_DECL_SUBSTITUTE_KEY (ProgramName2);
RC_DECL_SUBSTITUTE_KEY (ProgramShortName);
RC_DECL_SUBSTITUTE_KEY (AboutProgramName);
RC_DECL_SUBSTITUTE_KEY (LongCompanyName);
RC_DECL_SUBSTITUTE_KEY (ShortBrandName);
RC_DECL_SUBSTITUTE_KEY (LongVersion);
RC_DECL_SUBSTITUTE_KEY (LongBrandName);
RC_DECL_SUBSTITUTE_KEY (LONGBRANDNAME);
RC_DECL_SUBSTITUTE_KEY (MainBrandName);
RC_DECL_SUBSTITUTE_KEY (CoBrandName);
RC_DECL_SUBSTITUTE_KEY (ProgramVersion);
RC_DECL_SUBSTITUTE_KEY (JenkinsBuildNumber);
RC_DECL_SUBSTITUTE_KEY (ProgramBuild);
RC_DECL_SUBSTITUTE_KEY (Info911URLString);
RC_DECL_SUBSTITUTE_KEY (Number911);
RC_DECL_SUBSTITUTE_KEY (WebsiteURL);
RC_DECL_SUBSTITUTE_KEY (ServiceConferenceURLString);
RC_DECL_SUBSTITUTE_KEY (VCSVersion);

@class NSMutableDictionary;

#define RCResourceManagerF \
  ((substitutionDictionary) ((nonatomic, retain)) ((NSMutableDictionary*))) 

@interface RCResourceManager : NSObject {

  RC_PP_PROP_IVARS( RCResourceManagerF );
}

RC_PP_PROPS( RCResourceManagerF );

+ (RCResourceManager*) currentResourceManager;

+ (BOOL) isCurrentLanguageEnglishUS;

- (void) fillBrandSensitiveSubstituionWithBrandID: (NSString*)brandID;
- (void) fillBrandSensitiveSubstituionInMainThreadWithBrandID: (NSString*)brandID;
- (void) fillDefaultSubstitutionsWithAccountBrandID: (NSString*)brandID;
- (void) removeSubstitutions;
- (void) addSubstitutionString: (NSString*) source byString: (NSString*) replacedBy;

- (NSString*) substituteString: (NSString*)source;
- (NSString*) substituteStringWithKey: (NSString*)key;
- (NSString *) localizedStringViaDeviceLangForKey: (NSString *)key;
- (NSString*) localizedStringForKey: (NSString*) string;
- (NSString *) localizedStringForKey: (NSString *)key inLanguage: (NSString *)language;
- (NSString *) localizedStringForKey: (NSString *)key table: (NSString *)tableName bundle: (NSBundle *)bundle;
- (NSString*) loadFileToStringWithName: (NSString *)name ofType: (NSString*)type inBundle: (NSBundle *)bundle;
- (NSString*) loadHTMLToStringWithName: (NSString *)name inBundle: (NSBundle *)bundle;
- (NSString*) loadTextToStringWithName: (NSString *)name inBundle: (NSBundle *)bundle;

- (NSString *) deviceLanguage;
- (NSString *) appLanguage;
- (void) setAppLanguage: (NSString *)language;
- (NSBundle *) userBundle;
- (NSBundle *) userBundleOfBrand: (NSString*)brandID subPath: (NSString*)subPath;
- (NSBundle *) userLocalizedBundleOfBrand: (NSString*)brandID subPath: (NSString*)subPath;

@end

RC_EXTERN void RCRemoveAllStringSubstitutions( void );
RC_EXTERN void RCAddStringSubstitution( NSString* source, NSString* replacedBy);
RC_EXTERN NSString* RCLocalizedStringWrapper( NSString* source );
RC_EXTERN NSString* RCSubstituteString( NSString* source );
RC_EXTERN NSString* RCSubstituteStringWithKey( NSString* key );
RC_EXTERN NSString* RCLoadHTMLStringFromLocalizedBundle( NSString* name );
RC_EXTERN NSString* RCLoadHTMLStringFromBrandLocalizedBundle(NSString* brandID, NSString* name);
RC_EXTERN
NSString*
RCLoadTXTStringFromMainBundle (NSString *name);

#define RCLocalizedString(_key, comment) \
  [[RCResourceManager currentResourceManager] localizedStringForKey: _key]

#define RCDLocalizedString(_key, comment) \
[[RCResourceManager currentResourceManager] localizedStringViaDeviceLangForKey: _key]

#define RCLocalizedStringInLanguage(_key, _language) \
[[RCResourceManager currentResourceManager] localizedStringForKey: _key inLanguage: _language]

#define RCBrandNameString() RCLocalizedString( RCBrandNameSubstituteKey, )
#define RCShortBrandNameString() RCLocalizedString( RCShortBrandNameSubstituteKey, )
#define RCMainBrandNameString() RCLocalizedString( RCMainBrandNameSubstituteKey, )
#define RCCoBrandNameString() RCLocalizedString( RCCoBrandNameSubstituteKey, )
#define RCProgramNameString() RCLocalizedString( RCProgramNameSubstituteKey, )
#define RCProgramName2String() RCLocalizedString( RCProgramName2SubstituteKey, )

