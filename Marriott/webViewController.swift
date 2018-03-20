//
//  webViewController.swift
//  Marriott
//
//  Created by User on 3/6/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import WebKit

class webViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var forward: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string:"https://www.marriott.com/search/default.mi")
        let request = URLRequest(url: url!)
        
        webView.load(request)
        webView.navigationDelegate = self
    }

    @IBAction func refresh(_ sender: Any) {
        webView.reload()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        if webView.canGoBack{
            webView.goBack()
        }
    }
    @IBAction func forwardButtonTapped(_ sender: Any) {
        if webView.canGoForward{
            webView.goForward()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        back.isEnabled = webView.canGoBack
        forward.isEnabled = webView.canGoForward
        
        self.navigationItem.title = webView.url?.absoluteString
    }
    
    @IBAction func safaritapped(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.marriott.com/search/default.mi")! as URL, options: [:], completionHandler: nil)
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
