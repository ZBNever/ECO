//
//  ZBConfirmViewController.m
//  ECO
//
//  Created by Never on 2017/11/14.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBConfirmViewController.h"
#import "ZBConfirmHeadView.h"

static NSString *ID = @"cell";
static NSString *SCell = @"SCell";
static NSString *TCell = @"TCell";

@interface ZBConfirmViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *paymentArr;

@property (nonatomic, strong) NSArray *paymentSubArr;

@property (nonatomic, strong) NSArray *paymentImageArr;

@end



@implementation ZBConfirmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ViewController_BackGround;
    self.title = @"确认订单";
    [self.view addSubview:self.tableView];
    
    [self registerCell];
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = [ZBConfirmHeadView initHeadView];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
    
}

//注册cell
- (void)registerCell{
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZBConfirmHeadView" bundle:nil] forHeaderFooterViewReuseIdentifier:@"head"];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"ZBDetailFirstCell" bundle:nil] forCellReuseIdentifier:ID];
//    [self.tableView registerNib:[UINib nibWithNibName:@"ZBDetailSecondCell" bundle:nil] forCellReuseIdentifier:SCell];
//    [self.tableView registerNib:[UINib nibWithNibName:@"ZBDetailThirdCell" bundle:nil] forCellReuseIdentifier:TCell];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.paymentArr[indexPath.row];
    cell.detailTextLabel.text = self.paymentSubArr[indexPath.row];
    cell.detailTextLabel.textColor = [UIColor colorForCCC];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:self.paymentImageArr[indexPath.row]];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *message = [NSString stringWithFormat:@"确认支付%@元",self.dataModel.price];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        MBProgressHUD *HUD = [Tools MBProgressHUDCustomView:@"购买成功"];
        [HUD hideAnimated:YES afterDelay:2.0f];
    }];
    
    UIAlertAction *cancelAction =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        MBProgressHUD *HUD = [Tools MBProgressHUDOnlyText:@"支付失败"];
        [HUD hideAnimated:YES afterDelay:2.0f];
    }];
    
    [alert addAction:cancelAction];
    [alert addAction:action1];
    
     [self presentViewController:alert animated:YES completion:^{
         
     }];
//    self.productModel.type = @"1";

//    if (![ZFMDBTool containsData:self.productModel]) {
//
//        [ZFMDBTool insertData:self.productModel];
//    }
}
- (NSArray *)paymentArr{
    
    if(!_paymentArr){
        _paymentArr = @[@"微信支付",@"支付宝",@"网银支付",@"Apple Pay"];
    }
    return _paymentArr;
}

- (NSArray *)paymentSubArr{
    
    if (!_paymentSubArr) {
        _paymentSubArr = @[@"推荐有微信的用户使用",@"推荐有支付宝的用户使用",@"支持各大银行手机银行支付",@"推荐Apple Pay用户使用"];
    }
    return _paymentSubArr;
}

- (NSArray *)paymentImageArr{
    
    if (!_paymentImageArr) {
        _paymentImageArr = @[@"pay_wechat_icon",@"pay_alipay_icon",@"pay_unionPay_icon",@"pay_applePay_icon"];
    }
    return _paymentImageArr;
}

@end
