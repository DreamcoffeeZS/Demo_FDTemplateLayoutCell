//
//  TestViewController.m
//  Test
//
//  Created by zhoushuai on 16/3/7.
//  Copyright © 2016年 zhoushuai. All rights reserved.
//

#import "TestViewController.h"
#import "OrderTableViewCell.h"
#import "UITableView+FDTemplateLayoutCell.h"



//1111

@interface TestViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSString *reuseCellID;
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"测试";
    self.reuseCellID = @"OrderTableViewCellID";
    [self.view addSubview:self.tableView];
    
    //测试数据
    self.dataSource = @[].mutableCopy;
    for (int i = 0; i<30; i++) {
        NSDictionary *dic = @{@"statusName":@"订单已完成",@"orderName":@"一个订单",@"create_time":@"2016-01-08",@"mark":@"helloword",@"nickname":@"zs",@"money":@"66"};
        [self.dataSource addObject:dic];
    }
    
 }


#pragma mark - 代理：UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.reuseCellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.dataDic = self.dataSource[indexPath.row];
     return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //调用了FDTemplateLayoutCell的方法
    return  [tableView fd_heightForCellWithIdentifier:self.reuseCellID configuration:^(OrderTableViewCell *cell) {
        //回调中设置数据
        cell.dataDic = self.dataSource[indexPath.row];
    }];
}


#pragma mark - 视图加载与对象创建
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight- 64) style:UITableViewStylePlain
                      ];
        //注册单元格
        [_tableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:self.reuseCellID];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}






 
@end
