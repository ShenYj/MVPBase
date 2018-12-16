//
//  BasePresenter.h
//  MVPBase
//
//  Created by ShenYj on 2018/12/15.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@protocol BasePresenterProtocol <NSObject>

@optional;
// 1. Presenter -> Model
- (void)updateUI;

// 2. Model -> Presenter
- (void)onSuccess:(id)response;
- (void)onFailure:(NSError *)error;

@end

//@protocol ResponseHandle;
@interface BasePresenter <T> : NSObject <BasePresenterProtocol>

/**
 持有Presenter的视图或其他对象
 */
@property (nonatomic, weak, readonly) T<BasePresenterProtocol> object;
/**
 持有Presenter的控制器,允许为`nil`
 如果通过<i>initWithController:</i>实例化,不允许为`nil`
 */
@property (nullable, nonatomic, weak, readonly) UIViewController *controller;

/**
 *  @metohd initWithObject: Controller:
 *
 *  @param object           持有Presenter的视图或其他对象
 *  @param controller       持有Presenter的控制器,允许为`nil`
 *
 *  @discussion             Presenter实例h方法
 */
- (instancetype)initWithObject:(T)object controller:(nullable UIViewController *)controller NS_REQUIRES_SUPER;
- (instancetype)initWithObject:(T)object NS_REQUIRES_SUPER;
- (instancetype)initWithController:(nullable UIViewController *)controller NS_REQUIRES_SUPER;
- (instancetype)init NS_UNAVAILABLE;

/**
 *  @metohd detachObject
 *
 *  @discussion              释放object
 */
- (void)detachObject;


- (void)loadDatas:(NSString *)url parameters:(NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END
