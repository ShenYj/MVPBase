//
//  NetworkManager.h
//  MVPBase
//
//  Created by ShenYj on 2018/12/15.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "SingleTonDefine.h"
#import <AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, RequestMethod) {
    RequestMethodGET,
    RequestMethodPOST,
    RequestMethodHEAD,
};

@interface NetworkManager : AFHTTPSessionManager

singleton_h(NetworkManager);

/**
 *  @metohd gyyx_request: url: parameters: success: failure:
 *
 *  @param method          请求方法
 *  @param urlString       url请求地址
 *  @param parameters      请求参数
 *  @param success         成功回调
 *  @param failure         失败回调
 *
 *  @discussion             Get请求
 */
- (void)gyyx_request: (RequestMethod)method
                 url: (NSString *)urlString
          parameters: (NSDictionary *)parameters
             success: (MVPResponseBlock)success
             failure: (MVPFailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
