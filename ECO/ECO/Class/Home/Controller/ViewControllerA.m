//
//  ViewControllerA.m
//  UI-day7-UITabbarController分栏控制器
//
//  Created by liufy on 15/7/28.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerA.h"
#import "SDCycleScrollView.h"
#import "HomeCell.h"
#import "HomeDataModel.h"
#import "HomeBannersModel.h"
#import "HomeCategoriesModel.h"
#import "HomeHotProductsModel.h"

@interface ViewControllerA ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *bannerImgArr;
@end

@implementation ViewControllerA

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //设置文字带图片类型的
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"1_selected"] tag:0];
        //设置文字，选中图片和非选中图片类型
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[UIImage imageNamed:@"3_normal"] selectedImage:[UIImage imageNamed:@"3_selected"]];
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initCollectionView];
    [self loadData];
}

- (void)loadData{
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"HomePage.json" ofType:nil];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:jsonPath];
    NSMutableDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *bannerArr = [HomeBannersModel mj_objectArrayWithKeyValuesArray:jsonDic[@"data"][@"banners"]];
    NSArray *categoriesArr = [HomeCategoriesModel mj_objectArrayWithKeyValuesArray:jsonDic[@"data"][@"categories"]];
    NSArray *hotProductsArr = [HomeHotProductsModel mj_objectArrayWithKeyValuesArray:jsonDic[@"data"][@"hotProducts"]];
    
    for (HomeBannersModel *bannerModel in bannerArr) {
        [self.bannerImgArr addObject:bannerModel.imgUrl];
    }
    self.dataArr = [hotProductsArr mutableCopy];
    [self.collectionView reloadData];
}
- (void)SDCycleScrollView{
    //轮播图
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, screen_width, screen_width*(200/375.0)) delegate:self placeholderImage:[UIImage imageNamed:@"HB-0215@2x.png"]];
//    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, screen_width, screen_width*(200/375.0)) shouldInfiniteLoop:YES imageNamesGroup:nil];
    self.cycleScrollView.imageURLStringsGroup = self.bannerImgArr;
//    self.cycleScrollView.delegate = self;
    self.cycleScrollView.autoScrollTimeInterval = 4.0;
    self.cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    self.cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    [self.view addSubview:self.cycleScrollView];
    
}
- (void)initCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 4;
    layout.minimumInteritemSpacing = 0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    //    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.deleteBtn.tag = indexPath.row + 100;
    cell.cellImageView.tag = indexPath.row + 1000;
    cell.cellLab.tag = indexPath.row + 2000;
//    cell.delegate = self;
    [cell refresAihuishouhUI:self.dataArr[indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        [self SDCycleScrollView];
        [headerView addSubview:self.cycleScrollView];
        return headerView;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(screen_width/2.0-6, screen_width/2.0-6);
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)sectio{
    
    return UIEdgeInsetsMake(5, 4, 0, 4);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(0, screen_width*(200/375.0));
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //    HomeCell *cell = (HomeCell *)[collectionView cellForItemAtIndexPath:self.index];
//    if (CellState == nomalState) {
//
//        RoomVC *roomVC = [[RoomVC alloc] init];
//        roomVC.model = self.dataArr[indexPath.row];
//        [self.navigationController pushViewController:roomVC animated:YES];
//    }else{
//
//        [self clickImage:indexPath];
//    }
}

#pragma mark - UICollectionViewDelegate


#pragma mark - SDCycleScrollViewDelegate
//点击了第几张
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"第%ld张",index] message:@"暂无跳转链接" delegate:self cancelButtonTitle:@"取消" otherButtonTitles: nil];
    [alert show];
    
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
@end
