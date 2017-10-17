//
//  ZBProductDataModel.h
//  ECO
//
//  Created by Never on 2017/10/15.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBProductDataModel : NSObject

@property (nonatomic, strong) NSString *pcid; // 1,
@property (nonatomic, strong) NSString *brand_id; // 1,
@property (nonatomic, strong) NSString *model_id; // 129,
@property (nonatomic, strong) NSString *model_name; // "iPhone7 Plus",
@property (nonatomic, strong) NSString *model_banner_url; 
@property (nonatomic, strong) NSString *brand_name; // "iPhone",
@property (nonatomic, strong) NSArray *product_list; //

@property (nonatomic, strong) NSString *brand_banner_url;


@end
