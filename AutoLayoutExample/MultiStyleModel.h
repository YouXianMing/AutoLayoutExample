//
//  MultiStyleModel.h
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/14.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MultiStyleModel : NSObject

@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *address;

@end

NS_INLINE MultiStyleModel * multiStyleModelWith(NSString *company, NSString *userName, NSString *address) {
    
    MultiStyleModel *model = [MultiStyleModel new];
    
    model.company  = company;
    model.userName = userName;
    model.address  = address;
    
    return model;
}
