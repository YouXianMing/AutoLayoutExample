//
//  AutoDetectViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/7.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "AutoDetectViewController.h"

@interface AutoDetectViewController ()

@end

@implementation AutoDetectViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 载体view
    UIView *contentView           = [[UIView alloc] init];
    contentView.layer.borderColor = [UIColor redColor].CGColor;
    contentView.layer.borderWidth = 0.5f;
    [self.view addSubview:contentView];
    
    // 红色view
    UIView *redView         = [UIView new];
    redView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.75f];
    [contentView addSubview:redView];
    
    // 绿色view
    UIView *greenView         = [UIView new];
    greenView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.75f];
    [contentView addSubview:greenView];
    
    if (arc4random() % 2) {
     
        /* ---------------------- */
        /* lessThanOrEqualTo的使用 */
        /* ---------------------- */
        
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self.view);
        }];
        
        UIView *supperView = contentView;
        
        [redView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            // 设定尺寸
            make.size.mas_equalTo(CGSizeMake(arc4random() % 50 + 50, arc4random() % 50 + 50));
            
            // 左边与 supperView 左边对齐
            make.left.equalTo(supperView.mas_left);
            
            // 顶部与 supperView 顶部对齐
            make.top.equalTo(supperView.mas_top);
            
            // 底部小于或者等于 supperView 的底部
            make.bottom.lessThanOrEqualTo(supperView.mas_bottom);
        }];
        
        [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            // 设定尺寸
            make.size.mas_equalTo(CGSizeMake(arc4random() % 50 + 50, arc4random() % 50 + 50));
            
            // 左边距离 redView 右边距离10
            make.left.equalTo(redView.mas_right).offset(10);
            
            // 顶部与 supperView 顶部对齐
            make.top.equalTo(supperView.mas_top);
            
            // 右边与 supperView 右边对齐
            make.right.equalTo(supperView.mas_right);
            
            // 底部小于或者等于 supperView 的底部
            make.bottom.lessThanOrEqualTo(supperView.mas_bottom);
        }];
        
    } else {
        
        /* ------------------------- */
        /* greaterThanOrEqualTo的使用 */
        /* ------------------------- */
        
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self.view);
            
            // 底部大于或者等于 redView 的底部
            make.bottom.greaterThanOrEqualTo(redView.mas_bottom);
            
            // 底部大于或者等于 greenView 的底部
            make.bottom.greaterThanOrEqualTo(greenView.mas_bottom);
        }];
        
        UIView *supperView = contentView;
        
        [redView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            // 设定尺寸
            make.size.mas_equalTo(CGSizeMake(arc4random() % 50 + 50, arc4random() % 50 + 50));
            
            // 左边与 supperView 左边对齐
            make.left.equalTo(supperView.mas_left);
            
            // 顶部与 supperView 顶部对齐
            make.top.equalTo(supperView.mas_top);
        }];
        
        [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            // 设定尺寸
            make.size.mas_equalTo(CGSizeMake(arc4random() % 50 + 50, arc4random() % 50 + 50));
            
            // 左边距离 redView 右边距离10
            make.left.equalTo(redView.mas_right).offset(10);
            
            // 顶部与 supperView 顶部对齐
            make.top.equalTo(supperView.mas_top);
            
            // 右边与 supperView 右边对齐
            make.right.equalTo(supperView.mas_right);
        }];
    }
}

@end
