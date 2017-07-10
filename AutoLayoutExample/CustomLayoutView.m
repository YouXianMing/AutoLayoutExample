//
//  CustomLayoutView.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/10.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "CustomLayoutView.h"
#import "UIView+SetRect.h"

@interface CustomLayoutView ()

@end

@implementation CustomLayoutView

- (instancetype)init {
    
    NSLog(@"[CustomLayoutView new]");
    if (self = [super init]) {
        
        [self initSubViews];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    NSLog(@"[[CustomLayoutView alloc] initWithFrame:frame]");
    if (self = [super initWithFrame:frame]) {
        
        [self initSubViews];
    }
    
    return self;
}

- (void)initSubViews {
    
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = [UIColor redColor].CGColor;
    
    if (!self.label) {
        
        // 传统frame模式的label
        self.label                   = [[UILabel alloc] initWithFrame:CGRectZero];
        self.label.layer.borderWidth = 0.5f;
        self.label.numberOfLines     = 0;
        self.label.layer.borderColor = [UIColor greenColor].CGColor;
        self.label.top               = 10.f;
        self.label.left              = 10.f;
        [self addSubview:self.label];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];

    // 只影响frame形式的布局
    self.label.width = self.width - 20.f;
    [self.label sizeToFit];
}

@end
