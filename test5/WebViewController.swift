//
//  WebViewController.swift
//  test5
//
//  Created by station3 on 28/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    var titleDisplay = ""
    var urlDisplay   : URL?
    
    @IBOutlet weak var webview : UIWebView!
    @IBOutlet var loadingIcon  : UIActivityIndicatorView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = self.urlDisplay {
            webview.loadRequest(URLRequest(url: url))
        }
        navigationItem.title = titleDisplay
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func webViewDidStartLoad(_ : UIWebView) {
        self.loadingIcon.startAnimating()
    }

    func webViewDidFinishLoad(_ : UIWebView) {
        self.loadingIcon.stopAnimating()
        self.loadingIcon.isHidden = true
    }
}

