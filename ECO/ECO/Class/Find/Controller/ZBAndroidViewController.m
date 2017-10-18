//
//  ZBAndroidViewController.m
//  ECO
//
//  Created by Never on 2017/10/16.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBAndroidViewController.h"

#import "YZDisplayViewHeader.h"

#import "FeThreeDotGlow.h"

#import "ZBChildCell.h"

#import "ZBProductDataModel.h"

static NSString *ID = @"cell";

@interface ZBAndroidViewController ()

@property (nonatomic, strong) FeThreeDotGlow *threeDot;

@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation ZBAndroidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ViewController_BackGround;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    /****滚动完成请求数据*******/
    
    // 如果想要滚动完成或者标题点击的时候，加载数据，需要监听通知
    
    // 监听滚动完成或者点击标题，只要滚动完成，当前控制器就会发出通知
    
    // 只需要监听自己发出的，不需要监听所有对象发出的通知，否则会导致一个控制器发出，所有控制器都能监听,造成所有控制器请求数据
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadUrlData) name:YZDisplayViewClickOrScrollDidFinshNote object:self];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZBChildCell" bundle:nil] forCellReuseIdentifier:ID];

    // 开发中可以搞个蒙版，一开始遮住当前界面，等请求成功，在把蒙版隐藏.
    _threeDot = [[FeThreeDotGlow alloc] initWithView:self.view blur:NO];
    [self.view addSubview:_threeDot];
    // Start
    [_threeDot show];
}
- (void)initTableView{
    
    self.tableView.backgroundColor = ViewController_BackGround;
    
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    self.threeDot.frame = self.view.frame;
    
}

- (void)loadUrlData{
    
//    NSArray *urlArr = @[iphone_URL,android_URL,ipad_URL,macbook_URL,watch_URL];
    
    [ZBHTTPRequestManager requestGETWithURLStr:android_URL paramDic:nil Api_key:nil finish:^(id responseObject) {
        NSLog(@"responseObject:%@",responseObject);
        self.dataArr  = [ZBProductDataModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"]];
        [UIView animateWithDuration:1.2 animations:^{
            self.threeDot.alpha = 0;
        } completion:^(BOOL finished) {
            [self.threeDot removeFromSuperview];
        }];
        [self.tableView reloadData];
    } enError:^(NSError *error) {
        
    }];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 384;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZBChildCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[ZBChildCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell refreshUI:self.dataArr[indexPath.row]];
    
    return cell;
}
- (NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
@end
