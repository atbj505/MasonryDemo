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
#import "POP.h"

@interface ViewController ()
@property (nonatomic, strong)UIView *myView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    self.myView = [[UIView alloc]init];
    self.myView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.myView];
    [self.myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(ws.view);
        make.width.mas_equalTo(@100);
        make.height.mas_equalTo(@150);
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(springAnimation:)];
    [self.myView addGestureRecognizer:tap];
}
-(void)springAnimation:(UITapGestureRecognizer*)gr{
    POPSpringAnimation *sizeAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    POPSpringAnimation *alphaAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
    
    CGRect frame = self.myView.frame;
    
    if (frame.size.height == 150) {
        sizeAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(SCREENWIDTH, SCREENHEIGHT)];
        alphaAnimation.toValue = @0.3;
    }else{
        sizeAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(100, 150)];
        alphaAnimation.toValue = @1.0;
    }
    
    sizeAnimation.springBounciness = 15.0;
    sizeAnimation.springSpeed = 5.0;
    alphaAnimation.springBounciness = 10.0;
    alphaAnimation.springSpeed = 3.0;
    
    [self.myView.layer pop_addAnimation:sizeAnimation forKey:@"viewSize"];
    [self.view pop_addAnimation:alphaAnimation forKey:@"viewAlpha"];
}


@end
