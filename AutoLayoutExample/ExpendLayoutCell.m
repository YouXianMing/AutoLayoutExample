//
//  ExpendLayoutCell.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/8.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "ExpendLayoutCell.h"
#import "ExpendLayoutCellModel.h"
#import "Masonry.h"

@interface ExpendLayoutCell ()

@property (nonatomic, strong) UIView         *lineView;
@property (nonatomic, strong) UILabel        *label;
@property (nonatomic, strong) MASConstraint  *constraint;

@end

@implementation ExpendLayoutCell

- (void)buildSubview {
    
    self.lineView                 = [UIView new];
    self.lineView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5f];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    self.label               = [UILabel new];
    self.label.numberOfLines = 0;
    [self.contentView addSubview:self.label];
    
    [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(10.f);
        make.top.mas_equalTo(10.f);
        make.right.mas_equalTo(-10.f);
        make.height.mas_equalTo([UIFont labelFontSize]);
    }];
}

- (void)loadContent {
    
    self.label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    
    ExpendLayoutCellModel *model = self.data;
    self.label.text              = model.string;
    
    if (model.expend == YES) {
        
        [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(10.f);
            make.top.mas_equalTo(10.f);
            make.right.mas_equalTo(-10.f);
            make.bottom.mas_lessThanOrEqualTo(-10.f);
        }];
        
    } else {
        
        [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(10.f);
            make.top.mas_equalTo(10.f);
            make.right.mas_equalTo(-10.f);
            make.height.mas_equalTo([UIFont labelFontSize]);
        }];
    }
}

- (void)selectedEvent {
    
    ExpendLayoutCellModel *model = self.data;

    if (model.expend == YES) {
        
        [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(10.f);
            make.top.mas_equalTo(10.f);
            make.right.mas_equalTo(-10.f);
            make.height.mas_equalTo([UIFont labelFontSize]);
        }];
        
    } else {
        
        [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.left.mas_equalTo(10.f);
            make.top.mas_equalTo(10.f);
            make.right.mas_equalTo(-10.f);
            make.bottom.mas_lessThanOrEqualTo(-10.f);
        }];
    }
    
    model.expend = !model.expend;
    
    // 执行动画
    [UIView animateWithDuration:0.25f animations:^{
    
        [self.label.superview layoutIfNeeded];
    }];
    
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

@end
