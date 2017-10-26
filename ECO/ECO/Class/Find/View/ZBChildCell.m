//
//  ZBChildCell.m
//  ECO
//
//  Created by Never on 2017/10/15.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBChildCell.h"
#import "ZBProductCollectionCell.h"
#import "ZBProductListModel.h"
#import "ZBDetailViewController.h"

@interface ZBChildCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *listDataArr;



@end

@implementation ZBChildCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier viewController:(UIViewController *)VC{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.VC = VC;
    }
    return self;
    
}

- (void)initCollectionView{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 4;
    layout.minimumInteritemSpacing = 0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageHeadView.frame), screen_width, CGRectGetMaxY(self.frame)-CGRectGetMaxY(self.imageHeadView.frame)) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];

    [self.collectionView registerNib:[UINib nibWithNibName:@"ZBProductCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];

    [self addSubview:self.collectionView];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    [self initCollectionView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    // Configure the view for the selected state
}

- (void)refreshUI:(ZBProductDataModel *)model{

    [self.imageHeadView sd_setImageWithURL:[NSURL URLWithString:model.model_banner_url?:model.brand_banner_url]];
    self.listDataArr = [model.product_list mutableCopy];
    if (self.listDataArr.count>0) {
        self.collectionView.alpha = 1;
        [self.collectionView reloadData];
    }else{
        self.collectionView.alpha = 0;
    }
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

        return self.listDataArr.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    

        ZBProductCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
        [cell refreshUI:self.listDataArr[indexPath.row ]];
        return cell;
        
    
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) {
//            UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
//            [headerView addSubview:self.cycleScrollView];
//            return headerView;
        }else{
//            UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"segument" forIndexPath:indexPath];
//            headerView.backgroundColor = [UIColor whiteColor];
//            [headerView addSubview:self.sliderSegmentView];
//            return headerView;
            
        }
        
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
     return CGSizeMake(0, 0);
    
//    if (section == 0) {
//        return CGSizeMake(0, screen_width*(200/375.0));
//    }else{
//
//        return CGSizeMake(0, 50);
//    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
        return CGSizeMake(140, 204);
    
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)sectio{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
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
    ZBProductListModel *model = self.listDataArr[indexPath.item];
    ZBDetailViewController *detailVC = [[ZBDetailViewController alloc] init];
    detailVC.product_id = model.product_id;
    //push的时候隐藏tabbar
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.VC.navigationController pushViewController:detailVC animated:YES];
    NSLog(@"model.product_id:%@",model.product_id);
    
}

- (NSMutableArray *)listDataArr{
    
    if (!_listDataArr) {
        _listDataArr = [NSMutableArray array];
    }
    return _listDataArr;
}

@end
