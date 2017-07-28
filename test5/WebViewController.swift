//
//  WebViewController.swift
//  test5
//
//  Created by station3 on 28/07/2017.
//  Copyright © 2017 station3. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet var loadingIcon: UIActivityIndicatorView!
    
    var urlDisplay: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = self.urlDisplay {
            webview.loadRequest(URLRequest(url: url))
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        loadingIcon.isHidden = false
        loadingIcon.startAnimating()
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadingIcon.stopAnimating()
        loadingIcon.isHidden = true

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//
//extension UIViewController: UIWebViewDelegate
//{
//    func webViewDidStartLoad(_ webView: UIWebView) {
//        loadingIcon.isHidden = false
//    }
//    
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        loadingIcon.isHidden = false
//
//    }
//}
