//
//  ViewControllerA.m
//  UI-day7-UITabbarController分栏控制器
//
//  Created by liufy on 15/7/28.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerA.h"

@interface ViewControllerA ()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewControllerA

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        //设置文字带图片类型的
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"红色" image:[UIImage imageNamed:@"1_selected"] tag:0];
        
        //设置文字，选中图片和非选中图片类型
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"红色" image:[UIImage imageNamed:@"3_normal"] selectedImage:[UIImage imageNamed:@"3_selected"]];
        
        //设置系统类型
        //self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
        
        //设置徽标
        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",10L];
        
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置导航栏标题
    self.navigationItem.title = [NSString stringWithFormat:@"第%ld层",self.navigationController.viewControllers.count];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    ViewControllerA *ctl = [ViewControllerA new];
    
    [self.navigationController pushViewController:ctl animated:YES];
    
    
}

@end
