//
//  ViewController.swift
//  js2swift
//
//  Created by Ouds CG on 16/3/1.
//  Copyright © 2016年 nodesites. All rights reserved.
//

import UIKit

class UIVwebViewController: UIViewController, UIWebViewDelegate {

    
    @IBOutlet weak var web: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let res = NSBundle.mainBundle().pathForResource("test",ofType:"html")
        web.loadRequest(NSURLRequest(URL: NSURL.fileURLWithPath(res!)))
        web.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("=========== scheme ==============")
        print(request.URL?.scheme)
        if request.URL?.scheme == "hello" {
            print("=========== scheme ==============")
            print(request.URL?.host)
            return true
        }
        
        return true
    }
    
}

