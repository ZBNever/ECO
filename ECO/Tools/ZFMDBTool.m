//
//  ZFMDBTool.m
//  网络-day7-课后练习
//
//  Created by Never on 16/11/10.
//  Copyright © 2016年 com.never. All rights reserved.
//

#import "ZFMDBTool.h"

@implementation ZFMDBTool

static FMDatabase *_dataBase;

+ (void)initialize{
    
    _dataBase = [FMDatabase databaseWithPath:[NSHomeDirectory() stringByAppendingString:@"/Documents/appData.db"]];
    
    [_dataBase open];
    
    [_dataBase executeUpdate:@"create table if not exists App (id integer primary key autoincrement,name text,des text,url text,pid text,type text)"];
    
}
//插入数据
+ (void)insertData:(ZBProductListModel *)model{

    [_dataBase executeUpdate:@"insert into App (name,des,url,pid,type) values (?,?,?,?,?)",model.product_name,model.price,model.main_pic,model.product_id,model.type];
    
}
+(void)deleteData:(ZBProductListModel *)model{
    
    [_dataBase executeUpdate:@"DELETE FROM App WHERE pid = ? AND type = ?",model.product_id,model.type];
}
//刷新数据
+ (void)updateData:(ZBProductListModel *)model withType:(NSInteger)i{

    //更新
    [_dataBase executeUpdate:@"update App set name = ?,des = ?,url = ?,pid = ? where id = ?",model.product_name,model.price,model.main_pic,model.product_id, @(i+1)];
}

+ (void)deleteAllData{

    [_dataBase executeUpdate:@"DROP table IF EXISTS App"];
//    [_dataBase executeUpdate:@"delete from App where id > 5"];
}
//是否包含数据
+ (BOOL)containsData{

    FMResultSet *set = [_dataBase executeQuery:@"select * from  App"];
    
    return  [set next];
}
//查询是否包含某个数据
+ (BOOL)containsData:(ZBProductListModel *)model{
    
    FMResultSet *set = [_dataBase executeQuery:@"select * from  App where pid = ? AND type = ?",model.product_id,model.type];
    
    return [set next];

}
+ (NSArray *)dataArr{

    FMResultSet *set = [_dataBase executeQuery:@"SELECT * FROM App;"];
    // 不断往下取数据
    NSMutableArray *dataArr = [NSMutableArray array];
    
    while ([set next]) {
        ZBProductListModel *AppModel = [ZBProductListModel new];
        AppModel.product_name = [set stringForColumn:@"name"];
        AppModel.price = [set stringForColumn:@"des"];
        AppModel.main_pic = [set stringForColumn:@"url"];
        AppModel.product_id = [set stringForColumn:@"pid"];
        AppModel.type = [set stringForColumn:@"type"];
        [dataArr addObject:AppModel];
    }
    
    return dataArr;
}
+(NSArray *)callBackArr{
    
    FMResultSet *set = [_dataBase executeQuery:@"SELECT * FROM App WHERE type = 0;"];
    // 不断往下取数据
    NSMutableArray *callBackArr = [NSMutableArray array];
    
    while ([set next]) {
        ZBProductListModel *AppModel = [ZBProductListModel new];
        AppModel.product_name = [set stringForColumn:@"name"];
        AppModel.price = [set stringForColumn:@"des"];
        AppModel.main_pic = [set stringForColumn:@"url"];
        AppModel.product_id = [set stringForColumn:@"pid"];
        AppModel.type = [set stringForColumn:@"type"];
        [callBackArr addObject:AppModel];
    }
    return callBackArr;
    
}
+ (NSArray *)buyDataArr{
    
    FMResultSet *set = [_dataBase executeQuery:@"SELECT * FROM App WHERE type = 1;"];
    // 不断往下取数据
    NSMutableArray *buyDataArr = [NSMutableArray array];
    
    while ([set next]) {
        ZBProductListModel *AppModel = [ZBProductListModel new];
        AppModel.product_name = [set stringForColumn:@"name"];
        AppModel.price = [set stringForColumn:@"des"];
        AppModel.main_pic = [set stringForColumn:@"url"];
        AppModel.product_id = [set stringForColumn:@"pid"];
        AppModel.type = [set stringForColumn:@"type"];
        [buyDataArr addObject:AppModel];
    }
    return buyDataArr;
}
+ (NSArray *)collectionDataArr{
    FMResultSet *set = [_dataBase executeQuery:@"SELECT * FROM App WHERE type = 2;"];
    // 不断往下取数据
    NSMutableArray *collectionDataArr = [NSMutableArray array];
    
    while ([set next]) {
        ZBProductListModel *AppModel = [ZBProductListModel new];
        AppModel.product_name = [set stringForColumn:@"name"];
        AppModel.price = [set stringForColumn:@"des"];
        AppModel.main_pic = [set stringForColumn:@"url"];
        AppModel.product_id = [set stringForColumn:@"pid"];
        AppModel.type = [set stringForColumn:@"type"];
        [collectionDataArr addObject:AppModel];
    }
    return collectionDataArr;
    
}

@end
