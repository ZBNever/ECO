//
//  ZBProductListModel.h
//  ECO
//
//  Created by Never on 2017/10/15.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBProductListModel : NSObject

@property (nonatomic, strong) NSString *product_id; // 52506,
@property (nonatomic, strong) NSString *product_name; // "95\u65b0 iPhone7 Plus 128G\u9ed1",
@property (nonatomic, strong) NSString *price; // 5150,
@property (nonatomic, strong) NSString *product_name_str1; // "95\u65b0 iPhone7 Plus",
@property (nonatomic, strong) NSString *product_name_str2; // "128G \u9ed1",
@property (nonatomic, strong) NSString *main_pic;
@property (nonatomic, strong) NSString *product_tag; // "1,6,16";
@property (nonatomic, strong) NSString *type;//存储来源
@end
