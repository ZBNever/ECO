//
//  EWBaseViewController.m
//  ECO
//
//  Created by Never on 2017/10/31.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "EWBaseViewController.h"

@interface EWBaseViewController ()

@end

@implementation EWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //标题颜色
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHexString:@"333333"],NSForegroundColorAttributeName,nil]];
    [self creatRightItemBtn];
}

- (void)creatRightItemBtn{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 20, 20);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"back_black"] forState:UIControlStateNormal];
    //    [rightBtn setImage:[UIImage imageNamed:@"cha"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}
- (void)backBtnAction{
    [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
}

@end
