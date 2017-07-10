//
//  SetSizeViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/7.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "SetSizeViewController.h"

@interface SetSizeViewController ()

@end

@implementation SetSizeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIView *redView         = [UIView new];
    redView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5f];
    [self.view addSubview:redView];
    
    UIView *yellowView         = [UIView new];
    yellowView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5f];
    [self.view addSubview:yellowView];
    
    UIView *supperView = self.view;
    
    // 设定尺寸100x100,距离左边10,下边-10
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.left.equalTo(supperView.mas_left).offset(10);
        make.bottom.equalTo(supperView.mas_bottom).offset(-10);
    }];
    
    // 设定尺寸100x100,居中
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.center.equalTo(supperView);
    }];
}

@end
