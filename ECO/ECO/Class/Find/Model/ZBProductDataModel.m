//
//  ZBProductDataModel.m
//  ECO
//
//  Created by Never on 2017/10/15.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBProductDataModel.h"

@implementation ZBProductDataModel

+ (NSDictionary *)mj_objectClassInArray{
    
    return @{
             @"product_list":@"ZBProductListModel"
             };
}

@end
