//
//  ZBDetailViewController.m
//  ECO
//
//  Created by Never on 2017/10/17.
//  Copyright © 2017年 Never. All rights reserved.
//  商品详情页面

#import "ZBDetailViewController.h"
#import "SDCycleScrollView.h"

static NSString *ID = @"cell";

@interface ZBDetailViewController ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@end

@implementation ZBDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    self.view.backgroundColor = ViewController_BackGround;
    [self loadUrlData:self.product_id];
    self.tableView.tableHeaderView = self.cycleScrollView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)loadUrlData:(NSString *)product_id{
    
    [ZBHTTPRequestManager requestGETWithURLStr:detail_URL(product_id) paramDic:nil Api_key:nil finish:^(id responseObject) {
        NSLog(@"responseObject:%@",responseObject);
//        self.dataArr  = [ZBProductDataModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
//        //        self.dataArr = [modelArr mutableCopy];
//        [self.cover removeFromSuperview];
//        [self.tableView reloadData];
    } enError:^(NSError *error) {
        
    }];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
//    if (cell == nil) {
//        cell = [[ZBChildCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID viewController:self];
//    }
//    cell.VC = self;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    if (self.dataArr.count != 0) {
//        [cell refreshUI:self.dataArr[indexPath.row]];
//    }
    
    return cell;
}


- (SDCycleScrollView *)cycleScrollView{
    
    if (!_cycleScrollView) {
        //轮播图
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, screen_width, screen_width*(180/375.0)) delegate:self placeholderImage:[UIImage imageNamed:@"viodImage"]];
//        _cycleScrollView.imageURLStringsGroup = self.bannerImgArr;
        _cycleScrollView.autoScrollTimeInterval = 4.0;
        _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _cycleScrollView;
    
}
- (NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

@end
