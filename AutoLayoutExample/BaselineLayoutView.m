//
//  BaselineLayoutView.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/10.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "BaselineLayoutView.h"
#import "Masonry.h"

@interface BaselineLayoutView ()

@property (nonatomic, strong) NSString    *string;
@property (nonatomic, strong) UIImage     *image;

@property (nonatomic, strong) UILabel     *label;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation BaselineLayoutView

+ (instancetype)baselineLayoutViewWithString:(NSString *)string image:(UIImage *)image {
    
    BaselineLayoutView *view = [[self class] new];
    view.string              = string;
    view.image               = image;
    [view initSubViews];
    
    return view;
}

- (void)initSubViews {
    
    self.backgroundColor = [UIColor lightGrayColor];
    
    // 图片
    self.imageView = [[UIImageView alloc] initWithImage:self.image];
    [self addSubview:self.imageView];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    // 以iamgeView的尺寸作为高优先级进行布局
    [self.imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    // 文本
    self.label               = [UILabel new];
    self.label.numberOfLines = 0;
    self.label.font          = [UIFont systemFontOfSize:12.f];
    self.label.textColor     = [UIColor whiteColor];
    self.label.text          = self.string;
    [self addSubview:self.label];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
        make.right.mas_equalTo(-10);
        
        make.bottom.mas_equalTo(self.mas_bottom).offset(-10);
    }];
}

#pragma mark - Overwrite

- (UIView *)viewForLastBaselineLayout {
    
    return self.imageView;
}

@end
