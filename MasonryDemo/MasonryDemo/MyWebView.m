//
//  MyWebView.m
//  MasonryDemo
//
//  Created by 杨启晖 on 14/12/1.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "MyWebView.h"

#define URL @"http://www.baidu.com/"

@implementation MyWebView

-(MyWebView*)init{
    self = [super init];
    if (self) {
        self.scrollView.bounces = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
    }
    return self;
}
+(MyWebView*)webView{
    MyWebView *webView = [[MyWebView alloc]init];
    NSURL *url = [NSURL URLWithString:URL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [webView loadRequest:request];
    return webView;
}

@end
