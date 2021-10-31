//
//  DetailViewController.swift
//  XCode Releases
//
//  Created by Oğuzhan Varsak on 31.10.2021.
//

import UIKit
import WebKit
import PKHUD

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var url: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        
        let link = URL(string: url!)!
        let request = URLRequest(url: link)
        webView.load(request)
    }
}

extension DetailViewController: WKNavigationDelegate, WKUIDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        HUD.show(HUDContentType.progress)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        HUD.hide(afterDelay: 0.2)
    }
}

