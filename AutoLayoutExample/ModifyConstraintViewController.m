//
//  ModifyConstraintViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/7.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "ModifyConstraintViewController.h"

@interface ModifyConstraintViewController ()

@end

@implementation ModifyConstraintViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIView *redView         = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *supperView = self.view;
    
    if (arc4random() % 2) {
        
        /* --------------------------- */
        /* mas_updateConstraints更新约束 */
        /* --------------------------- */
        
        [redView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            // 距离左边10
            make.left.equalTo(supperView.mas_left).offset(10.f);
            
            // 距离底部-10
            make.bottom.equalTo(supperView.mas_bottom).offset(-10.f);
            
            // 设定尺寸100x100
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        
        [GCDQueue executeInMainQueue:^{
            
            // 更新约束
            [redView mas_updateConstraints:^(MASConstraintMaker *make) {
                
                // 重新设定尺寸为200x200
                make.size.mas_equalTo(CGSizeMake(200, 200));
            }];
            
        } afterDelaySecs:2.f];
        
    } else {
        
        /* ---------------------- */
        /* MASConstraint对象更新约束 */
        /* ---------------------- */
        
        MASConstraint __block *constraint = nil;
        
        [redView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            // 距离左边10
            make.left.equalTo(supperView.mas_left).offset(10.f);
            
            // 距离底部-10
            make.bottom.equalTo(supperView.mas_bottom).offset(-10.f);
            
            // (获取设定尺寸的约束) 设定尺寸100x100
            constraint = make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        
        [GCDQueue executeInMainQueue:^{
            
            // 重新设置设定尺寸的约束
            constraint.mas_equalTo(CGSizeMake(200, 200));
            
        } afterDelaySecs:2.f];
    }
}

@end
