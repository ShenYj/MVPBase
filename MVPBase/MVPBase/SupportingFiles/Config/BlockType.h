//
//  BlockType.h
//  MVPBase
//
//  Created by ShenYj on 2018/12/15.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#ifndef BlockType_h
#define BlockType_h


typedef void(^MVPResponseBlock)(__nullable id response);
typedef void(^MVPFailureBlock)(NSError *error);


#endif /* BlockType_h */
