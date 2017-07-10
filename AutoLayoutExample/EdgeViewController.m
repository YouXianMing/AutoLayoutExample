//
//  EdgeViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/7.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController ()

@end

@implementation EdgeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIView *contentView         = [UIView new];
    contentView.backgroundColor = [UIColor redColor];
    [self.view addSubview:contentView];

    if (arc4random() % 2) {
        
        // 直接设置edges
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(UIEdgeInsetsMake(10 + 64.f, 10, 10, 10));
        }];
        
    } else {
        
        // // 设置 left, right, bottom, top
        UIView *supperView = self.view;
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(supperView.mas_top).offset(10 + 64);
            make.left.equalTo(supperView.mas_left).offset(10);
            make.bottom.equalTo(supperView.mas_bottom).offset(-10);
            make.right.equalTo(supperView.mas_right).offset(-10);
        }];
    }
}

@end
