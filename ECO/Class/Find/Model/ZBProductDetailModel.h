//
//  ZBProductDetailModel.h
//  ECO
//
//  Created by Never on 2017/10/23.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZBProductDetailModel : NSObject

@property (nonatomic, strong) NSString *product_id; // 52671,
@property (nonatomic, strong) NSString *type_id; // 1,
@property (nonatomic, strong) NSString *brand_id; // 1,
@property (nonatomic, strong) NSString *model_id; // 129,
@property (nonatomic, strong) NSString *product_name; // "95新 iPhone7 Plus 32G金",
@property (nonatomic, strong) NSString *brief; // "系统：11.0.1\r\nIMEI：355834080659777\r\n激活时间：2017年3月21日\r\n官方保修：2018年3月20日\r\n经检测：该机底部和背部有轻微瑕疵，但屏幕无瑕，不影响日常使用；硬件功能正常；官方保修剩余时间在3个月以上",
@property (nonatomic, strong) NSString *details; // "",
@property (nonatomic, strong) NSString *created_at; // "2017-10-24 20:38:04",
@property (nonatomic, strong) NSString *status; // 1,
@property (nonatomic, strong) NSString *warehouse_status; // 6,
@property (nonatomic, strong) NSString *price; // 4550,
@property (nonatomic, strong) NSString *main_pic; // "http://image.huodao.hk/pd_img/f87/cc2/f87cc23b70c3e5e3b8b72f5aa116c829_1000x1000.jpg",
@property (nonatomic, strong) NSString *update_at; // "2017-10-24 20:38:04",
@property (nonatomic, strong) NSString *sale_at; // "0000-00-00 00:00:00",
@property (nonatomic, strong) NSString *sort_num; // 27949,
@property (nonatomic, strong) NSString *recommend; // 0,
@property (nonatomic, strong) NSString *tag; // "102459777",
@property (nonatomic, strong) NSString *key_props; // "5:129;11:22;10:17;8:6;12:26;9:1;",
@property (nonatomic, strong) NSString *sub_title; // "iPhone7 Plus 32G金",
@property (nonatomic, strong) NSString *ori_price; // 6388,
@property (nonatomic, strong) NSString *product_tag; // "1,6,16",
@property (nonatomic, strong) NSString *product_cell; // 1,
@property (nonatomic, strong) NSString *xieyi; // 0,
@property (nonatomic, strong) NSString *delete_at; // "0000-00-00 00:00:00",
@property (nonatomic, strong) NSString *buy_at; // "2017-10-16 16:38:03",
@property (nonatomic, strong) NSString *refuse_reason; // "",
@property (nonatomic, strong) NSString *imei;//IMEI
@property (nonatomic, strong) NSString *check_res; // "经检测：该机底部和背部有轻微瑕疵，但屏幕无瑕，不影响日常使用；硬件功能正常；官方保修剩余时间在3个月以上",
@property (nonatomic, strong) NSString *activation_time; // "2017年3月21日",
@property (nonatomic, strong) NSString *guarantee_time; // "2018年3月20日",
@property (nonatomic, strong) NSString *charge_num; // 11,
@property (nonatomic, strong) NSString *engineer_name;//质检工程师名字
@property (nonatomic, strong) NSString *professional;//质检工程师级别
@property (nonatomic, strong) NSArray   *imgs; //
@property (nonatomic, strong) NSArray   *param_value;
@property (nonatomic, strong) NSString *netword_string;
@property (nonatomic, strong) NSString *banben_string;

@end


@interface ZBImagesModel : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *product_id;

@end


@interface ZBParamValueModel : NSObject

@property (nonatomic, strong) NSString *p_name;
@property (nonatomic, strong) NSString *p_value;

@end

