//
//  ZBCallBackView.h
//  ECO
//
//  Created by Never on 2017/11/7.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeHotProductsModel.h"

@interface ZBCallBackView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (nonatomic, strong) HomeHotProductsModel *model;

- (instancetype)initWithFrame:(CGRect)frame model:(HomeHotProductsModel *)model;

+ (instancetype)shareManager;

+ (instancetype)initCallBackView;

//+ (void)refreshHeadUI:(HomeHotProductsModel *)model;
@end
