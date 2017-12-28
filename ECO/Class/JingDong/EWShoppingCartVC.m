//
//  EWShoppingCartVC.m
//  ECO
//
//  Created by Never on 2017/10/31.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "EWShoppingCartVC.h"

@interface EWShoppingCartVC ()

@end

@implementation EWShoppingCartVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [BaseMethod controller:self Title:@"购物车" tabBarItemImage:@"gouwuche_gray" tabBarItemSelectedImage:@"gouwuche_color"];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
