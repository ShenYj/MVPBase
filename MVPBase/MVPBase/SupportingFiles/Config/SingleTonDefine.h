//
//  SingleTonDefine.h
//  MVPBase
//
//  Created by ShenYj on 2018/12/15.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#ifndef SingleTonDefine_h
#define SingleTonDefine_h

#ifdef __has_feature(objc_arc) // ARC模式下

//.h文件
#define singleton_h(name) +(instancetype)shared##name;
//.m文件
#define singleton_m(name) static id _instanceType = nil;\
+(instancetype)shared##name\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instanceType = [[self alloc]init];\
});\
return _instanceType;\
}\
+ (instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instanceType = [super allocWithZone:zone];\
});\
return _instanceType;\
}\
-(id)copyWithZone:(NSZone *)zone\
{\
return _instanceType;\
}

#else //MRC模式下

//.h 拼接参数使用##
#define singleton_h(name) +(instancetype)shared##name;

//.m 宏里面换行
#define singleton_m(name) static id _instanceType = nil;\
+(instancetype)shared##name\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instanceType = [[self alloc]init];\
});\
return _instanceType;\
}\
+ (instancetype)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instanceType = [super allocWithZone:zone];\
});\
return _instanceType;\
}\
-(id)copyWithZone:(NSZone *)zone\
{\
return _instanceType;\
}\
-(oneway void)release\
{\
\
}\
-(instancetype)retain\
{\
return _instanceType;\
}\
-(instancetype)autorelease\
{\
return _instanceType;\
}\
- (NSUInteger)retainCount\
{\
return 1;\
}

#endif


#endif /* SingleTonDefine_h */
