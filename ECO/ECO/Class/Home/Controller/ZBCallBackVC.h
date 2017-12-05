//
//  ZBCallBackVC.h
//  ECO
//
//  Created by Never on 2017/11/7.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeHotProductsModel.h"
#import "ZBProductListModel.h"

@interface ZBCallBackVC : UIViewController

@property (nonatomic, strong) HomeHotProductsModel *model;

@property (nonatomic, strong) ZBProductListModel *productModel;

@end
