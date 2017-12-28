//
//  EWMineVC.m
//  ECO
//
//  Created by Never on 2017/10/31.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "EWMineVC.h"
//我的企业采购
#import "EWMyPurchaseVC.h"

static NSString *Cell = @"cell";

@interface EWMineVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *cellDataArr;

@property (nonatomic, strong) UIView *headView;

@end

@implementation EWMineVC

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
    
    switch (indexPath.row) {
        case 0:
            {
                EWMyPurchaseVC *VC = [[EWMyPurchaseVC alloc] init];
                VC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:VC animated:YES];
            }
            break;
            
        default:
            break;
    }
}
- (UIView *)headView{
    
    if (!_headView) {
        _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 180)];
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 75, screen_width, 30)];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.text = @"长城物业集团股份有限公司";
        lab.textColor = [UIColor whiteColor];
        [_headView addSubview:lab];
        _headView.backgroundColor = [UIColor themeColor];
    }
    return _headView;
}


@end
