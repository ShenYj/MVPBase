//
//  GYYXIAPManager.m
//  MVPBase
//
//  Created by ShenYj on 2018/12/16.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#import "GYYXIAPManager.h"
#import <StoreKit/StoreKit.h>

@interface GYYXIAPManager () <SKProductsRequestDelegate, SKPaymentTransactionObserver>

/**
 商品列表
 */
@property (nonatomic, strong) NSArray *products;

@end

@implementation GYYXIAPManager

singleton_m(IAPManager)

- (void)gyyx_GetProducts {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *productArr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *productIDs = [productArr valueForKey:@"productId"];
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithArray:productIDs]];
    //开始请求
    [request start];
    //2.返回可售商品  获取数据  设置代理
    request.delegate = self;
    //6.监听队列交易情况  设置代理
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
    //7.提供服务
}


#pragma mark - SKPaymentTransactionObserver
// Sent when the transaction array has changed (additions or state changes).  Client should check state of transactions and finish as appropriate.
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions {
    
}

#pragma mark - SKProductsRequestDelegate
// Sent immediately before -requestDidFinish:
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    
}


@end



/**
 
 @interface CZTableViewController ()<SKProductsRequestDelegate, SKPaymentTransactionObserver>
 //商品列表
 @property (nonatomic, strong) NSArray *products;
 
 @end
 
 @implementation CZTableViewController
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 //1.提交商品列表
 //取出数据
 NSString *filePath = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
 NSData *data = [NSData dataWithContentsOfFile:filePath];
 NSArray *productArr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
 
 NSArray *productIDs = [productArr valueForKey:@"productId"];
 //创建商品请求
 SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithArray:productIDs]];
 //开始请求
 [request start];
 //2.返回可售商品  获取数据  设置代理
 request.delegate = self;
 //6.监听队列交易情况  设置代理
 [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
 //7.提供服务
 }
 
 #pragma mark - 响应事件
 
 //点击恢复购买
 - (IBAction)clickRestoreItem:(id)sender {
 //恢复购买
 [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
 }
 
 
 #pragma mark - SKPaymentTransactionObserver
 
 - (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions{
 //遍历队列中所有的交易对象
 for (SKPaymentTransaction *transaction in transactions) {
 switch (transaction.transactionState) {
 case SKPaymentTransactionStatePurchased: //购买完成
 //完成交易
 [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
 NSLog(@"购买成功");
 break;
 case SKPaymentTransactionStateRestored:  //恢复购买完成
 //完成交易
 [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
 NSLog(@"恢复购买成功");
 break;
 default:
 break;
 }
 }
 

 
 typedef NS_ENUM(NSInteger, SKPaymentTransactionState) {
 SKPaymentTransactionStatePurchasing,    // 正在购买
 SKPaymentTransactionStatePurchased,     // 购买成功
 SKPaymentTransactionStateFailed,        // 购买失败
 SKPaymentTransactionStateRestored,      // 恢复购买成功
 SKPaymentTransactionStateDeferred NS_ENUM_AVAILABLE_IOS(8_0), //存在依赖,最终是否交易成功取决于其他因素(apple也分父子账号, 经过父账号允许)
 
 
 } NS_AVAILABLE_IOS(3_0);
 
}


 *
 @required
 // 已经更新交易状态后调用
 - (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions NS_AVAILABLE_IOS(3_0);
 
 @optional
 // 已经移除交易后调用(当交易被完成/失败时会调用)
 - (void)paymentQueue:(SKPaymentQueue *)queue removedTransactions:(NSArray<SKPaymentTransaction *> *)transactions NS_AVAILABLE_IOS(3_0);
 
 // 当恢复购买失败后调用
 - (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error NS_AVAILABLE_IOS(3_0);
 
 // 当恢复购买成功后调用
 - (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue NS_AVAILABLE_IOS(3_0);
 
 // 已经更新下载后调用(apple store托管有关)
 - (void)paymentQueue:(SKPaymentQueue *)queue updatedDownloads:(NSArray<SKDownload *> *)downloads NS_AVAILABLE_IOS(6_0);



#pragma mark - SKProductsRequestDelegate
 *  当已经接收到响应后调用
 *
 *  @param request  商品请求
 *  @param response 响应(包含可售的商品)

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    //    //遍历可售商品
    //    for (SKProduct *product in response.products) {
    //        NSLog(@"%@,%@,%@,%@", product.localizedTitle, product.localizedDescription, product.price, product.productIdentifier);
    //    }
    //赋值数据
    self.products = response.products;
    
    [self.tableView reloadData];
}

#pragma mark - 懒加载
- (NSArray *)products{
    if (_products == nil) {
        _products = [NSArray array];
    }
    return _products;
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //取出商品模型
    SKProduct *product = self.products[indexPath.row];
    // Configure the cell...
    cell.textLabel.text = product.localizedTitle;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", product.price];
    return cell;
}
// 已经选择某行后调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //3.用户选择商品 展示商品
    SKProduct *product = self.products[indexPath.row];
    //4.开具票据  创建支付对象
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    //5.排队付费
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

 
 
 */
