//
//  ExpendLayoutCellModel.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/8.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "ExpendLayoutCellModel.h"

@implementation ExpendLayoutCellModel

+ (instancetype)modelWithString:(NSString *)string {
    
    ExpendLayoutCellModel *model = [[self class] new];
    model.string                 = string;
    
    return model;
}

@end
