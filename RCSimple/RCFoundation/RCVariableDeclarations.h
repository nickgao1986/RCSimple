//
//  RCVariableDeclarations.h
//  RCBase
//
//  Created by Grigory Entin on 18.05.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

/** @file */

#import <RCBase/RCCasting.h>
#import <RCBase/RCConstCast.h>
#import <RCBase/RCStaticTyping.h>
#import <RCBase/RCCheck.h>
#import <Foundation/NSValue.h>
#import <string.h>

/**
	@defgroup VarDeclMacros Declaring variables

	These macros provide facilities for variable definitions coupled
	with inferring, preserving and @ref DynamicTyping "recovering" the
	type of variable initializers.

	@copybrief VarDeclMacros

	All macros define a variable initialized with result of some
	expression, hence "V" in macro names.
 
	The @b only macro that is crucial for understanding is RC_V, that
	implements type inferring.

	All other macros are combinations of RC_V with macros for
	preserving or recovering lost type, and intorduce anything
	"new". They are just shortcuts. Actually it's preferrable to avoid
	usage of those macros but instead explicitely use RC_V with a
	cast-like expression, because otherwise, when the code evolves and
	types of initializers change, it might be required to change the
	macro used for variable definition e.g. from kind-casting to
	simple assignment and so on - we would like to change just the
	expression, not the macro with which expression result is
	transferred to the variable.
	
	The macros use abbreviations/letter to denote their function:
	
	@_{K} in macro name denotes "kind" casting.
	
	@_{C} in macro name denotes "protocol" casting.
	
	@_{A} in macro name denotes "aliasing" some other entity.
	
	@_{NNIL} in macro name denotes that the value is checked for non-nil.

	Speaking of usage of all macros, the following code should be
	avoided:

	@code
		RC_NV (NSString, s1);
		RC_KV (NSString, s2, [array lastObject]);
		RC_KNILV (NSString, s3, [array lastObject]);
	@endcode

	Explicit casting should be used instead:

	@code
		RC_V (s1, RC_NEW (NSString));
		RC_V (s2, RC_KCAST (NSString, [array lastObject]));
		RC_V (s3, RC_NNIL (RC_KCAST (NSString, [array lastObject])));
	@endcode

	For the reference, the above code is (technically) equivalent to
	the following:

	@code
		NSString *s1 = [[NSString new] autorelease];
		NSString *s2;
		{
			NSObject *o = [array lastObject];
			NSAssert ([o isKindOfClass: [NSString self]]);
			s2 = o;
		}
		NSString *s3;
		{
			NSObject *o = [array lastObject];
			NSAssert ([o isKindOfClass: [NSString self]], @"\"o\" is not kind of NSString");
			NSAssert (nil != o, @"\"o\" is nil");
			s3 = o;
		}
	@endcode
 */

/**@{*/

#ifdef __cplusplus
# define RC_CONST_V_ENABLED 1
#else
# define RC_CONST_V_ENABLED 0
#endif

#if RC_CONST_V_ENABLED
# define RC_CONST_V const
# define RC_CONST_CASTED_POINTER_FOR_V(v) \
	((void *)(&v))
#else
# define RC_CONST_V
# define RC_CONST_CASTED_POINTER_FOR_V(v) \
	(&v)
#endif

#pragma mark -

/**
	Declares const variable @_{v} initialized with value of expression
	passed as the last argument; the type of the variable matches the
	type of the expression.
 */

#define RC_V(v, ...) \
    __typeof__ (__VA_ARGS__) RC_CONST_V v = __VA_ARGS__


/**
	Mutable variant of @_{RC_V}; this macro is an analogue of C++0x
	@_{auto} keyword.
 */

#define RC_MV(v, ...) \
	__typeof__ (RC_CONST_CAST (__VA_ARGS__)) v = RC_CONST_CAST (__VA_ARGS__)

#pragma mark -

/**
	Declares variable @_{v} of class @_{Class}, initialized 
	with value of expression with type not derieved from @_{Class} but 
	still producing an instance of @_{Class}.
	
	@deprecated 
	@see RC_V (v, RC_KCAST (...))
 */
#define RC_KV(Class, v, ...) \
    Class *v = RCKindVerifiedObject ((__VA_ARGS__), [Class self], #__VA_ARGS__, #Class, RC_LOCATION ());

/**
	Declares variable @c v conforming to protocol Protocol, initialized 
	with value of expression that is checked for the protocol conformance in 
	run-time.
	
	@deprecated 
	@see RC_V (v, RC_CCAST (...))
 */
#define RC_CV(Protocol, v, ...) \
    NSObject<Protocol> *v = RCProtocolVerifiedObject ((__VA_ARGS__), @protocol (Protocol), #__VA_ARGS__, #Protocol, RC_LOCATION ());


#pragma mark -

/**
	Declares variable @_{v} of class @_{Class}, initialized 
	with nil if expression result is not kind of @_{Class} or with the result
	otherwise.

	@deprecated 
	@see RC_V (v, RC_KNILCAST (...))
 */
#define RC_KNILV(Class, v, ...) \
    RC_V (v, (Class *) RCKindOfClassOrNil ([Class self], __VA_ARGS__))

#pragma mark -

/**
	Declares variable @_{v} initialized from similarly named property of
	object @_{t} (the type of variable matches the property type).
 */
#define RC_ATV(v, t) \
    RC_V (v, [t v])

#define RC_ATMV(v, t) \
    RC_MV (v, [t v])

/** 
	Declares variable @_{v} initialized from similarly named property of
	@_{self} (the type of variable matches the property type).
 */
#define RC_AV(v) \
    RC_ATV (v, self)

#define RC_AMV(v) \
    RC_ATMV (v, self)

/**
	Declares variable @_{v} initialized from similarly named query on
	[self class] (the type of variable matches the type of the query).
 */
#define RC_SELF_CLASS_AV(v) \
	RC_ATV (v, [self class])

//

/**
	Declares variable @_{v} initialized from similarly named property of
	object @_{t} that is checked for non-nil value (the type of variable
	matches the property type).
 */
#define RC_NNIL_ATV(v, t) \
    RC_V (v, RC_NNIL ([t v]))

/** 
	Declares variable @_{v} initialized from similarly named property of
	@_{self} (the type of variable matches the property type).
 */
#define RC_NNIL_AV(v) \
    RC_NNIL_ATV (v, self)

//

/**
	In class methods declares variable assigned a newly created
	instance of the reciever class; the actual class of the instance
	is determined by the reciever.
 */
#define RC_SELF_CLASS_NV(foo) \
	RC_SELF *foo = [[self new] autorelease];

#pragma mark -

/**
	Declares variable of type @_{Class *} initialized with newly created
	instance, allocated, initialized and autoreleased; initialization is
	performed with @_{-init}.
	
	@deprecated 
	@see RC_V (v, RC_NEW (...))
 */
#define RC_NV(Class, v) \
    RC_V (v, RC_NEW (Class))

/**
	Declares variable @_{v} of type @_{Class *} initialized with newly
	created	instance, allocated, initialized and autoreleased;
	initialization is performed with custom initializer and 
	parameters in form @_{initWithFoo: foo bar: bar} passed as the
	last argument.
	
	@deprecated 
	@see RC_V (v, RC_CUSTOM_NEW (...))
 */
#define RC_CUSTOM_NV(Class, v, ...) \
	RC_V (v, RC_CUSTOM_NEW (Class, __VA_ARGS__))

/**@}*/

#define RC_SYNTHESIZE(prop) \
	@synthesize prop = _ ## prop

#pragma mark -

#ifdef __cplusplus
# if !defined __clang__
#  define RC_INITIALIZED_FIELD(name, ...) \
	name: __VA_ARGS__
# else
#  define RC_INITIALIZED_FIELD(name, ...) \
	.name = __VA_ARGS__
# endif
#else
# define RC_INITIALIZED_FIELD(name, ...) \
	.name = __VA_ARGS__
#endif
