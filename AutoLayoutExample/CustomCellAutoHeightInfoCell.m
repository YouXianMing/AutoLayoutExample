//
//  CustomCellAutoHeightInfoCell.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/7.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "CustomCellAutoHeightInfoCell.h"
#import "NSAttributedString+AttributedStringConfig.h"
#import "ParagraphAttributeConfig.h"
#import "FontAttributeConfig.h"
#import "UIView+SetRect.h"
#import "Masonry.h"

@interface CustomCellAutoHeightInfoCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel     *label;
@property (nonatomic, strong) UIView      *lineView;

@end

@implementation CustomCellAutoHeightInfoCell

- (void)buildSubview {
    
    self.iconImageView                 = [UIImageView new];
    self.iconImageView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5f];
    [self.contentView addSubview:self.iconImageView];
    
    self.label               = [UILabel new];
    self.label.numberOfLines = 0;
    [self.contentView addSubview:self.label];
    
    self.lineView                 = [UIView new];
    self.lineView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.25f];
    [self.contentView addSubview:self.lineView];
    
    UIView *supperView = self.contentView;
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(supperView.mas_top).offset(10);
        make.left.equalTo(supperView.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(50.f, 50.f));
        
        make.bottom.lessThanOrEqualTo(supperView.mas_bottom).offset(-10.f);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(supperView.mas_top).offset(10);
        make.left.equalTo(self.iconImageView.mas_right).offset(10.f);
        make.right.equalTo(supperView.mas_right).offset(-10.f);
        
        make.bottom.lessThanOrEqualTo(supperView.mas_bottom).offset(-10.f);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(supperView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left).offset(10.f);
        make.right.equalTo(self.contentView.mas_right).offset(-10.f);
        make.height.equalTo(@1);
    }];
}

- (void)loadContent {
    
    // 更新约束
    [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        if (self.indexPath.row % 2) {
            
            make.left.equalTo(self.contentView.mas_left).offset(50.f);
            make.right.equalTo(self.contentView.mas_right).offset(-50.f);
            
        } else {
            
            make.left.equalTo(self.contentView.mas_left).offset(10.f);
            make.right.equalTo(self.contentView.mas_right).offset(-10.f);
        }
    }];
    
    // 设定最大行宽
    self.label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 10 - 50 - 20;
    
    // 加载数据
    self.label.attributedText = [NSAttributedString attributedStringWithString:self.data config:^(NSMutableArray<AttributedStringConfig *> *configs) {
        
        NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
        style.lineSpacing              = 5.f;
        
        [configs addObject:[ParagraphAttributeConfig configWithParagraphStyle:style]];
        [configs addObject:[FontAttributeConfig configWithFont:[UIFont systemFontOfSize:12.f]]];
    }];;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    [super setHighlighted:highlighted animated:animated];
    
    // 更新约束值
    [self.iconImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_left).offset(highlighted ? 15 : 10);
    }];
    
    [UIView animateWithDuration:0.25f delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        
        [self.contentView layoutIfNeeded];
        self.contentView.backgroundColor = highlighted ? [[UIColor grayColor] colorWithAlphaComponent:0.15f] : [UIColor whiteColor];
        
    } completion:nil];
}

@end
