//
//  ViewController.m
//  MasonryDemo
//
//  Created by 杨启晖 on 14/12/1.
//  Copyright (c) 2014年 robert. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *btn1;
@property (strong, nonatomic) UIButton *btn2;
@property (strong, nonatomic) UIButton *btn3;
@property (strong, nonatomic) UILabel *lbl1;
@property (strong, nonatomic) UILabel *lbl2;
@property (strong, nonatomic) UILabel *lbl3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btn1 = [[UIButton alloc] init];
    [self.btn1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:_btn1];
    self.btn2 = [[UIButton alloc] init];
    [self.btn2 setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:_btn2];
    self.btn3 = [[UIButton alloc] init];
    [self.btn3 setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:_btn3];
    self.lbl1 = [[UILabel alloc] init];
    [self.lbl1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:_lbl1];
    self.lbl2 = [[UILabel alloc] init];
    [self.lbl2 setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:_lbl2];
    self.lbl3 = [[UILabel alloc] init];
    [self.lbl3 setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:_lbl3];
    
    /*
     case1:view中心
    */
    //[self masCenter];
    /*
     case2:自定义间距
    */
    //[self masEdge];
    /*
     case3:view等宽
    */
    //[self masEqualWidth];
    /*
     case4:scrollview添加view
    */
    //[self masScrollView];
    /*
     case5:cell中等间距控件
     */
    [self cellEqualWidth];
}
- (void)masCenter{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    WS(ws);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws.view);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@150);
    }];
}
- (void)masEdge{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    WS(ws);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view).with.insets(UIEdgeInsetsMake(60, 30, 60, 30));
    }];
}
- (void)masEqualWidth{
    WS(ws);
    UIView *leftView = [[UIView alloc]init];
    leftView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:leftView];
    
    UIView *rightView = [[UIView alloc]init];
    rightView.backgroundColor = [UIColor redColor];
    [self.view addSubview:rightView];
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(60);
        make.left.mas_equalTo(ws.view.mas_left).with.offset(60);
        make.right.mas_equalTo(rightView.mas_left).with.offset(-10);
        make.height.mas_equalTo(@150);
        make.width.mas_equalTo(rightView);
    }];
    
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(ws.view).with.offset(60);
        make.left.mas_equalTo(leftView.mas_right).with.offset(10);
        make.right.mas_equalTo(ws.view.mas_right).with.offset(-60);
        make.height.mas_equalTo(@150);
        make.width.mas_equalTo(leftView);
    }];
}
-(void)masScrollView{
    WS(ws);
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.backgroundColor = [UIColor blackColor];
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.view);
    }];
    
    UIView *container = [[UIView alloc]init];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(scrollView);
        make.width.mas_equalTo(scrollView);
    }];
    
    UIView *lastView = nil;
    
    for (int i = 0; i < 10; i ++) {
        UIView *subView = [[UIView alloc]init];
        
        subView.backgroundColor = [UIColor colorWithRed: (CGFloat)random()/(CGFloat)RAND_MAX green: (CGFloat)random()/(CGFloat)RAND_MAX blue: (CGFloat)random()/(CGFloat)RAND_MAX alpha:1];
        
        [container addSubview:subView];
        
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.mas_equalTo(container);
            make.height.mas_equalTo(@80);
            
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            }else{
                make.top.mas_equalTo(container.mas_top);
            }

        }];
        
        lastView = subView;
    }
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(lastView.mas_bottom);
    }];
}

static const int Y = 5;
static const int X = 5;
static const int GAP = 5;
static const int LABELHEIGHT = 30;

- (void)cellEqualWidth {
    WS(weakSelf);
    
    [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(X);
        make.right.mas_equalTo(weakSelf.btn2.mas_left).offset(-GAP);
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(Y);
        make.bottom.mas_equalTo(weakSelf.lbl1.mas_top).offset(-Y);
        make.width.mas_equalTo(weakSelf.btn2.mas_width);
    }];
    [self.lbl1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(-GAP);
        make.width.mas_equalTo(weakSelf.btn1.mas_width);
        make.height.mas_equalTo(@(LABELHEIGHT));
        make.centerX.mas_equalTo(weakSelf.btn1.mas_centerX);
    }];
    [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.btn1.mas_right).offset(GAP);
        make.right.mas_equalTo(weakSelf.btn3.mas_left).offset(-GAP);
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(Y);
        make.bottom.mas_equalTo(weakSelf.lbl2.mas_top).offset(-Y);
        make.width.mas_equalTo(weakSelf.btn3.mas_width);
    }];
    [self.lbl2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(-GAP);
        make.width.mas_equalTo(weakSelf.btn2.mas_width);
        make.height.mas_equalTo(@(LABELHEIGHT));
        make.centerX.mas_equalTo(weakSelf.btn2.mas_centerX);
    }];
    [self.btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.btn2.mas_right).offset(GAP);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-GAP);
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(Y);
        make.bottom.mas_equalTo(weakSelf.lbl3.mas_top).offset(-Y);
        make.width.mas_equalTo(weakSelf.btn1.mas_width);
    }];
    [self.lbl3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.view.mas_bottom).offset(-GAP);
        make.width.mas_equalTo(weakSelf.btn3.mas_width);
        make.height.mas_equalTo(@(LABELHEIGHT));
        make.centerX.mas_equalTo(weakSelf.btn3.mas_centerX);
    }];
}
@end
