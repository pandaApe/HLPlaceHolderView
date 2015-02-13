//
//  ViewController.m
//  PlaceHolderView
//
//  Created by Wang HaiLong on 13/2/15.
//  Copyright (c) 2015 Hai Long. All rights reserved.
//

#import "ViewController.h"
#import "PlaceholderView.h"

@implementation ViewController{

    PlaceholderView *placeholderView;

}

- (void)viewDidLoad {
    [super viewDidLoad];

    placeholderView = [[PlaceholderView alloc]initWithFrame:self.webView.frame];

    [placeholderView setPlaceholderImage:[UIImage imageNamed:@"info"] withImageSize:CGSizeMake(60, 60) andMessage:@"Sorry, Can not connect to server, please check network configuration"];
    [placeholderView addPlaceholderTapTarget:self andAction:@selector(reloadWeb)];

    [self.view addSubview:placeholderView];

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.com.sg"]]];
}

-(void)reloadWeb{

    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://www.google.com.sg/#newwindow=1&q=%@",self.searchBar.text]]]];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://www.google.com.sg/#newwindow=1&q=%@",searchBar.text]]]];
    [searchBar resignFirstResponder];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    placeholderView.isInProcess = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    placeholderView.isInProcess = NO;
    placeholderView.hidden = YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    placeholderView.isInProcess = NO;
    placeholderView.hidden = NO;
}



@end
