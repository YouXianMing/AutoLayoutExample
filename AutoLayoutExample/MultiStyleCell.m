//
//  MultiStyleCell.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/14.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "MultiStyleCell.h"
#import "Masonry.h"
#import "MultiStyleModel.h"

@interface MultiStyleCell ()

@property (nonatomic, strong) UILabel *companyLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *addressLabel;

@end

@implementation MultiStyleCell

- (void)setupCell {
    
    self.selectionStyle  = UITableViewCellSelectionStyleNone;
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0).priorityHigh();
        make.top.mas_equalTo(0).priorityHigh();
        make.right.mas_equalTo(0).priorityHigh();
    }];
}

- (void)buildSubview {
    
    UIView *line         = [UIView new];
    line.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5f];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    self.companyLabel               = [UILabel new];
    self.companyLabel.numberOfLines = 0;
    self.companyLabel.font          = [UIFont systemFontOfSize:22];
    [self.contentView addSubview:self.companyLabel];
    
    self.nameLabel               = [UILabel new];
    self.nameLabel.numberOfLines = 0;
    self.nameLabel.font          = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:self.nameLabel];

    self.addressLabel               = [UILabel new];
    self.addressLabel.numberOfLines = 0;
    self.addressLabel.font          = [UIFont systemFontOfSize:14.f];
    self.addressLabel.textColor     = [UIColor lightGrayColor];
    [self.contentView addSubview:self.addressLabel];
}

- (void)loadContent {
    
    self.companyLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 30.f;
    self.nameLabel.preferredMaxLayoutWidth    = [UIScreen mainScreen].bounds.size.width - 30.f;
    self.addressLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 30.f;
    
    MultiStyleModel *model      = self.data;
    UIView          *supperView = self.contentView;
    
    self.companyLabel.text = model.company;
    self.nameLabel.text    = model.userName;
    self.addressLabel.text = model.address;
    
    // companyLabel位置依赖于contentView,如果没有值,则紧贴着contentView的顶部
    [self.companyLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        if (model.company.length > 0) {
            
            make.top.mas_equalTo(15.f);
            make.left.mas_equalTo(15.f);
            
        } else {
         
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(0);
        }
        
        make.bottom.lessThanOrEqualTo(supperView).offset(-15.f);
    }];
    
    // nameLabel位置依赖于companyLabel,如果没有值,则紧贴着companyLabel的顶部
    [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        if (model.userName.length > 0) {
            
            make.top.mas_equalTo(self.companyLabel.mas_bottom).offset(15.f);
            make.left.mas_equalTo(15.f);
            
        } else {
         
            make.top.mas_equalTo(self.companyLabel.mas_bottom).offset(0.f);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(0);
        }

        make.bottom.lessThanOrEqualTo(supperView).offset(-15.f);
    }];
    
    // addressLabel位置依赖于nameLabel,如果没有值,则紧贴着nameLabel的顶部
    [self.addressLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        if (model.address.length > 0) {
            
            make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(15.f);
            make.left.mas_equalTo(15.f);
            
        }  else {
            
            make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(0.f);
            make.left.mas_equalTo(0);
            make.height.mas_equalTo(0);
        }
        
        make.bottom.lessThanOrEqualTo(supperView).offset(-15.f);
    }];
}

@end
