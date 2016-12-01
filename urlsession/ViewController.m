//
//  ViewController.m
//  urlsession
//
//  Created by apple on 2016/11/14.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "ViewController.h"
#import "BlockPass.h"
#import "ShareMenuView.h"
#import "YBAlertView.h"
#import <WebKit/WebKit.h>

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<NSURLSessionDelegate,UITextFieldDelegate, WKNavigationDelegate>

@end

@implementation ViewController
{
    WKWebView *webV;
    UIView *grayView;
    UITextField *textF;
    UIView *bottomView;
    UIButton *backBtn;
    UIButton *forwardBtn;
    UIButton *reloadBtn;
    UIProgressView *progressV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [BlockPass loginWithParam:@{@"lala":@1} success:^(int i) {
//        NSLog(@"successsuccesssuccesssuccess ======  %d", i);
//    } failure:^(int j) {
//        NSLog(@"failurevfailurefailurefailure ======= %d", j);
//    }];
//    [self addBtn];
    webV = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64 - 44)];
    grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, ScreenWidth, 44)];
    grayView.backgroundColor = [UIColor lightGrayColor];
    textF = [[UITextField alloc] initWithFrame:CGRectMake(10, 7, ScreenWidth-20, 30)];
    textF.layer.borderWidth = 1;
    textF.layer.borderColor = [UIColor redColor].CGColor;
    textF.clearButtonMode = UITextFieldViewModeWhileEditing;
    textF.autocorrectionType = UITextAutocorrectionTypeYes;
    textF.keyboardType = UIKeyboardTypeURL;
    textF.returnKeyType = UIReturnKeyGo;
    [grayView addSubview:textF];
    progressV = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 1)];
    [self.view addSubview:progressV];
    textF.delegate = self;
    [self.view addSubview:grayView];
    webV.layer.borderWidth = 1;
    webV.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view insertSubview:webV belowSubview:progressV];
    [webV addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    webV.navigationDelegate = self;
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    //10.3.9.184:8080
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webV loadRequest:request];
    bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-44, ScreenWidth, 44)];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    bottomView.userInteractionEnabled = YES;
    [self.view addSubview:bottomView];
    backBtn = [self btnMake:backBtn text:@"返回" frame:CGRectMake(0, 0, 44, 44)];
    forwardBtn = [self btnMake:forwardBtn text:@"前进" frame:CGRectMake(44, 0, 44, 44)];
    reloadBtn = [self btnMake:reloadBtn text:@"重载" frame:CGRectMake(88, 0, 44, 44)];
    backBtn.enabled = NO;
    forwardBtn.enabled = NO;
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [forwardBtn addTarget:self action:@selector(forward) forControlEvents:UIControlEventTouchUpInside];
    [reloadBtn addTarget:self action:@selector(reload) forControlEvents:UIControlEventTouchUpInside];
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"error" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertC animated:YES completion:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqual: @"estimatedProgress"]) {
        progressV.hidden = (webV.estimatedProgress == 1);
        [progressV setProgress:webV.estimatedProgress animated:YES];
    }
}
- (void)back {
    [webV goBack];
}
- (void)forward {
    [webV goForward];
}
- (void)reload {
    [webV reload];
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"error" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    [alertC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertC animated:YES completion:nil];
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [progressV setProgress:0.0 animated:false];
}
- (UIButton *)btnMake:(UIButton *)btn text:(NSString *)text frame:(CGRect)frame{
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.userInteractionEnabled = YES;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    btn.frame = frame;
    [bottomView addSubview:btn];
    return btn;
}
- (void)lalala  {
    [self loadWebPage:webV];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [webV loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:textField.text]]];
    return NO;
}
// local
-(void)loadLocalPage:(WKWebView*)webView
{
    NSString* htmlPath = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSString *appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:appHtml];
    [webView loadHTMLString:appHtml baseURL:baseURL];
}
// network
-(void)loadWebPage:(WKWebView *)webView
{
    NSURL *url = [NSURL URLWithString:@"http://10.3.9.184:8080"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}
- (void)addBtn {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(50, 100, 40, 30);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(lalala) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
}

@end
