//
//  ConstraintManager.h
//  AutoLayout
//
//  Created by YouXianMing on 2017/7/6.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConstraintItem.h"

@interface ConstraintManager : NSObject

@property (nonatomic) CGFloat        multiplier;
@property (nonatomic) CGFloat        constant;
@property (nonatomic) CGFloat        relation;
@property (nonatomic, weak) UIView  *view;

@property (nonatomic, strong) ConstraintItem *datumView;
@property (nonatomic, strong) ConstraintItem *adjustmentView;

- (instancetype)equalTypeWithConstant:(CGFloat)constant
                     datumBasedOnView:(ConstraintItem *)datumView
                       adjustmentView:(ConstraintItem *)adjustmentView;

- (instancetype)datumBasedOnView:(ConstraintItem *)datumView
                  adjustmentView:(ConstraintItem *)adjustmentView;

- (instancetype)equalTypeWithConstant:(CGFloat)constant
                       adjustmentView:(ConstraintItem *)adjustmentView;

@end

@interface UIView (ConstraintManager)

- (ConstraintManager *)asFatherView;

- (void)asFatherViewToAddConstants:(void(^)(ConstraintManager *fatherView))configBlock;

@end
