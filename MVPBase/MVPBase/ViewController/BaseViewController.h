//
//  BaseViewController.h
//  MVPBase
//
//  Created by ShenYj on 2018/12/15.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasePresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@property (nonatomic, strong) BasePresenter *presenter;

@end

NS_ASSUME_NONNULL_END
