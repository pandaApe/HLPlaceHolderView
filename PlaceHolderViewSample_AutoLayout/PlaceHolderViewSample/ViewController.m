
//
//  ViewController.m
//  PlaceHolderView
//
//  Created by Wang HaiLong on 13/2/15.
//  Copyright (c) 2015 Hai Long. All rights reserved.
//

#import "ViewController.h"
#import "PlaceHolderView.h"

@implementation ViewController{
    
    PlaceHolderView *placeholderView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [NSLayoutConstraint activateConstraints:self.webView.constraints];
    
    //    [self.view addSubview:placeholderView];
    //    [placeholderView addConstraints: self.webView.constraints];
    
    //    [placeholderView updateConstraints];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.com.sg"]]];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    if(placeholderView)
        [placeholderView removeFromSuperview];
    
    placeholderView = [[[NSBundle mainBundle]loadNibNamed:@"PlaceHolderView" owner:self options:nil]objectAtIndex:0];
    
    placeholderView.frame = self.webView.bounds;
    placeholderView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    //    placeholderView.backgroundColor = [UIColor redColor];
    [self.webView addSubview:placeholderView];
    
    placeholderView.msgText = @"Sorry, Can not connect to server, please check network configuration";
    
    [placeholderView addPlaceholderTapTarget:self andAction:@selector(reloadWeb)];
}

-(void)reloadWeb{
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://www.google.com.sg/#newwindow=1&q=%@",self.searchBar.text]]]];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.google.com.sg/#newwindow=1&q=%@",searchBar.text]];
    if(!self.networkSwitch.isOn)
        url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.goo12s12gle.com.sg/#newwindow=1&q=%@",searchBar.text]];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    [searchBar resignFirstResponder];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    placeholderView.inProcess = YES;
    placeholderView.hidden = NO;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    placeholderView.inProcess = NO;
        placeholderView.hidden = YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
        placeholderView.hidden = NO;
    placeholderView.inProcess = NO;
}


@end
