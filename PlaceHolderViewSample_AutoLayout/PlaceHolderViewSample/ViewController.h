//
//  ViewController.h
//  PlaceHolderViewSample
//
//  Created by Wang HaiLong on 14/7/15.
//  Copyright (c) 2015 Hai Long. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceHolderView.h"

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UISwitch *networkSwitch;

@end

