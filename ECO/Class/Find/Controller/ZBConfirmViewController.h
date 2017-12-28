//
//  ZBConfirmViewController.h
//  ECO
//
//  Created by Never on 2017/11/14.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBProductDetailModel.h"
#import "ZBProductListModel.h"

@interface ZBConfirmViewController : UIViewController

@property (nonatomic, strong) ZBProductDetailModel *dataModel;

@property (nonatomic, strong) ZBProductListModel *productModel;
@end
