//
//  CustomLayoutMixFrameViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/10.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "CustomLayoutMixFrameViewController.h"
#import "CustomLayoutView.h"
#import "UIView+SetRect.h"

@interface CustomLayoutMixFrameViewController ()

@end

@implementation CustomLayoutMixFrameViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if (arc4random() % 2) {
        
        // Frame形式布局
        CustomLayoutView *mixView = [[CustomLayoutView alloc] initWithFrame:CGRectMake(0, 0, Width - 80.f, 100)];
        mixView.center            = self.view.center;
        [self.view addSubview:mixView];
        
        mixView.label.text = @"Frame 脑袋空了半晌后，我突地拿起电话，打电话同领导请假。";
        
    } else {
     
        // Layout形式布局
        CustomLayoutView *mixView = [CustomLayoutView new];
        [self.view addSubview:mixView];
        
        [mixView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.equalTo(self.view);
            make.left.mas_offset(40.f);
            make.right.mas_offset(-40.f);
            make.height.mas_equalTo(100.f);
        }];
        
        mixView.label.text = @"Layout 脑袋空了半晌后，我突地拿起电话，打电话同领导请假。";
    }
}

@end
