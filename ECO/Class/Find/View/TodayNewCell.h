//
//  TodayNewCell.h
//  ECO
//
//  Created by Never on 2017/10/11.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodayNewDataModel.h"

@interface TodayNewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *descLab;
@property (weak, nonatomic) IBOutlet UILabel *colorLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;

- (void)refreshUI:(TodayNewDataModel *)model;

@end
