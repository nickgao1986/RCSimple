//
//  RCVariableValueLists.h
//  RCBase
//
//  Created by Grigory Entin on 11/20/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//


#import <RCBase/RCNullForNil.h>
#import <RCBase/RCNSDictionary.h>
#import <RCBase/RCVariableDeclarations.h>
#import <boost/preprocessor/repetition.hpp>
#import <boost/preprocessor/seq.hpp>
#import <boost/preprocessor/seq/for_each.hpp>
#import <boost/preprocessor/stringize.hpp>
#import <boost/preprocessor/control/iif.hpp>

#define RC_PP_VLIST_FROM_DICTIONARY_ITEM(r, dictionary, prop) \
	RC_KV ( \
		BOOST_PP_SEQ_ELEM (1, prop), \
		__attribute__((unused)) (BOOST_PP_SEQ_HEAD (prop)), \
		RCNilForNull ( \
			[dictionary objectForKey: @"" BOOST_PP_STRINGIZE (BOOST_PP_SEQ_HEAD (prop))]));

#define RC_PP_VLIST_FROM_DICTIONARY(dictionary, ... ) \
	BOOST_PP_SEQ_FOR_EACH ( \
		RC_PP_VLIST_FROM_DICTIONARY_ITEM, dictionary, __VA_ARGS__)

#define RC_PP_DICTIONARY_FROM_VLIST_ITEM(r, data, prop) \
	RCNullForNil (BOOST_PP_SEQ_HEAD (prop)), \
	@"" BOOST_PP_STRINGIZE (BOOST_PP_SEQ_HEAD (prop)),

#define RC_PP_DICTIONARY_FROM_VLIST(...) \
	RC_DICTIONARY ( \
		BOOST_PP_SEQ_FOR_EACH ( \
			RC_PP_DICTIONARY_FROM_VLIST_ITEM, \
			, \
			__VA_ARGS__) \
		RCNNilListTerminator)
