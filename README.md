# Place Holder View
## What it can be used for?
When you're working on a new app, sometimes it's easier to start with dummy views and slowly replace them as you implement their functionality. Rather than use a simple UIView for this, PlaceholderView gives you a better looking placeholder view that shows its dimensions and an optional title.

## Usage
### initialization
```Objective-C
    placeholderView = [[PlaceholderView alloc]initWithFrame:self.webView.frame];

    [placeholderView setPlaceholderImage:[UIImage imageNamed:@"info"] withImageSize:CGSizeMake(60, 60) andMessage:@"Sorry, Can not connect to server, please check network configuration"];
    [placeholderView addPlaceholderTapTarget:self andAction:@selector(reloadWeb)];

    [self.view addSubview:placeholderView];
```
### setting processing and hide
```Objective-C
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

```
## License
PlaceHolderView is released under the MIT license.  
See LICENSE for details.
