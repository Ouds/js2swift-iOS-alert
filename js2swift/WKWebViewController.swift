//
//  ViewController.swift
//  js2swift
//
//  Created by Ouds CG on 16/3/1.
//  Copyright © 2016年 nodesites. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController,WKUIDelegate,WKScriptMessageHandler{

    
    var webView:WKWebView!
    var config:WKWebViewConfiguration!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.theWebView()
    }
    
    //初始化webVIew
    func theWebView(){
        
        config = WKWebViewConfiguration()
        
        //注册js方法
        config.userContentController.addScriptMessageHandler(self, name: "js2swift")
        
        webView = WKWebView(frame: self.view.frame, configuration: config)
        webView.UIDelegate = self
        self.view.addSubview(webView)
        
        webView.loadRequest(NSURLRequest(URL: NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("test", ofType: "html")!)))
    }
    
    //alert捕获
    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        //通知回调
        completionHandler()
        //使用iOS-alert 代替js的alert
        let alert = UIAlertController(title: "iOS-alert", message: "\(message)", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "ok", style: .Default, handler:nil))
        alert.addAction(UIAlertAction(title: "cancel", style: .Cancel, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    //实现js调用ios的handle委托
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        //接受传过来的消息从而决定app调用的方法
        let dict = message.body as! Dictionary<String,String>
        let method:String = dict["method"]!
        let param1:String = dict["param1"]!
        if method=="hello"{
            hello(param1)
        }
    }
    
    func hello(param1:String){
        print("=========== param1 ==============")
        print(param1)
    }

    
}

