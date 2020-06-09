//
//  AboutUsTCPrivacyPolicyVC.swift
//  JobRingerEmployee
//
//  Created by MAC on 04/03/20.
//  Copyright © 2020 jobringer. All rights reserved.
//

import UIKit
import WebKit

class AboutUsTCPrivacyPolicyVC: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var noDataLbl: UILabel!
    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    
    var isFrom = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        headerLbl.text = "Terms & Conditions"
        noDataLbl.isHidden = true
        if isFrom == "Terms & Conditions"{
        webView.load(NSURLRequest(url: NSURL(string: "https://www.google.com/")! as URL) as URLRequest)
        }else if isFrom == "About us"{
            webView.load(NSURLRequest(url: NSURL(string: "https://www.google.com/")! as URL) as URLRequest)
            headerLbl.text = "About us"
        }else{//privacy policy
            webView.load(NSURLRequest(url: NSURL(string: "https://www.google.com/")! as URL) as URLRequest)
            headerLbl.text = "Privacy policy"
        }
        if webView.canGoBack{
            webView.goBack()
        }
        if webView.canGoForward{
            webView.goForward()
        }

        // Do any additional setup after loading the view.
    }
    func customAlert(title:String, msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        actIndicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        actIndicator.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        customAlert(title: "No Internet Connection", msg: "Check your Internet Connection")
        actIndicator.stopAnimating()
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
