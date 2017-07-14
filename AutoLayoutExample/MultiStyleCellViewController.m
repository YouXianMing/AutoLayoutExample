//
//  MultiStyleCellViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/14.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "MultiStyleCellViewController.h"
#import "MultiStyleCell.h"
#import "MultiStyleModel.h"

@interface MultiStyleCellViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) NSMutableArray <CellDataAdapter *> *adapters;

@end

@implementation MultiStyleCellViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 通知中心(检测屏幕旋转)
    self.notificationCenter = [DefaultNotificationCenter defaultNotificationCenterWithDelegate:self addNotificationNames:^(NSMutableArray<NSString *> *names) {
        
        [names addObject:UIApplicationDidChangeStatusBarOrientationNotification];
    }];

    // tableView
    self.tableView                    = [UITableView new];
    self.tableView.delegate           = self;
    self.tableView.dataSource         = self;
    self.tableView.rowHeight          = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 45.f;
    self.tableView.separatorStyle     = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    // layout tableView
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    // 注册cell
    [MultiStyleCell registerToTableView:self.tableView];
    
    // 数据源
    self.adapters = [NSMutableArray array];
    [self.adapters addObject:[MultiStyleCell layoutTypeAdapterWithData:multiStyleModelWith(@"太库科技创业发展有限公司", @"YouXianMing", @"北京市海淀区中关村科学院南路2号融科资讯中心B座11层")]];
    [self.adapters addObject:[MultiStyleCell layoutTypeAdapterWithData:multiStyleModelWith(nil, @"YouXianMing", @"北京市海淀区中关村科学院南路2号融科资讯中心B座11层")]];
    [self.adapters addObject:[MultiStyleCell layoutTypeAdapterWithData:multiStyleModelWith(@"太库科技创业发展有限公司", nil, @"北京市海淀区中关村科学院南路2号融科资讯中心B座11层")]];
    [self.adapters addObject:[MultiStyleCell layoutTypeAdapterWithData:multiStyleModelWith(@"太库科技创业发展有限公司", @"YouXianMing", nil)]];
    [self.adapters addObject:[MultiStyleCell layoutTypeAdapterWithData:multiStyleModelWith(nil, nil, @"北京市海淀区中关村科学院南路2号融科资讯中心B座11层")]];
    [self.adapters addObject:[MultiStyleCell layoutTypeAdapterWithData:multiStyleModelWith(@"太库科技创业发展有限公司", nil, nil)]];
    [self.adapters addObject:[MultiStyleCell layoutTypeAdapterWithData:multiStyleModelWith(nil, @"YouXianMing", nil)]];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.adapters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:self.adapters[indexPath.row].cellReuseIdentifier
                                                       forIndexPath:indexPath];
    cell.tableView   = tableView;
    [cell loadContentWithAdapter:self.adapters[indexPath.row] indexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [(CustomCell *)[tableView cellForRowAtIndexPath:indexPath] selectedEvent];
}

#pragma mark - DefaultNotificationCenterDelegate

- (void)defaultNotificationCenter:(DefaultNotificationCenter *)notification name:(NSString *)name object:(id)object {
    
    if ([name isEqualToString:UIApplicationDidChangeStatusBarOrientationNotification]) {
        
        // 屏幕旋转后重新加载cell
        [self.tableView reloadData];
    }
}

@end
