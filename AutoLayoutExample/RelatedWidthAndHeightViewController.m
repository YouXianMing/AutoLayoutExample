//
//  RelatedWidthAndHeightViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/7.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "RelatedWidthAndHeightViewController.h"

@interface RelatedWidthAndHeightViewController ()

@end

@implementation RelatedWidthAndHeightViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIView *redView         = [UIView new];
    redView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5f];
    [self.view addSubview:redView];
    
    UIView *yellowView         = [UIView new];
    yellowView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5f];
    [self.view addSubview:yellowView];
    
    UIView *supperView = self.view;
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 距离左边10
        make.left.equalTo(supperView.mas_left).offset(10);
        
        // 距离底部-10
        make.bottom.equalTo(supperView.mas_bottom).offset(-10);
        
        // 高度为 supperView 高度一半
        make.height.equalTo(supperView.mas_height).multipliedBy(0.5);
        
        // 宽度为 yellowView 的 1/4
        make.width.equalTo(yellowView.mas_width).multipliedBy(0.25);
    }];
    
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        // 距离右边-10
        make.right.equalTo(supperView.mas_right).offset(-10);
        
        // 距离底部-10
        make.bottom.equalTo(supperView.mas_bottom).offset(-10);
        
        // 高度为 redView 1/2
        make.height.equalTo(redView.mas_height).multipliedBy(0.5);
        
        // 距离 redView 右边距离为10
        make.left.equalTo(redView.mas_right).offset(10.f);
    }];
}

@end
