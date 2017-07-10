//
//  LayoutTypeCell.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/8.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "LayoutTypeCell.h"
#import "Masonry.h"

@interface LayoutTypeCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation LayoutTypeCell

- (void)buildSubview {
    
    self.label               = [UILabel new];
    self.label.numberOfLines = 0;
    [self.contentView addSubview:self.label];
    
    UIView *superView = self.contentView;
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(superView).offset(10);
        make.left.equalTo(superView).offset(10);
        make.bottom.equalTo(superView).offset(-10);
        make.right.equalTo(superView).offset(-10);
    }];
}

- (void)loadContent {
    
    self.label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    self.label.text                    = self.data;
}

@end
