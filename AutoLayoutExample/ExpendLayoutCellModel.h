//
//  ExpendLayoutCellModel.h
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/8.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExpendLayoutCellModel : NSObject

@property (nonatomic)         BOOL      expend;
@property (nonatomic, strong) NSString *string;

+ (instancetype)modelWithString:(NSString *)string;

@end
