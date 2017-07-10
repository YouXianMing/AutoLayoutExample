//
//  PriorityConstraintViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/8.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "PriorityConstraintViewController.h"

typedef enum : NSUInteger {
    
    kDeleteOrangeViewButton = 1000,
    kDeleteYellowViewButton,
    
} EPriorityConstraintViewControllerTagValue;

@interface PriorityConstraintViewController ()

@property (nonatomic ,strong) UIView *orangeView;
@property (nonatomic ,strong) UIView *yellowView;
@property (nonatomic ,strong) UIView *greenView;

@end

@implementation PriorityConstraintViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self initButtons];
    
    self.orangeView                 = [[UIView alloc] init];
    self.orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.orangeView];
    
    self.yellowView                 = [[UIView alloc] init];
    self.yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.yellowView];
    
    self.greenView                 = [[UIView alloc] init];
    self.greenView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.greenView];
    
    // 橘色(作为基准)
    [self.orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.height.mas_equalTo(50);
        make.bottom.offset(-10);
        
        make.left.offset(10);
    }];
    
    // 黄色
    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.height.mas_equalTo(50);
        make.bottom.offset(-10);
        
        // 用优先级来设定满足条件,此处为2种情况
        make.left.equalTo(self.orangeView.mas_right).offset(10).priorityHigh();
        make.left.equalTo(self.view.mas_left).offset(10).priorityMedium();
    }];
    
    // 绿色
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.height.mas_equalTo(50);
        make.bottom.offset(-10);
        
        // 用优先级来设定满足条件,此处为3种情况
        make.left.equalTo(self.yellowView.mas_right).offset(10).priorityHigh();
        make.left.equalTo(self.orangeView.mas_right).offset(10).priorityMedium();
        make.left.equalTo(self.view.mas_left).offset(10).priorityLow();
    }];
}

- (void)initButtons {

    UIButton *deleteOrangeYellowViewButton = [UIButton buttonWithType:UIButtonTypeSystem];
    deleteOrangeYellowViewButton.tag       = kDeleteOrangeViewButton;
    [deleteOrangeYellowViewButton setTitle:@"删除橘色view" forState:UIControlStateNormal];
    [deleteOrangeYellowViewButton addTarget:self action:@selector(buttonsEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteOrangeYellowViewButton];
    
    [deleteOrangeYellowViewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(64 + 10.f);
        make.left.mas_equalTo(10.f);
    }];
    
    UIButton *deleteYellowViewButton = [UIButton buttonWithType:UIButtonTypeSystem];
    deleteYellowViewButton.tag       = kDeleteYellowViewButton;
    [deleteYellowViewButton setTitle:@"删除黄色view" forState:UIControlStateNormal];
    [deleteYellowViewButton addTarget:self action:@selector(buttonsEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteYellowViewButton];
    
    [deleteYellowViewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(deleteOrangeYellowViewButton.mas_bottom).offset(10.f);
        make.left.mas_equalTo(10.f);
    }];
}

- (void)buttonsEvent:(UIButton *)button {
 
    if (button.tag == kDeleteOrangeViewButton) {
        
        [self.orangeView removeFromSuperview];
        [UIView animateWithDuration:0.5f animations:^{
            
            [self.view layoutIfNeeded];
        }];
        
    } else if (button.tag == kDeleteYellowViewButton) {
        
        [self.yellowView removeFromSuperview];
        [UIView animateWithDuration:0.5f animations:^{
            
            [self.view layoutIfNeeded];
        }];
    }
}

@end
