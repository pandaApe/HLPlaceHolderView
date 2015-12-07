# HLPlaceholderView

When you're working on a new app, sometimes it's easier to start with dummy views and slowly replace them as you implement their functionality. Rather than use a simple UIView for this, PlaceholderView gives you a better looking placeholder view that shows its dimensions and an optional title.

![](https://github.com/pandaApe/HLPlaceHolderView/blob/master/DemoScreenshots/3.gif?raw=true)

## Requirements

Xcode 7 or higher
iOS 8.0 or higher

## Manual Installation
1. Drag the code itself (HLPlaceholderView.swift file) to your project. 
2. Make sure that the file is added to the Target membership.

## Example Usage
1. Drag an UIView to your Storyboard, and set Custom class as HLPlaceholderView.

![](https://github.com/pandaApe/HLPlaceHolderView/blob/master/DemoScreenshots/1.png?raw=true)

2. ctrl+drag the UIView reference into ViewController.

![](https://github.com/pandaApe/HLPlaceHolderView/blob/master/DemoScreenshots/2 .png?raw=true)

3. Enjoy the code bellow. It's very simple, right? :)

```Swift
override func viewDidLoad() {
        super.viewDidLoad()
    
        placeholderView.imgOfIconImgView = UIImage(named: "info")
        placeholderView.addPlaceholderTapTarget(self, andAction: "loading")
        placeholderView.msgText = "No data found"
        placeholderView.sizeOfIconImageView = CGSizeMake(60, 60)
        
    }
    
    func loading(){
        NSTimer.scheduledTimerWithTimeInterval( 1, target: placeholderView, selector: "stopAnimating", userInfo: nil, repeats: false)
        print("loading...")
    }
```

## Customization

You can customize the following properties of HLPlaceholderView:
``` swift
 var indicatorViewStyle:UIActivityIndicatorViewStyle!
 var msgText:String?
 var imgOfIconImgView:UIImage?
 var sizeOfIconImageView:CGSize!
 var fontOfMsgText:UIFont!
 var backgrountColorOfMsgLabel:UIColor?
```

Use this method to add handing tapping info imageview action
```swift
 func addPlaceholderTapTarget(target:AnyObject!, andAction action:Selector)
```

Use these methods to control the status of view
```swift
 //The activity indicator will start animating, info icon and message label will be hiden
 func startAnimating()
 //Oppositely
func stopAnimating()
```

## License
PlaceHolderView is released under the MIT license.  
See LICENSE for details.
