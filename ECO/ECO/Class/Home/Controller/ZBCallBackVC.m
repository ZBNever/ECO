//
//  ZBCallBackVC.m
//  ECO
//
//  Created by Never on 2017/11/7.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBCallBackVC.h"
#import "ZBCallBackView.h"
#import "ZBWriteInfoCell.h"
#import "ZBBottomBtnView.h"

static NSString *CellID = @"CellID";
static NSString *SCellID = @"SCellID";
static NSInteger heightForTabbar = 49;

@interface ZBCallBackVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) ZBBottomBtnView *bottomBtnView;

@end

@implementation ZBCallBackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"下单回收";
    self.view.backgroundColor = [UIColor colorForCCC];
    [self.view addSubview:self.mainTableView];
    [self.view addSubview:self.bottomBtnView];
    [self.mainTableView registerNib:[UINib nibWithNibName:@"ZBWriteInfoCell" bundle:nil] forCellReuseIdentifier:SCellID];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = @"回收地址：贺州学院";
        return cell;
    }else{
        ZBWriteInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:SCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1) {
        
        return 140;
        
    }else{
        
        return 40;
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headview = [[UIView alloc] init];
    headview.backgroundColor = [UIColor clearColor];
    return headview;
}

- (UITableView *)mainTableView{
    
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height- heightForTabbar) style:UITableViewStylePlain];
        _mainTableView.backgroundColor = [UIColor clearColor];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.allowsSelection = NO;
        _mainTableView.tableHeaderView = [ZBCallBackView initCallBackView];
        _mainTableView.tableFooterView = [UIView new];
    }
    return _mainTableView ;
}
- (ZBBottomBtnView *)bottomBtnView{
    
    if (!_bottomBtnView) {
        _bottomBtnView = [[ZBBottomBtnView alloc] initWithFrame:CGRectMake(0, screen_height-heightForTabbar, screen_width, heightForTabbar)];
    }
    return _bottomBtnView;
}

@end
