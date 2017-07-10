//
//  ManualLayoutTypeCell.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/8.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "ManualLayoutTypeCell.h"
#import "UIView+SetRect.h"

@interface ManualLayoutTypeCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ManualLayoutTypeCell

- (void)buildSubview {
    
    self.label                         = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, Width - 20.f, 0)];
    self.label.preferredMaxLayoutWidth = Width - 20.f;
    [self.contentView addSubview:self.label];
}

- (void)loadContent {
    
    self.contentView.backgroundColor = self.data;
    self.label.text = @"ManualLayoutTypeCell";
    [self.label sizeToFit];
}

@end
