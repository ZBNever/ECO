//
//  HomeHotProductsModel.h
//  HunterSmart
//
//  Created by Never on 2017/10/1.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeHotProductsModel : NSObject

@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *topPrice; 
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSString *categoryId; // 1,
@property (nonatomic, strong) NSString *brandId; // 52,
@property (nonatomic, strong) NSString *totalRecycleCount; // 57190

@end
