//
//  ConstraintManager.m
//  AutoLayout
//
//  Created by YouXianMing on 2017/7/6.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "ConstraintManager.h"

@implementation ConstraintManager

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.multiplier = 1.f;
        self.constant   = 0.f;
    }
    
    return self;
}

- (instancetype)constant:(CGFloat)constant
                relation:(NSLayoutRelation)relation
              multiplier:(CGFloat)multiplier
        datumBasedOnView:(ConstraintItem *)datumView
          adjustmentView:(ConstraintItem *)adjustmentView {
    
    self.constant       = constant;
    self.relation       = relation;
    self.multiplier     = multiplier;
    self.datumView      = datumView;
    self.adjustmentView = adjustmentView;

    if (datumView && adjustmentView) {
        
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:adjustmentView.view attribute:adjustmentView.attribute
                                                                      relatedBy:relation
                                                                         toItem:datumView.view attribute:datumView.attribute
                                                                     multiplier:multiplier constant:constant];
        [self.view addConstraint:constraint];
        
    } else if (self.datumView == nil && self.adjustmentView) {
        
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:adjustmentView.view attribute:adjustmentView.attribute
                                                                      relatedBy:relation
                                                                         toItem:nil attribute:kNilOptions
                                                                     multiplier:multiplier constant:constant];
        [self.view addConstraint:constraint];
    }
    
    return self;
}

- (instancetype)equalTypeWithConstant:(CGFloat)constant
                     datumBasedOnView:(ConstraintItem *)datumView
                       adjustmentView:(ConstraintItem *)adjustmentView {
    
    return [self constant:constant
                 relation:NSLayoutRelationEqual
               multiplier:1.f
         datumBasedOnView:datumView
           adjustmentView:adjustmentView];
}

- (instancetype)datumBasedOnView:(ConstraintItem *)datumView
                  adjustmentView:(ConstraintItem *)adjustmentView {
    
    return [self constant:0
                 relation:NSLayoutRelationEqual
               multiplier:1.f
         datumBasedOnView:datumView
           adjustmentView:adjustmentView];
}

- (instancetype)equalTypeWithConstant:(CGFloat)constant
                       adjustmentView:(ConstraintItem *)adjustmentView {
    
    return [self constant:constant
                 relation:NSLayoutRelationEqual
               multiplier:1.f
         datumBasedOnView:nil
           adjustmentView:adjustmentView];
}

@end

@implementation UIView (ConstraintManager)

- (ConstraintManager *)asFatherView {
    
    ConstraintManager *manger = [ConstraintManager new];
    manger.view               = self;
    
    return manger;
}

- (void)asFatherViewToAddConstants:(void(^)(ConstraintManager *fatherView))configBlock {
    
    ConstraintManager *manger = [ConstraintManager new];
    manger.view               = self;
    
    NSParameterAssert(configBlock);
    configBlock(manger);
}

@end
