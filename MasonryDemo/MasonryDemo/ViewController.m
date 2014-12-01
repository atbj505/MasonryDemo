//
//  ViewController.m
//  MasonryDemo
//
//  Created by 杨启晖 on 14/12/1.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "MyWebView.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WS(ws);
    MyWebView *webView = [MyWebView webView];
    [self.view addSubview:webView];
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
}
@end
