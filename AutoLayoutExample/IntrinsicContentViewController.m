//
//  IntrinsicContentViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/10.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "IntrinsicContentViewController.h"
#import "IntrinsicContentSizeView.h"

@interface IntrinsicContentViewController ()

@property (nonatomic, strong) IntrinsicContentSizeView *wrappingView;

@end

@implementation IntrinsicContentViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 通知中心(检测屏幕旋转)
    self.notificationCenter = [DefaultNotificationCenter defaultNotificationCenterWithDelegate:self addNotificationNames:^(NSMutableArray<NSString *> *names) {
        
        [names addObject:UIApplicationDidChangeStatusBarOrientationNotification];
    }];
    
    self.wrappingView = [IntrinsicContentSizeView new];
    self.wrappingView.layer.borderWidth    = 0.5f;
    self.wrappingView.layer.borderColor    = [UIColor redColor].CGColor;
    self.wrappingView                      = self.wrappingView;
    [self.view addSubview:self.wrappingView];
    
    [self.wrappingView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.view);
    }];
    
    self.wrappingView.itemCount               = arc4random() % 100 + 4;
    self.wrappingView.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 100;
    
    // 按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Change ItemCount" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonsEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(-10.f);
        make.left.mas_equalTo(10.f);
    }];
}

- (void)defaultNotificationCenter:(DefaultNotificationCenter *)notification name:(NSString *)name object:(id)object {
    
    if ([name isEqualToString:UIApplicationDidChangeStatusBarOrientationNotification]) {
        
        // 屏幕旋转后重新设置最大宽度
        self.wrappingView.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 100;
    }
}

#pragma mark - 

- (void)buttonsEvent:(UIButton *)button {
    
    self.wrappingView.itemCount = arc4random() % 100 + 4;
}

@end
