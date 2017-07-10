//
//  ConstraintInstallViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/8.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "ConstraintInstallViewController.h"

@interface ConstraintInstallViewController () {
    
    BOOL _isUninstalled;
}

@property (nonatomic, strong) MASConstraint *constraint;

@end

@implementation ConstraintInstallViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self initButton];
    
    UIView *redView         = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.height.mas_equalTo(100).priorityMedium();
        make.center.equalTo(self.view);
        
        self.constraint = make.width.height.mas_equalTo(200).priorityHigh();
    }];
}

- (void)initButton {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"uninstall" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonsEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(-10);
    }];
}

- (void)buttonsEvent:(UIButton *)button {
    
    if (_isUninstalled == NO) {
        
        _isUninstalled = YES;
        [button setTitle:@"install" forState:UIControlStateNormal];
        [self.constraint uninstall];

        
    } else {
        
        _isUninstalled = NO;
        [button setTitle:@"uninstall" forState:UIControlStateNormal];
        [self.constraint install];
    }
    
    button.enabled = NO;
    
    [UIView animateWithDuration:0.5f animations:^{
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        button.enabled = YES;
    }];
}

@end
