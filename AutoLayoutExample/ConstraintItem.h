//
//  ConstraintItem.h
//  AutoLayout
//
//  Created by YouXianMing on 2017/7/5.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ConstraintItem : NSObject

@property (nonatomic, strong) UIView            *view;
@property (nonatomic)         NSLayoutAttribute  attribute;

- (instancetype)set:(NSLayoutAttribute)attribute;

@end

@interface UIView (ConstraintItem)

- (ConstraintItem *)asConstraintItemView;

- (ConstraintItem *)asConstraintItemView_left;
- (ConstraintItem *)asConstraintItemView_right;
- (ConstraintItem *)asConstraintItemView_top;
- (ConstraintItem *)asConstraintItemView_bottom;
- (ConstraintItem *)asConstraintItemView_centerX;
- (ConstraintItem *)asConstraintItemView_centerY;

- (ConstraintItem *)asConstraintItemView_width;
- (ConstraintItem *)asConstraintItemView_height;

- (ConstraintItem *)asConstraintItemView_leftMargin;
- (ConstraintItem *)asConstraintItemView_rightMargin;
- (ConstraintItem *)asConstraintItemView_topMargin;
- (ConstraintItem *)asConstraintItemView_bottomMargin;

- (ConstraintItem *)asConstraintItemView_leading;
- (ConstraintItem *)asConstraintItemView_trailing;
- (ConstraintItem *)asConstraintItemView_leadingMargin;
- (ConstraintItem *)asConstraintItemView_trailingMargin;
- (ConstraintItem *)asConstraintItemView_centerXWithinMargins;
- (ConstraintItem *)asConstraintItemView_centerYWithinMargins;

- (ConstraintItem *)asConstraintItemView_lastBaseline;
- (ConstraintItem *)asConstraintItemView_baseline;
- (ConstraintItem *)asConstraintItemView_firstBaseline;

@end
