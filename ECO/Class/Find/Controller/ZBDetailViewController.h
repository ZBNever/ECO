//
//  ZBDetailViewController.h
//  ECO
//
//  Created by Never on 2017/10/17.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBProductListModel.h"

@interface ZBDetailViewController : UIViewController

@property (nonatomic, strong) NSString *product_id;

@property (nonatomic, strong) ZBProductListModel *productModel;

@end
