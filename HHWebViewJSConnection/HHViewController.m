//
//  HHViewController.m
//  HHWebViewJSConnection
//
//  Created by LeAustinHan on 14-2-10.
//  Copyright (c) 2014年 hanhan. All rights reserved.
//

#import "HHViewController.h"

@interface HHViewController ()

@end

@implementation HHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    
    NSURL *url = [[NSURL alloc] initWithString:@"https://www.google.com.hk"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma -mark webView Delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *currentURL = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    //用stringByEvaluatingJavaScriptFromString:方法来调用JS代码
    NSString *title = [_webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    NSLog(@"Print currentURL = %@ \n title = %@",currentURL,title);
    
    NSString *js_result = [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByName('q')[0].value='蝴蝶兰';"];
    
      NSString *js_result2 = [webView stringByEvaluatingJavaScriptFromString:@"document.forms[0].submit(); "];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

#pragma -mark 

@end
