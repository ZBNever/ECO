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
#import "ZBSendAdressCell.h"
#import "ZBBottomBtnView.h"

static NSString *CellID = @"CellID";
static NSString *SCellID = @"SCellID";
static NSInteger heightForTabbar = 49;

@interface ZBCallBackVC ()<UITableViewDelegate,UITableViewDataSource,ZBBottomBtnViewDelegate>

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) ZBBottomBtnView *bottomBtnView;

@property (nonatomic, strong) ZBCallBackView *callBackView;

@property (nonatomic, strong) ZBWriteInfoCell *Wcell;
@end

@implementation ZBCallBackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"下单回收";
    self.view.backgroundColor = [UIColor colorForF3];
    [self.view addSubview:self.mainTableView];
    [self.view addSubview:self.bottomBtnView];
    
    [self.mainTableView registerNib:[UINib nibWithNibName:@"ZBSendAdressCell" bundle:nil] forCellReuseIdentifier:CellID];
    [self.mainTableView registerNib:[UINib nibWithNibName:@"ZBWriteInfoCell" bundle:nil] forCellReuseIdentifier:SCellID];
//    self.callBackView.model = self.model;
//    [self.mainTableView reloadData];
//    [self.callBackView refreshHeadUI:self.model];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        ZBSendAdressCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        ZBWriteInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:SCellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.Wcell = cell;
        return cell;
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1) {
        
        return 140;
        
    }else{
        
        return 160;
        
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
        //取消分割线
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.tableHeaderView = [ZBCallBackView shareManager];
        [ZBCallBackView shareManager].model = self.model;
        _mainTableView.tableFooterView = [UIView new];
    }
    return _mainTableView ;
}

- (ZBBottomBtnView *)bottomBtnView{
    
    if (!_bottomBtnView) {
        _bottomBtnView = [[ZBBottomBtnView alloc] initWithFrame:CGRectMake(0, screen_height-heightForTabbar, screen_width, heightForTabbar)];
        _bottomBtnView.delegate = self;
    }
    return _bottomBtnView;
}
- (ZBCallBackView *)callBackView{
    if (!_callBackView) {
        _callBackView = [[ZBCallBackView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 226) model:self.model];
    }
    return _callBackView;
}
- (void)bottomBtnClick:(UIButton *)sender{
    
    if(self.Wcell.nameTextFeild.text.length == 0){
       MBProgressHUD *HUD = [Tools MBProgressHUDOnlyText:@"请输入收款人姓名"];
        [HUD hideAnimated:YES afterDelay:2.0f];
        return;
    }else if(self.Wcell.numTextFeild.text.length == 0){
        MBProgressHUD *HUD = [Tools MBProgressHUDOnlyText:@"请输入收款人电话"];
        [HUD hideAnimated:YES afterDelay:2.0f];
        return;
    }
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"回收订单提交成功！请在5个工作日内邮寄回收物品到指定地址。" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [alertVC addAction:action1];
     
     [self presentViewController:alertVC animated:YES completion:nil];
}
@end
