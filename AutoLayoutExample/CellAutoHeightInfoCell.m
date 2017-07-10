//
//  CellAutoHeightInfoCell.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/7.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "CellAutoHeightInfoCell.h"
#import "Masonry.h"

@interface CellAutoHeightInfoCell ()

@property (nonatomic, strong) UILabel *infoStringLabel;

@end

@implementation CellAutoHeightInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupCell];
        [self buildSubViews];
    }
    
    return self;
}

- (void)setupCell {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)buildSubViews {
    
    self.infoStringLabel               = [UILabel new];
    self.infoStringLabel.numberOfLines = 0;
    [self.contentView addSubview:self.infoStringLabel];
    
    UIView *supperView = self.contentView;
    [self.infoStringLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(supperView.mas_left).offset(10.f);
        make.top.equalTo(supperView.mas_top).offset(10.f);
        make.right.equalTo(supperView.mas_right).offset(-10.f);
        make.bottom.equalTo(supperView.mas_bottom).offset(-10.f);
    }];
    
    // http://blog.csdn.net/yongyinmg/article/details/39526207
    // [self.infoStringLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

- (void)loadContent {
    
    // 设定最大行宽
    self.infoStringLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 20;
    
    // 加载数据
    self.infoStringLabel.text = self.data;
    NSLog(@"loadContent row - %ld", (long)self.indexPath.row);
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    NSLog(@"layoutSubviews row - %ld", (long)self.indexPath.row);
}

@end
