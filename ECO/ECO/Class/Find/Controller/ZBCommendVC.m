//
//  ZBCommendVC.m
//  ECO
//
//  Created by Never on 2017/10/15.
//  Copyright © 2017年 Never. All rights reserved.
//  推荐页面

#import "ZBCommendVC.h"
#import "SDCycleScrollView.h"
#import "TodayNewCell.h"
//#import "CategoriesView.h"
#import "CBSegmentView.h"
#import "HomeDataModel.h"
#import "FindBannerModel.h"
#import "HomeCategoriesModel.h"
#import "HomeHotProductsModel.h"
#import "HotProductView.h"
#import "HotProductModel.h"
#import "ZBProductListModel.h"
#import "ZBDetailViewController.h"

@interface ZBCommendVC ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@property (nonatomic, strong) CBSegmentView *sliderSegmentView;

@property (nonatomic, strong) UILabel *todayLab;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *bannerImgArr;

@property (nonatomic, strong) NSMutableArray *hotImageArr;

@property (nonatomic, strong) NSMutableArray *todayDataArr;

@property (nonatomic, strong) MJRefreshNormalHeader *header;

@end

@implementation ZBCommendVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.sliderSegmentView];
    [self initCollectionView];
    [self example03];
    [self loadBannerDataFromURL];
    [self loadHotDataFromURL];
    [self loadTodayDataFromURL];
}


- (SDCycleScrollView *)cycleScrollView{
    
    if (!_cycleScrollView) {
        //轮播图
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, screen_width, screen_width*(180/375.0)) delegate:self placeholderImage:nil];
        _cycleScrollView.imageURLStringsGroup = self.bannerImgArr;
        _cycleScrollView.autoScrollTimeInterval = 4.0;
        _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _cycleScrollView;
    
}

- (void)initCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 4;
    layout.minimumInteritemSpacing = 0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height-NavHeight-44-49) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = ViewController_BackGround;
    [self.collectionView registerNib:[UINib nibWithNibName:@"TodayNewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HotProductView" bundle:nil] forCellWithReuseIdentifier:@"HotProductView"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"segument"];
    [self.view addSubview:self.collectionView];
}
#pragma mark UITableView + 下拉刷新 隐藏时间
- (void)example03
{
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadTodayDataFromURL)];
    
    // 设置自动切换透明度(在导航栏下面自动隐藏)
    header.automaticallyChangeAlpha = YES;
    
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 马上进入刷新状态
    [header beginRefreshing];
    self.header = header;
    // 设置header
    self.collectionView.mj_header = self.header;
}
- (void)loadHotData:(NSString *)data{
    //    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:data ofType:nil];
    //    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:jsonPath];
    //    NSMutableDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    //    NSArray *hotProductsArr = [HomeHotProductsModel mj_objectArrayWithKeyValuesArray:jsonDic[@"data"]];
    //    self.dataArr = [hotProductsArr mutableCopy];
    //    [self.collectionView reloadData];
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0 ) {
        return 1;
    }else{
        
        return self.todayDataArr.count;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        HotProductView *view = [collectionView dequeueReusableCellWithReuseIdentifier:@"HotProductView" forIndexPath:indexPath];
        
        [view refreshUI:self.hotImageArr];
        
        return view;
    }
    
    else{
        TodayNewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        [cell refreshUI:self.todayDataArr[indexPath.row ]];
        return cell;
        
    }
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) {
            UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
            [headerView addSubview:self.cycleScrollView];
            return headerView;
        }else{
            UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"segument" forIndexPath:indexPath];
            headerView.backgroundColor = [UIColor whiteColor];
            
            [headerView addSubview:self.todayLab];
            return headerView;
            
        }
        
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0 ) {
        return CGSizeMake(0, screen_width*(180/375.0));
    }else{
        return CGSizeMake(0, 50);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return CGSizeMake(screen_width, 260);
    }else{
        return CGSizeMake(screen_width/2.0-2, 209);
    }
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)sectio{
    
    return UIEdgeInsetsMake(1, 1, 1, 0.1);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        ZBProductListModel *model = self.todayDataArr[indexPath.item];
        ZBDetailViewController *VC = [[ZBDetailViewController alloc] init];
        VC.hidesBottomBarWhenPushed = YES;
        VC.product_id = model.product_id;
        VC.productModel = model;
        [self.navigationController pushViewController:VC animated:YES];
    }

}

#pragma mark - UICollectionViewDelegate


#pragma mark - SDCycleScrollViewDelegate
//点击了第几张
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"第%ld张",index] message:@"暂无跳转链接" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
    //    [alert show];
    
}

#pragma mark - 网络请求数据
- (void)loadBannerDataFromURL{
    
    [ZBHTTPRequestManager requestGETWithURLStr:Bannar_Url paramDic:nil Api_key:nil finish:^(id responseObject) {
        NSLog(@"responseObject:%@",responseObject);
        NSArray *bannerArr = [FindBannerModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        
        for (FindBannerModel *bannerModel in bannerArr) {
            [self.bannerImgArr addObject:bannerModel.banner_image_url];
        }
        self.cycleScrollView.imageURLStringsGroup = self.bannerImgArr;
        
    } enError:^(NSError *error) {
        
    }];
}
- (void)loadHotDataFromURL{
    
    [ZBHTTPRequestManager requestGETWithURLStr:HOT_URL paramDic:nil Api_key:nil finish:^(id responseObject) {
        NSLog(@"responseObject:%@",responseObject);
        NSArray *hotDataArr = [HotProductModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        
        self.hotImageArr = [hotDataArr mutableCopy];
        [self.collectionView reloadData];
        [self.header endRefreshing];
    } enError:^(NSError *error) {
        
    }];
    
}

- (void)loadTodayDataFromURL{
    [ZBHTTPRequestManager requestGETWithURLStr:TodayList_Url paramDic:nil Api_key:nil finish:^(id responseObject) {
        NSLog(@"responseObject:%@",responseObject);
        NSArray *todayNewDataArr = [ZBProductListModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"product_list"]];
        //
        self.todayDataArr = [todayNewDataArr mutableCopy];
        [self.collectionView reloadData];
        [self.header endRefreshing];
    } enError:^(NSError *error) {
        [self.header endRefreshing];
    }];
    
}

- (UILabel *)todayLab{
    
    if (!_todayLab) {
        _todayLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screen_width, 50)];
        _todayLab.text = @"今日上新";
        _todayLab.textAlignment = NSTextAlignmentCenter;
        _todayLab.font = [UIFont systemFontOfSize:15];
    }
    return _todayLab;
}

- (NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}

- (NSMutableArray *)bannerImgArr{
    if (!_bannerImgArr) {
        _bannerImgArr = [[NSMutableArray alloc] init];
    }
    return _bannerImgArr;
}

- (NSMutableArray *)hotImageArr{
    
    if (!_hotImageArr) {
        _hotImageArr = [NSMutableArray array];
    }
    return _hotImageArr;
}
- (NSMutableArray *)todayDataArr{
    
    if (!_todayDataArr) {
        _todayDataArr = [NSMutableArray array];
    }
    return _todayDataArr;
}

@end
