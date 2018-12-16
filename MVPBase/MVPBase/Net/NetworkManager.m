//
//  NetworkManager.m
//  MVPBase
//
//  Created by ShenYj on 2018/12/15.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#import "NetworkManager.h"


@implementation NetworkManager

singleton_m(NetworkManager)

- (void)gyyx_request:(RequestMethod)method url:(NSString *)urlString parameters:(NSDictionary *)parameters success:(MVPResponseBlock)success failure:(MVPFailureBlock)failure {
    if ( method == RequestMethodGET) {
        [self gyyx_Get:urlString parameters:parameters success:success failure:failure];
    } else if ( method == RequestMethodPOST ) {
        [self gyyx_Post:urlString parameters:parameters success:success failure:failure];
    } else {
        // HEAD
    }
}

- (void)gyyx_Get:(NSString *)url parameters:(NSDictionary *)parameters success:(MVPResponseBlock)success failure:(MVPFailureBlock)failure {
    
    [self GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)gyyx_Post:(NSString *)url parameters:(NSDictionary *)parameters success:(MVPResponseBlock)success failure:(MVPFailureBlock)failure {
    [self POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}


@end
