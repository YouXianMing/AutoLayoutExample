//
//  CellAutoHeightViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/7.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "CellAutoHeightViewController.h"
#import "CellAutoHeightInfoCell.h"

@interface CellAutoHeightViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation CellAutoHeightViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 通知中心(检测屏幕旋转)
    self.notificationCenter = [DefaultNotificationCenter defaultNotificationCenterWithDelegate:self addNotificationNames:^(NSMutableArray<NSString *> *names) {
        
        [names addObject:UIApplicationDidChangeStatusBarOrientationNotification];
    }];
    
    // 数据源
    self.datas = [NSMutableArray array];
    [self.datas addObject:@"篱笆墙是个历史的产物，它的产生和消失，是农村发展、农民生活变化的见证。"];
    [self.datas addObject:@"漆太太，是陕西陇县人，到底姓什么，也真没有知根知底的。"];
    [self.datas addObject:@"那一年，漆太太的丈夫随渔船下海，突然遇到狂风暴雨，连人带船沉没了大海，从此没有消息。"];
    [self.datas addObject:@"那时虽说是大集体，可是对五保户，那是照顾有加。凡是生产队分东西，如粮食、柴草，蔬菜等，都是要挑最好的先给漆太太送到家。"];
    [self.datas addObject:@"围绕村子里这道最后的篱笆墙，生发了许多故事，至今还流传在故乡的巷子里，铭刻在村里人的记忆中。"];
    
    // tableView
    self.tableView            = [[UITableView alloc] init];
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    // 注册cell
    [self.tableView registerClass:[CellAutoHeightInfoCell class] forCellReuseIdentifier:@"CellAutoHeightInfoCell"];
    
    // 添加tableView约束
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    // 设定预估行高
    self.tableView.estimatedRowHeight  = 45.f;
    self.tableView.rowHeight           = UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellAutoHeightInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellAutoHeightInfoCell" forIndexPath:indexPath];
    cell.data                    = self.datas[indexPath.row];
    [cell loadContent];
    
    return cell;
}

#pragma mark - DefaultNotificationCenterDelegate

- (void)defaultNotificationCenter:(DefaultNotificationCenter *)notification name:(NSString *)name object:(id)object {
    
    if ([name isEqualToString:UIApplicationDidChangeStatusBarOrientationNotification]) {

        // 屏幕旋转后重新加载cell
        [self.tableView reloadData];
    }
}

@end
