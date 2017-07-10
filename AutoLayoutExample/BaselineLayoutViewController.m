//
//  BaselineLayoutViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/10.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "BaselineLayoutViewController.h"
#import "BaselineLayoutView.h"

@interface BaselineLayoutViewController ()

@end

@implementation BaselineLayoutViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // BaselineLayoutView 01
    BaselineLayoutView *baseLineView_01 = [BaselineLayoutView baselineLayoutViewWithString:@"不知从什么时候开始，对一片沉寂的冬天，以及纷扬洁白的雪花，生出了一种极其厌恶的情绪。"
                                                                                     image:[UIImage imageNamed:@"baseLineView_01"]];
    [self.view addSubview:baseLineView_01];
    
    
    [baseLineView_01 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.view);
        make.left.mas_equalTo(10);
    }];
    
    // BaselineLayoutView 02
    BaselineLayoutView *baseLineView_02 = [BaselineLayoutView baselineLayoutViewWithString:@"青春年少，任性而潇洒，像森林里一排不甘在下的幼林，倔强的生长，寻觅属于自己的广阔天空。"
                                                                                     image:[UIImage imageNamed:@"baseLineView_02"]];
    [self.view addSubview:baseLineView_02];
    
    [baseLineView_02 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.baseline.equalTo(baseLineView_01.mas_baseline);
        make.right.mas_equalTo(-10.f);
    }];
}

@end
