//
//  ListViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/7.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "ListViewController.h"
#import "ListItem.h"
#import "EdgeViewController.h"
#import "SetSizeViewController.h"
#import "RelatedWidthAndHeightViewController.h"
#import "AutoDetectViewController.h"
#import "ModifyConstraintViewController.h"
#import "CellAutoHeightViewController.h"
#import "CustomCellAutoHeightViewController.h"
#import "ExpendCellController.h"
#import "TableViewMixLayoutViewController.h"
#import "PriorityConstraintViewController.h"
#import "ConstraintInstallViewController.h"
#import "CompressionResistanceViewController.h"
#import "ContentHuggingViewController.h"
#import "CustomLayoutMixFrameViewController.h"
#import "IntrinsicContentViewController.h"
#import "BaselineLayoutViewController.h"
#import "MultiStyleCellViewController.h"

@interface ListViewController ()

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation ListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16.f]};
    
    // https://oleb.net/blog/2014/03/how-i-learned-to-stop-worrying-and-love-auto-layout/
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.datas                = [NSMutableArray array];
    self.tableView.rowHeight  = 60.f;
    
    [self.datas addObject:[ListItem listItemWithClassName:[EdgeViewController   class]                title:@"设定上下左右边距"]];
    [self.datas addObject:[ListItem listItemWithClassName:[SetSizeViewController class]               title:@"设定具体尺寸"]];
    [self.datas addObject:[ListItem listItemWithClassName:[RelatedWidthAndHeightViewController class] title:@"根据相对性设置宽高"]];
    [self.datas addObject:[ListItem listItemWithClassName:[AutoDetectViewController class]            title:@"根据子view宽高确定父view宽高"]];
    [self.datas addObject:[ListItem listItemWithClassName:[ModifyConstraintViewController class]      title:@"修改约束的情形"]];
    [self.datas addObject:[ListItem listItemWithClassName:[CellAutoHeightViewController class]        title:@"cell自动算高度-版本1"]];
    [self.datas addObject:[ListItem listItemWithClassName:[CustomCellAutoHeightViewController class]  title:@"cell自动算高度-版本2"]];
    [self.datas addObject:[ListItem listItemWithClassName:[ExpendCellController class]                title:@"展开缩放"]];
    [self.datas addObject:[ListItem listItemWithClassName:[TableViewMixLayoutViewController class]    title:@"TableView的cell混合布局"]];
    [self.datas addObject:[ListItem listItemWithClassName:[PriorityConstraintViewController class]    title:@"约束优先级"]];
    [self.datas addObject:[ListItem listItemWithClassName:[ConstraintInstallViewController class]     title:@"Install的使用"]];
    [self.datas addObject:[ListItem listItemWithClassName:[CompressionResistanceViewController class] title:@"CompressionResistance"]];
    [self.datas addObject:[ListItem listItemWithClassName:[ContentHuggingViewController class]        title:@"ContentHugging"]];
    [self.datas addObject:[ListItem listItemWithClassName:[CustomLayoutMixFrameViewController class]  title:@"Layout与Frame混合的自定义view"]];
    [self.datas addObject:[ListItem listItemWithClassName:[IntrinsicContentViewController class]      title:@"IntrinsicContent"]];
    [self.datas addObject:[ListItem listItemWithClassName:[BaselineLayoutViewController class]        title:@"BaselineLayoutView"]];
    [self.datas addObject:[ListItem listItemWithClassName:[MultiStyleCellViewController class]        title:@"多样式cell"]];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell           = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        cell                           = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.selectionStyle            = UITableViewCellSelectionStyleNone;
        cell.accessoryType             = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.textColor = [UIColor grayColor];
    }
    
    // 赋值
    ListItem *item            = self.datas[indexPath.row];
    cell.textLabel.text       = item.title;
    cell.detailTextLabel.text = NSStringFromClass(item.className);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListItem         *item       = self.datas[indexPath.row];
    UIViewController *controller = [item.className new];
    controller.title             = item.title;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
