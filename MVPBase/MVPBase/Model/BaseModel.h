//
//  BaseModel.h
//  MVPBase
//
//  Created by ShenYj on 2018/12/15.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN
@protocol BasePresenterProtocol;

@interface BaseModel : NSObject

+ (void)loadDatas:(NSString *)url parameters:(NSDictionary *)parameters handle:(id<BasePresenterProtocol>)handle;

@end

NS_ASSUME_NONNULL_END
