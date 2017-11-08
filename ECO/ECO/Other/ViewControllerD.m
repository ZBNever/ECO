//
//  ViewControllerD.m
//  UI-day7-UITabbarController分栏控制器
//
//  Created by liufy on 15/7/28.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerD.h"

static NSString *Cell = @"cell";

@interface ViewControllerD ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *cellDataArr;

@property (nonatomic, strong) UIView *headView;

@end

@implementation ViewControllerD

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [BaseMethod controller:self Title:@"我的" tabBarItemImage:@"me_gray" tabBarItemSelectedImage:@"me_green"];

        

        [self initData];
    }
    return self;
}

- (void)initData{
    
    _cellDataArr = @[@"我的采购",@"我的售后",@"地址管理",@"使用帮助"];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //标题颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor],NSForegroundColorAttributeName,nil]];
    
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headView;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _cellDataArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
    cell.imageView.image = [UIImage imageNamed:@"Setting-click"];
    cell.textLabel.text = _cellDataArr[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //cell被点击恢复
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (UIView *)headView{
    
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 180)];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 75, screen_width, 30)];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = @"长城物业集团股份有限公司";
        lab.textColor = [UIColor whiteColor];
        [_headView addSubview:lab];
        _headView.backgroundColor = [UIColor orangeColor];
    }
     return _headView;
}

@end
