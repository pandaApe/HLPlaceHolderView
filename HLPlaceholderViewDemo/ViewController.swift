//
//  ViewController.swift
//  HLPlaceholderViewDemo
//
//  Created by PandaApe on 7/12/15.
//  Copyright (c) 2015 PandaApe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
    
    @IBOutlet weak var placeholderView: HLPlaceholderView!
    @IBOutlet weak var webView: UIWebView!
    
    var sampleAddress = "https://github.com/pandaApe/HLPlaceHolderView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeholderView.imgOfIconImgView = UIImage(named: "info")
        placeholderView.addPlaceholderTapTarget(self, andAction: #selector(ViewController.loadData))
        placeholderView.sizeOfIconImageView = CGSizeMake(60, 60)
        
        webView.delegate = self;
        webviewLoadWithURLStr(sampleAddress)
    }
    
    func loadData(){
        webView.reload()
    }
    
    //UIWebview Delegate Method
    func webViewDidStartLoad(webView: UIWebView) {
        placeholderView.startAnimating()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        placeholderView.stopAnimating()
        placeholderView.msgText = "\(error?.domain) \nFailed!" ;
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        placeholderView.stopAnimating()
        placeholderView.hidden = true
    }
    
    @IBAction func switchValueChanged(sender: UISwitch) {
        sender.tag *= -1
        var addressUrl:String
        if sender.tag > 0 {
            addressUrl = sampleAddress
        }else{
            addressUrl = "-"+sampleAddress
        }
        
        webviewLoadWithURLStr(addressUrl)
        
    }
    
    func webviewLoadWithURLStr(address:String){
        webView.loadRequest(NSURLRequest(URL: NSURL(string: address)!))
    }
    
    
    
}

