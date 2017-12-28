//
//  HomePageViewController.m
//  ECO
//
//  Created by Never on 2017/10/1.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomeCategoriesModel.h"
#import "HomeBannersModel.h"
#import "HomeHotProductsModel.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:jsonPath];
    NSMutableDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *bannerArr = [HomeBannersModel mj_objectArrayWithKeyValuesArray:jsonDic[@"data"][@"banners"]];
    NSArray *categoriesArr = [HomeCategoriesModel mj_objectArrayWithKeyValuesArray:jsonDic[@"data"][@"categories"]];
    NSArray *hotProductsArr = [HomeHotProductsModel mj_objectArrayWithKeyValuesArray:jsonDic[@"data"][@"hotProducts"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
