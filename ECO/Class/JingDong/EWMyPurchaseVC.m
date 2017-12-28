//
//  EWMyPurchaseVC.m
//  ECO
//
//  Created by Never on 2017/10/31.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "EWMyPurchaseVC.h"
#import "CBSegmentView.h"

@interface EWMyPurchaseVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) CBSegmentView *sliderSegmentView;

@property (nonatomic, strong) UITableView *mainTableview;

@end

@implementation EWMyPurchaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的企业采购";
    [self.view addSubview:self.sliderSegmentView];
    [self.view addSubview:self.mainTableview];
}

- (void)backBtnAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = @"Test";
    return cell;
}

- (UITableView *)mainTableview{
    
    if (!_mainTableview) {
        CGFloat sliderY = CGRectGetMaxY(self.sliderSegmentView.frame);
        
        _mainTableview = [[UITableView alloc] initWithFrame:CGRectMake(0, sliderY, screen_width, screen_height-sliderY) style:UITableViewStylePlain];
        
        _mainTableview.delegate = self;
        _mainTableview.dataSource = self;
        _mainTableview.tableFooterView = [UIView new];
    }
    return _mainTableview;
}

- (CBSegmentView *)sliderSegmentView{
    
    if (!_sliderSegmentView) {
        NSArray *array=@[
                         @"待付款",
                         @"待收货",
                         @"已完成",
                         @"全部订单",
                         ];
        
        //    ② sliderStyle
        _sliderSegmentView = [[CBSegmentView alloc] initWithFrame:CGRectMake(0, NavHeight, screen_width, 40)];
        [_sliderSegmentView setTitleArray:array titleFont:0 titleColor:[UIColor lightGrayColor] titleSelectedColor:[UIColor themeColor] withStyle:CBSegmentStyleSlider isNotMove:YES];
//        __weak typeof(self) weakSelf = self;
        _sliderSegmentView.titleChooseReturn = ^(NSInteger x) {
            NSLog(@"点击了第%ld个按钮",x+1);
            switch (x) {
                case 0:
                {
                   
                }
                    break;
                case 1:
                {

                }
                    break;
                case 2:
                {
                
                }
                    break;
                case 3:
                {
                    
                }
                    break;
                default:
                    break;
            }
            
            
        };
    }
    return _sliderSegmentView;
}

@end
