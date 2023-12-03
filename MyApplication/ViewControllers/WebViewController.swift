//
//  WebViewController.swift
//  MyApplication
//
//  Created by apple on 03.12.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController{

    var linkId: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        if let linkId = linkId {
            if let url = URL(string: linkId) {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
    }
    
    private lazy var webView: WKWebView = {
        $0.navigationDelegate = self
        $0.frame = view.bounds
        return $0
    }(WKWebView())

}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("page is load")
    }
}
