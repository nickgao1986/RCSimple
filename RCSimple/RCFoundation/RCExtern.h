//
//  RCExtern.h
//  RCBase
//
//  Created by Grigory Entin on 10/15/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//


#ifdef __cplusplus
#define RC_EXTERN \
    extern "C"
#else
#define RC_EXTERN \
    extern
#endif
