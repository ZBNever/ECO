//
//  ViewControllerB.m
//  UI-day7-UITabbarController分栏控制器
//
//  Created by liufy on 15/7/28.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerB.h"

#import "ZBCommendVC.h"

#import "ZBChildViewController.h"
#import "ZBAndroidViewController.h"
#import "ZBIPadViewController.h"
#import "ZBMacBookViewController.h"
#import "ZBWatchViewController.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [BaseMethod controller:self Title:@"淘机" tabBarItemImage:@"find_gray" tabBarItemSelectedImage:@"find_green"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 添加所有子控制器
    [self setUpAllViewController];
    
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
        *norColor = [UIColor lightGrayColor];
        *selColor = [UIColor redColor];
        *titleWidth = [UIScreen mainScreen].bounds.size.width / 5;
    }];
    
    // 标题渐变
    // *推荐方式(设置标题渐变)
    [self setUpTitleGradient:^(YZTitleColorGradientStyle *titleColorGradientStyle, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor) {
        
    }];
    
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor,BOOL *isUnderLineEqualTitleWidth) {
        //        *isUnderLineDelayScroll = YES;
        *isUnderLineEqualTitleWidth = YES;
    }];
    
}

// 添加所有子控制器
- (void)setUpAllViewController
{

    // 推荐
    ZBCommendVC *wordVc1 = [[ZBCommendVC alloc] init];
    wordVc1.title = @"推荐";
    [self addChildViewController:wordVc1];
    
    // iPhone
    ZBChildViewController *wordVc2 = [[ZBChildViewController alloc] init];
    wordVc2.title = @"iPhone";
    wordVc2.type = 2;
    [self addChildViewController:wordVc2];
    
    // 安卓
    ZBChildViewController *wordVc3 = [[ZBChildViewController alloc] init];
    wordVc3.title = @"安卓";
    wordVc3.type = 3;
    [self addChildViewController:wordVc3];
    
    //平板
    ZBChildViewController *wordVc4 = [[ZBChildViewController alloc] init];
    wordVc4.title = @"平板";
    wordVc4.type =  4;
    [self addChildViewController:wordVc4];
    
    // 笔记本
    ZBChildViewController *wordVc5 = [[ZBChildViewController alloc] init];
    wordVc5.title = @"笔记本";
    wordVc5.type = 5;
    [self addChildViewController:wordVc5];
    
    // 手表
    ZBChildViewController *wordVc6 = [[ZBChildViewController alloc] init];
    wordVc6.title = @"手表";
    wordVc6.type = 6;
    [self addChildViewController:wordVc6];
    
}


@end
