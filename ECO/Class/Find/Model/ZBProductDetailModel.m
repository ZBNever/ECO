//
//  ZBProductDetailModel.m
//  ECO
//
//  Created by Never on 2017/10/23.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBProductDetailModel.h"

@implementation ZBProductDetailModel

+(NSDictionary *)mj_objectClassInArray{
    
    return @{
             @"imgs":@"ZBImagesModel",
             @"param_value": @"ZBParamValueModel"
             };
}

@end

@implementation ZBImagesModel

@end

@implementation ZBParamValueModel

@end
