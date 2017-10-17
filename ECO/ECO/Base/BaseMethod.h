//
//  BaseMethod.h
//  ECO
//
//  Created by Never on 2017/10/10.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseMethod : NSObject

/**
 * 抽取成一个方法
 * 传入控制器、标题、正常状态下图片、选中状态下图片
 * 直接调用这个方法就可以了
 */
+ (void)controller:(UIViewController *)controller Title:(NSString *)title tabBarItemImage:(NSString *)image tabBarItemSelectedImage:(NSString *)selectedImage;

@end
