//
//  BaseViewController.m
//  MVPBase
//
//  Created by ShenYj on 2018/12/15.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.presenter = [[BasePresenter alloc] initWithObject:self.view controller:self];
    
    // load datas
    NSString *url = @"http://v.juhe.cn/weather/index";
    NSString *appKey = @"bedef1cdb1a9b22cc9718e18d7046b99";
    
    NSDictionary *paras = @{
                            @"key": appKey,
                            @"cityname": @"北京"
                            };
    [self.presenter loadDatas:url parameters:paras];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
