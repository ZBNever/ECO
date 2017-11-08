//
//  ZBDetailViewController.m
//  ECO
//
//  Created by Never on 2017/10/17.
//  Copyright © 2017年 Never. All rights reserved.
//  商品详情页面

#import "ZBDetailViewController.h"
#import "SDCycleScrollView.h"
#import "ZBDetailFirstCell.h"
#import "ZBDetailSecondCell.h"
#import "ZBDetailThirdCell.h"
#import "ZBProductDetailModel.h"

static NSString *ID = @"cell";
static NSString *SCell = @"SCell";
static NSString *TCell = @"TCell";

@interface ZBDetailViewController ()<SDCycleScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@property (nonatomic, strong) UIView *buttonView;

@property (nonatomic, strong) NSMutableArray *bannerImgArr;

@property (nonatomic, strong) ZBProductDetailModel *dataModel;

@property (nonatomic, strong) UIButton *collectionBtn;

@property (nonatomic, assign) BOOL isCollection;

@property (nonatomic, assign) BOOL isBuy;
@end

@implementation ZBDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    self.view.backgroundColor = ViewController_BackGround;
    //右边收藏按钮
    [self creatRightItemBtn];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.buttonView];
    //请求数据
    [self loadUrlData:self.product_id];
    //注册cell
    [self registerCell];
}

- (void)creatRightItemBtn{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"collection_gray"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"collection_red"] forState:UIControlStateSelected];
    [rightBtn addTarget:self action:@selector(collectionAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    rightBtn.selected = self.isCollection = [[NSUserDefaults standardUserDefaults] boolForKey:self.product_id];
    self.collectionBtn = rightBtn;
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.cycleScrollView;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
    
}

//收藏
-  (void)collectionAction:(UIButton *)sender{
    
    self.isCollection =  self.collectionBtn.selected = !sender.selected;
    [[NSUserDefaults standardUserDefaults] setBool:self.isCollection forKey:self.product_id];
    self.productModel.type = @"2";
    if ([ZFMDBTool containsData:self.productModel]) {
        [ZFMDBTool deleteData:self.productModel];
    }else{
        [ZFMDBTool insertData:self.productModel];
    }
    
}
//注册cell
- (void)registerCell{
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZBDetailFirstCell" bundle:nil] forCellReuseIdentifier:ID];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZBDetailSecondCell" bundle:nil] forCellReuseIdentifier:SCell];
    [self.tableView registerNib:[UINib nibWithNibName:@"ZBDetailThirdCell" bundle:nil] forCellReuseIdentifier:TCell];
}
- (void)loadUrlData:(NSString *)product_id{
    
    [ZBHTTPRequestManager requestGETWithURLStr:detail_URL(product_id) paramDic:nil Api_key:nil finish:^(id responseObject) {

        NSLog(@"responseObject:%@",responseObject);
        ZBProductDetailModel *model  = [ZBProductDetailModel mj_objectWithKeyValues:responseObject[@"data"]];
        self.dataModel = model;
        for (ZBImagesModel *imageModel in model.imgs) {
            [self.bannerImgArr addObject:imageModel.url];
        }
        //刷新滚动视图
        self.cycleScrollView.imageURLStringsGroup = self.bannerImgArr;
        [self.tableView reloadData];

    } enError:^(NSError *error) {

    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 2) {
        return 533;
    }
    return 180;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ZBDetailFirstCell *firstCell = [tableView dequeueReusableCellWithIdentifier:ID];
        firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [firstCell refreshUI:self.dataModel];
        return firstCell;
    }else if (indexPath.row == 1){
        ZBDetailSecondCell  *secondCell = [tableView dequeueReusableCellWithIdentifier:SCell];
        secondCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [secondCell refreshUI:self.dataModel];
        return secondCell;
    }else{
        ZBDetailThirdCell  *thirdCell = [tableView dequeueReusableCellWithIdentifier:TCell];
        thirdCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [thirdCell refreshUI:self.dataModel];
        return thirdCell;
//
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KCell"];
//        if (!cell) {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KCell"];
//        }
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
    }

}


- (SDCycleScrollView *)cycleScrollView{
    
    if (!_cycleScrollView) {
        //轮播图
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, screen_width, screen_width*(230/375.0)) delegate:self placeholderImage:[UIImage imageNamed:@"viodImage"]];
        _cycleScrollView.imageURLStringsGroup = self.bannerImgArr;
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
- (NSMutableArray *)bannerImgArr{
    
    if (!_bannerImgArr) {
        _bannerImgArr = [NSMutableArray array];
    }
    return _bannerImgArr;
}

- (UIView *)buttonView{
    
    if (!_buttonView) {
        
        _buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, screen_height-49, screen_height, 49)];
        _buttonView.backgroundColor = [UIColor clearColor];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10, 0, screen_width-20, 45);
        btn.backgroundColor = [UIColor greenColor];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 10.0f;
        [btn setTitle:@"立即购买" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buyAction:) forControlEvents:UIControlEventTouchUpInside];
        [_buttonView addSubview:btn];
    }
    return _buttonView;
}
//购买商品
- (void)buyAction:(UIButton *)sender{
    
    self.productModel.type = @"1";
    MBProgressHUD *HUD = [Tools MBProgressHUD:@"购买成功"];
    [HUD hideAnimated:YES afterDelay:2.0f];
    if (![ZFMDBTool containsData:self.productModel]) {
        
        [ZFMDBTool insertData:self.productModel];
    }

    
}

@end
