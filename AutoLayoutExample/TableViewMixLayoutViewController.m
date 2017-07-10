//
//  TableViewMixLayoutViewController.m
//  AutoLayoutExample
//
//  Created by YouXianMing on 2017/7/8.
//  Copyright © 2017年 TechCode. All rights reserved.
//

#import "TableViewMixLayoutViewController.h"
#import "ManualLayoutTypeCell.h"
#import "LayoutTypeCell.h"

@interface TableViewMixLayoutViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray <CellDataAdapter *> *adapters;
@property (nonatomic, strong) UITableView                        *tableView;

@end

@implementation TableViewMixLayoutViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 通知中心(检测屏幕旋转)
    self.notificationCenter = [DefaultNotificationCenter defaultNotificationCenterWithDelegate:self addNotificationNames:^(NSMutableArray<NSString *> *names) {
        
        [names addObject:UIApplicationDidChangeStatusBarOrientationNotification];
    }];
    
    // 数据源
    NSArray *strings = @[@"这是一个真实的地方，这里的人实实在在地过着属于他们自己的日子，充满好奇的你对他们的故事有兴趣，请跟西西一起来看看听听。",
                         @"这的确是一个村落，但是当地人不喜欢叫它村，而是自豪的称为城，而且是古城。如果你是初到古城请一定静下心来听当地人讲讲古城墙、古碑林、罗隐故里……这是他们几辈人积攒的宝贝，在你面前拿出来炫耀说明没有拿你当外人。"];
    self.adapters = [NSMutableArray array];
    [self.adapters addObject:[LayoutTypeCell       layoutTypeAdapterWithData:strings[0]]];                                      // 自动布局的cell
    [self.adapters addObject:[LayoutTypeCell       layoutTypeAdapterWithData:strings[1]]];                                      // 自动布局的cell
    [self.adapters addObject:[ManualLayoutTypeCell dataAdapterWithData:[self randomColor] cellHeight:arc4random() % 100 + 50]]; // 手动布局cell
    [self.adapters addObject:[ManualLayoutTypeCell dataAdapterWithData:[self randomColor] cellHeight:arc4random() % 100 + 50]]; // 手动布局cell
    [self.adapters addObject:[ManualLayoutTypeCell dataAdapterWithData:[self randomColor] cellHeight:arc4random() % 100 + 50]]; // 手动布局cell
    [self.adapters addObject:[ManualLayoutTypeCell dataAdapterWithData:[self randomColor] cellHeight:arc4random() % 100 + 50]]; // 手动布局cell
    [self.adapters addObject:[ManualLayoutTypeCell dataAdapterWithData:[self randomColor] cellHeight:arc4random() % 100 + 50]]; // 手动布局cell
    [self.adapters addObject:[ManualLayoutTypeCell dataAdapterWithData:[self randomColor] cellHeight:arc4random() % 100 + 50]]; // 手动布局cell
    [self.adapters addObject:[ManualLayoutTypeCell dataAdapterWithData:[self randomColor] cellHeight:arc4random() % 100 + 50]]; // 手动布局cell
    
    if (arc4random() % 2) {
        
        // tableView的layout布局
        self.tableView = [UITableView new];
        [self.view addSubview:self.tableView];
        
        // 布局
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        NSLog(@"TableView的layout布局模式(cell混合了自动布局以及手动布局)");
        
    } else {
        
        // tableView的frame布局
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:self.tableView];
        
        NSLog(@"TableView的frame布局模式(cell混合了自动布局以及手动布局)");
    }
    
    // tableView设置
    self.tableView.separatorStyle     = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate           = self;
    self.tableView.dataSource         = self;
    self.tableView.estimatedRowHeight = 50.f;
    
    // 注册cell
    [LayoutTypeCell       registerToTableView:self.tableView];
    [ManualLayoutTypeCell registerToTableView:self.tableView];
}

- (UIColor *)randomColor {
    
    return [UIColor colorWithRed:arc4random() % 256 / 255.f
                           green:arc4random() % 256 / 255.f
                            blue:arc4random() % 256 / 255.f
                           alpha:0.5f];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.adapters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView dequeueReusableCellAndLoadDataWithAdapter:self.adapters[indexPath.row] indexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView cellHeightWithAdapter:self.adapters[indexPath.row]];
}

#pragma mark - DefaultNotificationCenterDelegate

- (void)defaultNotificationCenter:(DefaultNotificationCenter *)notification name:(NSString *)name object:(id)object {
    
    if ([name isEqualToString:UIApplicationDidChangeStatusBarOrientationNotification]) {
        
        // 屏幕旋转后重新加载cell
        [self.tableView reloadData];
    }
}

@end
