//
//  CellAutoHeightInfoCell.h
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/7.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellAutoHeightInfoCell : UITableViewCell

@property (nonatomic, weak) id           data;
@property (nonatomic, weak) NSIndexPath *indexPath;

- (void)buildSubViews;
- (void)loadContent;
- (void)setupCell;

@end
