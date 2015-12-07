//
//  HLPlaceholderView.swift
//  HLPlaceholderViewDemo
//
//  Created by PandaApe on 7/12/15.
//  Copyright (c) 2015 PandaApe. All rights reserved.
//

import UIKit

/*!
@class         PlaceholderView
@discussion    When you're working on a new app, sometimes it's easier to start with dummy views and slowly replace them as you implement their functionality. Rather than use a simple UIView for this, PlaceholderView gives you a better looking placeholder view that shows its dimensions and an optional title.
*/
class HLPlaceholderView: UIView {
    
    private var iconImgView:UIImageView!
    private var activityIndicator:UIActivityIndicatorView!
    private var msgLabel:UILabel!
    private var widthConstraintOfIcon:NSLayoutConstraint!
    private var heightConstraintOfIcon:NSLayoutConstraint!
    private var tapGesture:UITapGestureRecognizer?
    
    private var target:AnyObject!
    private var action:Selector!
    
    var indicatorViewStyle:UIActivityIndicatorViewStyle!{
        
        set{
            self.activityIndicator.activityIndicatorViewStyle  = newValue
        }
        get{
            return self.activityIndicator.activityIndicatorViewStyle
        }
    }
    
    var msgText:String?{
        set{
            self.msgLabel.text = newValue
        }
        get{
            return self.msgLabel.text
        }
    }
    
    var iconImg:UIImage?{
        set{
            self.iconImgView.image = newValue
        }
        get{
            return self.iconImgView.image
        }
    }
    
    var sizeOfIconImageView:CGSize!{
        set{
            widthConstraintOfIcon.constant = newValue.width
            heightConstraintOfIcon.constant = newValue.height
        }
        get{
            return CGSizeMake(widthConstraintOfIcon.constant, heightConstraintOfIcon.constant)
        }
    }
    
    var msgTextFont:UIFont!{
        set{
            self.msgLabel.font = newValue
        }
        get{
            return self.msgLabel.font
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setUpViews()
        self.setUpConstraints()
    }
    
    private func setUpViews(){
        
        iconImgView = UIImageView()
        iconImgView.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        
        msgLabel = UILabel()
        msgLabel.numberOfLines = 0
        msgLabel.textAlignment = .Center
        msgLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(iconImgView)
        self.addSubview(activityIndicator)
        self.addSubview(msgLabel)
    }
    
    private func setUpConstraints(){
        
        let viewsDic = ["iconImgView":iconImgView,"activityIndicator":activityIndicator,"msgLabel":msgLabel]
        
        widthConstraintOfIcon = NSLayoutConstraint.constraintsWithVisualFormat("[iconImgView(60)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views:viewsDic ).first!
        
        heightConstraintOfIcon = NSLayoutConstraint.constraintsWithVisualFormat("V:[iconImgView(60)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views:viewsDic ).first!
        
        let centerXConstraintOfIcon = NSLayoutConstraint(item: iconImgView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        
        let centerYConstraintOfIcon = NSLayoutConstraint(item: iconImgView, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: -20)
        
        let centerXConstraintOfIndicator = NSLayoutConstraint(item: activityIndicator, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        
        let centerYConstraintOfIndicator = NSLayoutConstraint(item: activityIndicator, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: -20)
        
        let verticalConstraintOfMsgLabel = NSLayoutConstraint(item: msgLabel, attribute: .Top, relatedBy: .Equal, toItem: iconImgView, attribute: .Bottom, multiplier: 1, constant: 10)
        let centerXConstraintOfMsgLabel = NSLayoutConstraint(item: msgLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        let widthConstraintOfMsgLabel = NSLayoutConstraint(item: msgLabel, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 3.5/5.0, constant: 0)
        
        NSLayoutConstraint.activateConstraints([widthConstraintOfIcon,heightConstraintOfIcon,centerXConstraintOfIcon,centerYConstraintOfIcon,verticalConstraintOfMsgLabel,centerXConstraintOfMsgLabel,widthConstraintOfMsgLabel,centerXConstraintOfIndicator,centerYConstraintOfIndicator])
    }
    
    func startAnimating(){
        msgLabel.hidden = true
        iconImgView.hidden = true
        activityIndicator.startAnimating()
    }
    
    func stopAnimating(){
        msgLabel.hidden = false
        iconImgView.hidden = false
        activityIndicator.stopAnimating()
    }
    
    func addPlaceholderTapTarget(target:AnyObject!, andAction action:Selector){
        
        self.target = target
        self.action = action
        
        tapGesture = UITapGestureRecognizer(target: self, action: "handleTapAction")
        
        if tapGesture != nil{
            iconImgView.removeGestureRecognizer(tapGesture!)
            msgLabel.removeGestureRecognizer(tapGesture!)
        }
        
        iconImgView.addGestureRecognizer(tapGesture!)
        iconImgView.userInteractionEnabled = true
        
    }
    
    @objc
    private func handleTapAction(){
        self.startAnimating()
        target.performSelector(action)
    }
}
