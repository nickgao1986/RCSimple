//
//  RCNSStringImpBody.h
//  RCBase
//
//  Created by Grigory Entin on 10/15/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "RCExtern.h"
#import <Foundation/NSString.h>


#ifdef __cplusplus
#define RC_STRING_CONST
#else
#define RC_STRING_CONST const
#endif

#define RC_DECL_STRING(name) \
	RC_EXTERN NSString * RC_STRING_CONST name

#define RC_DEF_STRING(name) \
	NSString * RC_STRING_CONST name = @"" #name

#define RC_DEF_CUSTOM_STRING(name, ...) \
	NSString * RC_STRING_CONST name = __VA_ARGS__

#define RC_DEF_CUSTOM_STRING_SUF(suf, name, ...) \
	NSString * RC_STRING_CONST name ## suf = __VA_ARGS__

#define RC_DEF_STRING_SUF(suf, name) \
	RC_DEF_CUSTOM_STRING_SUF (suf, name, @"" #name)

//

#define RC_DEF_CUSTOM_STRING_SUF_PREF(suf, pref, name, ...) \
	NSString * RC_STRING_CONST pref ## name ## suf = __VA_ARGS__

#define RC_DECL_STRING_SUF_PREF(suf, pref, name) \
	RC_EXTERN NSString * RC_STRING_CONST pref ## name ## suf

#define RC_DEF_STRING_SUF_PREF(suf, pref, name) \
	RC_DEF_CUSTOM_STRING_SUF_PREF (suf, pref, name, @"" #name)

//

#define RC_DEF_CUSTOM_STRING_PREF_SUF(pref, suf, name, ...) \
	NSString * RC_STRING_CONST pref ## name ## suf = __VA_ARGS__

#define RC_DECL_STRING_PREF_SUF(pref, suf, name) \
	RC_EXTERN NSString * RC_STRING_CONST pref ## name ## suf

#define RC_DEF_STRING_PREF_SUF(pref, suf, name) \
	RC_DEF_CUSTOM_STRING_PREF_SUF (pref, suf, name, @"" #name)

//

#define RC_DECL_STRING_PREF(pref, name) \
	RC_DECL_STRING_SUF_PREF (, pref, name)

#define RC_DEF_STRING_PREF(pref, name) \
	RC_DEF_STRING_SUF_PREF (, pref, name)

//

#pragma mark -

//

#define RC_DEF_K(name) \
	RC_DEF_STRING_SUF_PREF (K,, name)

#define RC_DEF_CUSTOM_K(name, ...) \
	RC_DEF_CUSTOM_STRING_SUF_PREF (K, , name, __VA_ARGS__) 

#define RC_DECL_K(name) \
	RC_DECL_STRING_SUF_PREF (K,, name)

//

#define RC_DECL_ERROR_DOMAIN(name) \
    RC_DECL_STRING_SUF_PREF (ErrorDomain,, name);

#define RC_DEF_ERROR_DOMAIN(name) \
    NSString * RC_STRING_CONST name ## ErrorDomain = @"" #name

//

#define RC_DEF_CUSTOM_D(pref, name, ...) \
	RC_DEF_CUSTOM_STRING_SUF_PREF (D, pref, name, __VA_ARGS__) 

#define RC_DEF_PREF_D(pref, name) \
	RC_DEF_STRING_SUF (D, pref ## name)

#define RC_DECL_PREF_D(pref, name) \
	RC_DECL_STRING_SUF_PREF (D, pref, name)

//

#pragma mark -

//

#define RC_DEF_PLIST(pref, name) \
	RC_DEF_STRING_SUF_PREF (Plist, pref, name)

#define RC_DECL_PLIST(pref, name) \
	RC_DECL_STRING_SUF_PREF (Plist, pref, name)

//

#define RC_DEF_HTML(pref, name) \
	RC_DEF_STRING_SUF_PREF (HTML, pref, name)

#define RC_DECL_HTML(pref, name) \
	RC_DECL_STRING_SUF_PREF (HTML, pref, name)

//

#define RC_DEF_TXT(pref, name) \
	RC_DEF_STRING_SUF_PREF (TXT, pref, name)

#define RC_DECL_TXT(pref, name) \
	RC_DECL_STRING_SUF_PREF (TXT, pref, name)

//

#define RC_DEF_BUNDLE(pref, name) \
	RC_DEF_STRING_SUF_PREF (BundleName, pref, name)

#define RC_DECL_BUNDLE(pref, name) \
	RC_DECL_STRING_SUF_PREF (BundleName, pref, name)

//

#define RC_DEF_NAMED_PNG(pref, name) \
	RC_DEF_CUSTOM_STRING_SUF_PREF (NamedPNG, pref, name, @"" #name ".png")

#define RC_DECL_NAMED_PNG(pref, name) \
	RC_DECL_STRING_SUF_PREF (NamedPNG, pref, name)

//

#define RC_DEF_NIB(pref, name) \
	RC_DEF_STRING_SUF_PREF (Nib, pref, name)

#define RC_DECL_NIB(pref, name) \
	RC_DECL_STRING_SUF_PREF (Nib, pref, name)

//

#define RC_DEF_WAV(pref, name) \
	RC_DEF_STRING_SUF_PREF (Wav, pref, name)

#define RC_DECL_WAV(pref, name) \
	RC_DECL_STRING_SUF_PREF (Wav, pref, name)

//

#define RC_DEF_PNG(pref, name) \
	RC_DEF_STRING_SUF_PREF (PNG, pref, name)

#define RC_DECL_PNG(pref, name) \
	RC_DECL_STRING_SUF_PREF (PNG, pref, name)

//

#define RC_DEF_NOTIFICATION(pref, name) \
	RC_DEF_STRING_SUF_PREF (Notification, , pref ## name)

#define RC_DECL_NOTIFICATION(pref, name) \
	RC_DECL_STRING_SUF_PREF (Notification, , pref ## name)
