//
//  JavaScriptBridge.m
//  MVPBase
//
//  Created by ShenYj on 2018/12/16.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#import "JavaScriptBridge.h"

@interface JavaScriptBridge () <WKUIDelegate, WKNavigationDelegate>

/**
 负责JavaScript和Objective-C交互的WKWebViewJavascriptBridge对象
 */
@property (nonatomic, strong, readwrite) WKWebViewJavascriptBridge *bridge;

@property (nonatomic, weak, readwrite) id<JavaScriptBridgeProtocol> delegate;

@end

@implementation JavaScriptBridge

singleton_m(BridgeManager)

- (void)bridgeForWebView:(WKWebView *)webView {
    [self bridgeForWebView:webView handle:nil];
}


- (void)bridgeForWebView:(WKWebView *)webView handle:(nullable id)handle {
    if (handle != nil) {
        _delegate = handle;
    }
    _bridge = [WKWebViewJavascriptBridge bridgeForWebView:webView];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
}

#pragma mark - BridgeHandler

- (void)registerHandler:(NSString *)handlerName handler:(WVJBHandler)handler {
    [self.bridge registerHandler:handlerName handler:handler];
}

- (void)callHandler:(NSString *)handlerName data:(id)data responseCallback:(WVJBResponseCallback)responseCallback {
    [self.bridge callHandler:handlerName data:data responseCallback:responseCallback];
}

#pragma mark - WKUIDelegate

#pragma mark - WKNavigationDelegate


@end
