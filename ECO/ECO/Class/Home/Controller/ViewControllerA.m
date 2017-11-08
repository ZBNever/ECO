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
#import "CategoriesView.h"
#import "CBSegmentView.h"
#import "HomeDataModel.h"
#import "HomeBannersModel.h"
#import "HomeCategoriesModel.h"
#import "HomeHotProductsModel.h"
#import "ZBCallBackVC.h"

@interface ViewControllerA ()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@property (nonatomic, strong) CBSegmentView *sliderSegmentView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *bannerImgArr;

@property (nonatomic, strong) NSArray *categoriesArr;
@end

@implementation ViewControllerA

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

        [BaseMethod controller:self Title:@"主页" tabBarItemImage:@"home_gray" tabBarItemSelectedImage:@"home_green"];
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"首页";
    [self initCollectionView];
    [self loadData];
}

- (void)loadData{
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"HomeData.json" ofType:nil];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:jsonPath];
    NSMutableDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *bannerArr = [HomeBannersModel mj_objectArrayWithKeyValuesArray:jsonDic[@"data"][@"banners"]];
    self.categoriesArr = [HomeCategoriesModel mj_objectArrayWithKeyValuesArray:jsonDic[@"data"][@"categories"]];
    NSArray *hotProductsArr = [HomeHotProductsModel mj_objectArrayWithKeyValuesArray:jsonDic[@"data"][@"hotProducts"]];
    
    for (HomeBannersModel *bannerModel in bannerArr) {
        [self.bannerImgArr addObject:bannerModel.imgUrl];
    }
    self.dataArr = [hotProductsArr mutableCopy];
    [self.collectionView reloadData];
}

- (void)loadHotData:(NSString *)data{
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:data ofType:nil];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:jsonPath];
    NSMutableDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    NSArray *hotProductsArr = [HomeHotProductsModel mj_objectArrayWithKeyValuesArray:jsonDic[@"data"]];
    self.dataArr = [hotProductsArr mutableCopy];
    [self.collectionView reloadData];
}

- (CBSegmentView *)sliderSegmentView{
    
    if (!_sliderSegmentView) {
        NSArray *array=@[
                         @"手机回收",
                         @"平板回收",
                         @"电脑回收",
                         @"摄影摄像回收",
                         @"智能数码回收",
                         ];
        
        //    ② sliderStyle
        _sliderSegmentView = [[CBSegmentView alloc] initWithFrame:CGRectMake(0, 10, screen_width, 40)];
        //    [self.view addSubview:self.sliderSegmentView];
        //    [self.sliderSegmentView setTitleArray:array withStyle:CBSegmentStyleSlider];
        [_sliderSegmentView setTitleArray:array titleFont:0 titleColor:[UIColor lightGrayColor] titleSelectedColor:[UIColor greenColor] withStyle:CBSegmentStyleSlider];
        __weak typeof(self) weakSelf = self;
        _sliderSegmentView.titleChooseReturn = ^(NSInteger x) {
            NSLog(@"点击了第%ld个按钮",x+1);
            switch (x) {
                case 0:
                    {
                        [weakSelf loadHotData:@"iphoneData.json"];
                    }
                    break;
                case 1:
                {
                    [weakSelf loadHotData:@"ipadData.json"];
                }
                    break;
                case 2:
                {
                    [weakSelf loadHotData:@"macbookData.json"];
                }
                    break;
                case 3:
                {
                    [weakSelf loadHotData:@"cameraData.json"];
                }
                    break;
                case 4:
                {
                    [weakSelf loadHotData:@"otherData.json"];
                }
                    break;
                default:
                    break;
            }
            
            
        };
    }
    return _sliderSegmentView;
}

- (SDCycleScrollView *)cycleScrollView{
    
    if (!_cycleScrollView) {
        //轮播图
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, screen_width, screen_width*(200/375.0)) delegate:self placeholderImage:[UIImage imageNamed:@"HB-0215@2x.png"]];
        //    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, screen_width, screen_width*(200/375.0)) shouldInfiniteLoop:YES imageNamesGroup:nil];
        _cycleScrollView.imageURLStringsGroup = self.bannerImgArr;
        //    self.cycleScrollView.delegate = self;
        _cycleScrollView.autoScrollTimeInterval = 4.0;
        _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _cycleScrollView;
    
}


- (void)initCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing = 4;
    layout.minimumInteritemSpacing = 0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = ViewController_BackGround;
    
    //    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"CategoriesView" bundle:nil] forCellWithReuseIdentifier:@"CategoriesView"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"segument"];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0 ) {
        return 1;
    }else{
        
        return self.dataArr.count;
    }

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        CategoriesView *view = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoriesView" forIndexPath:indexPath];
        
        [view refreshUI:self.categoriesArr];
        
        return view;
    }else{
        HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//        cell.deleteBtn.tag = indexPath.row + 100;
        cell.cellImageView.tag = indexPath.row + 1000;
//        cell.cellLab.tag = indexPath.row + 2000;
        //    cell.delegate = self;
        [cell refresAihuishouhUI:self.dataArr[indexPath.item]];
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
            [headerView addSubview:self.sliderSegmentView];
            return headerView;
            
        }
    
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeMake(0, screen_width*(200/375.0));
    }else{
        
        return CGSizeMake(0, 50);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return CGSizeMake(screen_width, 300);
    }else{
        return CGSizeMake(screen_width/2.0-6, 270);
    }
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)sectio{
    
    return UIEdgeInsetsMake(5, 4, 0, 4);
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        ZBCallBackVC *VC = [[ZBCallBackVC alloc] init];
        VC.model = self.dataArr[indexPath.item];
        VC.hidesBottomBarWhenPushed = YES;
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
- (NSArray *)categoriesArr{
    if (!_categoriesArr) {
        _categoriesArr = [[NSArray alloc] init];
    }
    return _categoriesArr;
}
@end
