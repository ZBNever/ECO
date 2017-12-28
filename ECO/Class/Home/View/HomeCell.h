//
//  HomeCell.h
//  HunterSmart
//
//  Created by Never on 2017/3/8.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HomeModel.h"
#import "HomeCategoriesModel.h"
#import "HomeHotProductsModel.h"

@protocol deleteCellDelegate <NSObject>

- (void)deleteCell:(UIButton *)sender;

@end

@interface HomeCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;

@property (weak, nonatomic) id <deleteCellDelegate>delegate;


- (void)refresAihuishouhUI:(HomeHotProductsModel *)model;

@end
