//
//  ViewController.swift
//  HLPlaceholderViewDemo
//
//  Created by PandaApe on 7/12/15.
//  Copyright (c) 2015 PandaApe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placeholderView: HLPlaceholderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        placeholderView.iconImg = UIImage(named: "info")
        placeholderView.addPlaceholderTapTarget(self, andAction: "loading")
        placeholderView.msgText = "No data found"
        placeholderView.sizeOfIconImageView = CGSizeMake(60, 60)
        
    }
    
    func loading(){
        NSTimer.scheduledTimerWithTimeInterval( 1, target: placeholderView, selector: "stopAnimating", userInfo: nil, repeats: false)
        print("loading...")
    }


}

