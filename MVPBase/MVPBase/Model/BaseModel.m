//
//  BaseModel.m
//  MVPBase
//
//  Created by ShenYj on 2018/12/15.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+ (void)loadDatas:(NSString *)url parameters:(NSDictionary *)parameters handle:(id<ResponseHandle>)handle {
    
    [[NetworkManager sharedNetworkManager] Get:url parameters:parameters success:^(id  _Nullable response) {
        if (response == nil) {
            NSLog(@"返回数据为null");
            return ;
        }
        NSDictionary *res = (NSDictionary *)response;
        if ([res[@"resultcode"] intValue] != 200) {
            NSLog(@"请求出错: %@", res[@"error_code"]);
            return;
        }
        NSDictionary *dict = res[@"result"];
        BaseModel *result = [BaseModel yy_modelWithJSON:dict];
        if (handle && [handle respondsToSelector:@selector(onSuccess:)]) {
            [handle onSuccess:dict];
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        if (handle && [handle respondsToSelector:@selector(onFailure:)]) {
            [handle onFailure:error];
        }
    }];
}


@end
