//
//  EWCompanyVC.m
//  ECO
//
//  Created by Never on 2017/10/31.
//  Copyright © 2017年 Never. All rights reserved.
//  京东企业购页面

#import "EWCompanyVC.h"

@interface EWCompanyVC ()

@end

@implementation EWCompanyVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        [BaseMethod controller:self Title:@"企业购" tabBarItemImage:@"home_gray" tabBarItemSelectedImage:@"home_green"];
        
    }
    
    return self;

}

- (void)viewDidLoad {
    [super viewDidLoad];


}

@end
