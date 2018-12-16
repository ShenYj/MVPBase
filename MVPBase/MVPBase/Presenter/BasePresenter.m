//
//  BasePresenter.m
//  MVPBase
//
//  Created by ShenYj on 2018/12/15.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#import "BasePresenter.h"
#import "BaseModel.h"

@interface BasePresenter ()

@property (nullable, nonatomic, weak, readwrite) UIViewController *controller;

@end

@implementation BasePresenter

- (instancetype)initWithObject:(id)object {
    return [self initWithObject:object controller:nil];
}

- (instancetype)initWithController:(nullable UIViewController *)controller {
    NSAssert(controller != nil, @" controller is nil! ");
    return [self initWithObject:controller.view controller:controller];
}

- (instancetype)initWithObject:(id)object controller:(nullable UIViewController *)controller {
    self = [super init];
    if (self) {
        _object = object;
        _controller = controller;
    }
    return self;
}

- (void)detachObject {
    _object = nil;
    _controller = nil;
}


- (void)loadDatas:(NSString *)url parameters:(NSDictionary *)parameters {
    [BaseModel loadDatas:url parameters:parameters handle:self];
}


#pragma mark - ResponseHandle

- (void)onSuccess:(id)response {
    NSLog(@"%@",response);
}

- (void)onFailure:(NSError *)error {
    NSLog(@"%@",error);
}

@end
