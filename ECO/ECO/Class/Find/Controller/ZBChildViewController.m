//
//  ZBChildViewController.m
//  ECO
//
//  Created by Never on 2017/10/15.
//  Copyright © 2017年 Never. All rights reserved.
//  iPhone 安卓 平板 笔记本 手表页面

#import "ZBChildViewController.h"

#import "YZDisplayViewHeader.h"
//加载页面
#import "FeThreeDotGlow.h"

#import "ZBChildCell.h"

#import "ZBProductDataModel.h"
/** 商品详情 */
#import "ZBDetailViewController.h"

#import "MJRefresh.h"
static NSString *ID = @"cell";

@interface ZBChildViewController ()

@property (strong, nonatomic) FeThreeDotGlow *threeDot;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) MJRefreshNormalHeader *header;

@end

@implementation ZBChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.view.backgroundColor = ViewController_BackGround;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self example03];
    /****滚动完成请求数据*******/
    
    // 如果想要滚动完成或者标题点击的时候，加载数据，需要监听通知
    
    // 监听滚动完成或者点击标题，只要滚动完成，当前控制器就会发出通知
    
    // 只需要监听自己发出的，不需要监听所有对象发出的通知，否则会导致一个控制器发出，所有控制器都能监听,造成所有控制器请求数据
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadUrlData) name:YZDisplayViewClickOrScrollDidFinshNote object:self];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZBChildCell" bundle:nil] forCellReuseIdentifier:ID];
    // 开发中可以搞个蒙版，一开始遮住当前界面，等请求成功，在把蒙版隐藏.
    _threeDot = [[FeThreeDotGlow alloc] initWithView:self.view blur:YES];
    [self.view addSubview:_threeDot];
    // Start
    [_threeDot show];
    
}
- (void)initTableView{
    
    self.tableView.backgroundColor = ViewController_BackGround;
    
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}
#pragma mark UITableView + 下拉刷新 隐藏时间
- (void)example03
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadUrlData)];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    header.automaticallyChangeAlpha = YES;
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 马上进入刷新状态
    [header beginRefreshing];
    self.header = header;
    // 设置header
    self.tableView.mj_header = header;
}
- (void)loadUrlData{
    
    NSArray *urlArr = @[iphone_URL,android_URL,ipad_URL,macbook_URL,watch_URL];
    [self.dataArr removeAllObjects];
    [ZBHTTPRequestManager requestGETWithURLStr:urlArr[self.type-2] paramDic:nil Api_key:nil finish:^(id responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        NSLog(@"responseObject:%@",[dic mj_JSONObject]);
        NSArray *modelArr = [ZBProductDataModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        self.dataArr  = [modelArr mutableCopy];
        [UIView animateWithDuration:1.2 animations:^{
            self.threeDot.alpha = 0;
        } completion:^(BOOL finished) {
            [self.threeDot removeFromSuperview];
        }];
        [self.tableView reloadData];
        [self.header endRefreshing];
    } enError:^(NSError *error) {
        NSLog(@"error.code:%ld",error.code);
        [self.header endRefreshing];
    }];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 384;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZBChildCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[ZBChildCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID viewController:self];
    }
    cell.VC = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.dataArr.count != 0) {
            [cell refreshUI:self.dataArr[indexPath.row]];
    }

    return cell;
}
- (NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
