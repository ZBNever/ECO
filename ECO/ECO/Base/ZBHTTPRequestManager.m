//
//  ZBHTTPRequestManager.m
//  ECO
//
//  Created by Never on 2017/10/10.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBHTTPRequestManager.h"
#import <AFNetworking.h>

@implementation ZBHTTPRequestManager

+ (void)requestGETWithURLStr:(NSString *)urlStr paramDic:(NSDictionary *)paramDic Api_key:(NSString *)api_key finish:(void(^)(id responseObject))finish enError:(void(^)(NSError *error))enError{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"text/html",@"application/json",@"text/javascript",@"text/json",@"text/plain",@"charset=UTF-8", nil];
    
    // 设置请求头
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [manager.requestSerializer setValue:api_key forHTTPHeaderField:@"api_key"];
    
    [manager GET:urlStr parameters:paramDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *code = [NSString stringWithFormat:@"%@",[responseObject objectForKey:@"code"]];
        
        if ([code isEqualToString:@"1"]) {
            finish(responseObject);
        }else  {
           __unused NSString *errmsg = [responseObject objectForKey:@"errmsg"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        enError(error);
    }];
}
@end
