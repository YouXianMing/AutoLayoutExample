//
//  ConstraintItem.m
//  AutoLayout
//
//  Created by YouXianMing on 2017/7/5.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "ConstraintItem.h"

@implementation ConstraintItem

- (instancetype)set:(NSLayoutAttribute)attribute {
    
    self.attribute = attribute;
    return self;
}

@end

@implementation UIView (ConstraintItem)

- (ConstraintItem *)asConstraintItemView {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeNotAnAttribute;
    return item;
}

- (ConstraintItem *)asConstraintItemView_left {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeLeft;
    return item;
}

- (ConstraintItem *)asConstraintItemView_right {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeRight;
    return item;
}

- (ConstraintItem *)asConstraintItemView_top {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeTop;
    return item;
}

- (ConstraintItem *)asConstraintItemView_bottom {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeBottom;
    return item;
}

- (ConstraintItem *)asConstraintItemView_leading {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeLeading;
    return item;
}

- (ConstraintItem *)asConstraintItemView_trailing {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeTrailing;
    return item;
}

- (ConstraintItem *)asConstraintItemView_width {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeWidth;
    return item;
}

- (ConstraintItem *)asConstraintItemView_height {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeHeight;
    return item;
}

- (ConstraintItem *)asConstraintItemView_centerX {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeCenterX;
    return item;
}

- (ConstraintItem *)asConstraintItemView_centerY {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeCenterY;
    return item;
}

- (ConstraintItem *)asConstraintItemView_lastBaseline {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeLastBaseline;
    return item;
}

- (ConstraintItem *)asConstraintItemView_baseline {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeBaseline;
    return item;
}

- (ConstraintItem *)asConstraintItemView_firstBaseline {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeFirstBaseline;
    return item;
}

- (ConstraintItem *)asConstraintItemView_leftMargin {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeLeftMargin;
    return item;
}

- (ConstraintItem *)asConstraintItemView_rightMargin {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeRightMargin;
    return item;
}

- (ConstraintItem *)asConstraintItemView_topMargin {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeTopMargin;
    return item;
}

- (ConstraintItem *)asConstraintItemView_bottomMargin {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeBottomMargin;
    return item;
}

- (ConstraintItem *)asConstraintItemView_leadingMargin {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeLeadingMargin;
    return item;
}

- (ConstraintItem *)asConstraintItemView_trailingMargin {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeTrailingMargin;
    return item;
}

- (ConstraintItem *)asConstraintItemView_centerXWithinMargins {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeCenterXWithinMargins;
    return item;
}

- (ConstraintItem *)asConstraintItemView_centerYWithinMargins {
    
    ConstraintItem *item = [ConstraintItem new];
    item.view            = self;
    item.attribute       = NSLayoutAttributeCenterYWithinMargins;
    return item;
}

@end
