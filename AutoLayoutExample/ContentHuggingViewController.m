//
//  ContentHuggingViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/8.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "ContentHuggingViewController.h"

@interface ContentHuggingViewController ()

@end

@implementation ContentHuggingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIButton *button          = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.layer.borderWidth  = 0.5f;
    button.layer.borderColor  = [UIColor blackColor].CGColor;
    button.layer.cornerRadius = 4.f;
    [button setTitle:@"ContentHuggingViewController" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    // 重新设定水平方向上button超出宽度适配文本宽度的优先级为500,不设定的话,默认值为250
    [button setContentHuggingPriority:500 forAxis:UILayoutConstraintAxisHorizontal];
    
    __block NSString *showString = nil;
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
        
        // 设置宽度为300,如果优先级低于设定的500,设置的宽度300将失效,如果优先级大于500,设置的宽度300有效
        CGFloat priority = arc4random() % 2 ? 499 : 501;
        make.width.mas_equalTo(300.f).priority(priority);
        
        showString = [NSString stringWithFormat:@"优先级: %.0f %@", priority, priority > 500 ? @"超出宽度设定有效" : @"超出宽度设定无效"];
    }];
    
    UILabel *label                = [UILabel new];
    label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
    }];
    label.text = showString;
}

@end
