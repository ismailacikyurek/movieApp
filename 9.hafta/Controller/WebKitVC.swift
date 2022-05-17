//
//  WebKitVC.swift
//  9.hafta
//
//  Created by İSMAİL AÇIKYÜREK on 14.05.2022.
//

import UIKit
import WebKit



class WebKitVC: UIViewController, WKNavigationDelegate {
  
    
    @IBOutlet weak var webkit: UIWebView!
    var webView: WKWebView!
    let refreshControl: UIRefreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()

            webView = WKWebView()
            webView.navigationDelegate = self
            view = webView
        
        
        let url = URL(string: "https://www.themoviedb.org/?language=tr")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
      
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.red
          ])
          refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)// #selector(refresh) = "refresh" fonskiyonunu çağır
        refreshControl.tintColor = UIColor.blue// TintColor rengi
        webView.scrollView.addSubview(refreshControl)// webView'e refleshControl ekleme
            
    }
      @objc func refresh(sender:AnyObject) {
      webView.reload() //yeniden yükleme
     refreshControl.endRefreshing() //yenilemeyi Durdur
    }
   
    

}





