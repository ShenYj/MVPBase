//
//  JavaScriptBridge.h
//  MVPBase
//
//  Created by ShenYj on 2018/12/16.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WKWebViewJavascriptBridge.h>

NS_ASSUME_NONNULL_BEGIN

@protocol JavaScriptBridgeProtocol <NSObject>



@end

@interface JavaScriptBridge : NSObject

singleton_h(BridgeManager)

/**
 *  @metohd bridgeForWebView:
 *
 *  @param webView          WebView
 *  @param handle           响应事件的对象
 *
 *  @discussion             绑定WebView
 */
- (void)bridgeForWebView:(WKWebView *)webView handle:(nullable id<JavaScriptBridgeProtocol>)handle;
- (void)bridgeForWebView:(WKWebView *)webView;
- (instancetype)init NS_UNAVAILABLE;

- (void)registerHandler:(NSString *)handlerName handler:(WVJBHandler)handler;
- (void)callHandler:(NSString *)handlerName data:(id)data responseCallback:(WVJBResponseCallback)responseCallback;

@end

NS_ASSUME_NONNULL_END
