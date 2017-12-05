//
//  ZFMDBTool.h
//  网络-day7-课后练习
//
//  Created by Never on 16/11/10.
//  Copyright © 2016年 com.never. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZBProductListModel.h"

@interface ZFMDBTool : NSObject
/** 回收数据 */
+(NSArray *)callBackArr;
/** 购买数组 */
+ (NSArray *)buyDataArr;
/** 收藏数组 */
+ (NSArray *)collectionDataArr;
/** 数据数组 */
+ (NSArray *)dataArr;
/** 插入数据 */
+ (void)insertData:(ZBProductListModel *)model;
/** 删除数据 */
+ (void)deleteData:(ZBProductListModel *)model;
/** 更新数据 */
+ (void)updateData:(ZBProductListModel *)model withType: (NSInteger)i;
/** 删除数据表 */
+ (void)deleteAllData;
/** 是否有数据 */
+ (BOOL)containsData;
/** 是否某个数据 */
+ (BOOL)containsData:(ZBProductListModel *)model;

@end
