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
    var titleDisplay = ""
    
    var urlDisplay: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = self.urlDisplay {
            webview.loadRequest(URLRequest(url: url))
        }
        navigationItem.title = titleDisplay
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(_ : UIWebView) {
        self.loadingIcon.startAnimating()
        print("starting to load")
    }

    func webViewDidFinishLoad(_ : UIWebView) {
        self.loadingIcon.stopAnimating()
        self.loadingIcon.isHidden = true
        print("finished loading")
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
