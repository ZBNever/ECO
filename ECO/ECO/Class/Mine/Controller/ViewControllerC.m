//
//  ViewControllerC.m
//  UI-day7-UITabbarController分栏控制器
//
//  Created by liufy on 15/7/28.
//  Copyright (c) 2015年 liufy. All rights reserved.
//

#import "ViewControllerC.h"
#import "NavHeadTitleView.h"
#import "HeadImageView.h"
#import "HeadLineView.h"
#import "ZBProductListModel.h"
#import "ZBMineCell.h"
#import "ZBDetailViewController.h"
#import "LoginVC.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
//颜色
#define JXColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

static NSString *Cell = @"Cell";

@interface ViewControllerC ()<NavHeadTitleViewDelegate,headLineDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    //头像
    UIImageView *_headerImg;
    //昵称
    UILabel *_nickLabel;
    NSMutableArray *_dataArray0;
    NSMutableArray *_dataArray1;
    NSMutableArray *_dataArray2;
}

@property(nonatomic,strong)UIImageView *backgroundImgV;//背景图
@property(nonatomic,assign)float backImgHeight;
@property(nonatomic,assign)float backImgWidth;
@property(nonatomic,assign)float backImgOrgy;
@property(nonatomic,strong)NavHeadTitleView *NavView;//导航栏
@property(nonatomic,strong)HeadImageView *headImageView;//头视图
@property(nonatomic,strong)HeadLineView *headLineView;//
@property(nonatomic,assign)NSInteger currentIndex;
@property(nonatomic,assign)int rowHeight;
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *callBackArr;
@property (nonatomic, strong) NSMutableArray *buyDataArr;
@property (nonatomic, strong) NSMutableArray *collectionDataArr;
@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, strong) MBProgressHUD *textHUD;

@end

@implementation ViewControllerC

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
         [BaseMethod controller:self Title:@"我的" tabBarItemImage:@"me_gray" tabBarItemSelectedImage:@"me_green"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _isLogin =  [[NSUserDefaults standardUserDefaults] boolForKey:@"login"];
        if (!_isLogin) {
            [self loginVC];
        }
    });
    
    self.navigationController.navigationBar.hidden = YES;
    [self collectionDataArr];
    [self buyDataArr];
    [self callBackArr];
    self.dataArr = [[ZFMDBTool dataArr] mutableCopy];
    [self.tableView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //拉伸顶部图片
    [self lashenBgView];
    //创建导航栏
    [self createNav];
    //初始化数据源
    [self loadData];
    //创建TableView
    [self createTableView];
    //注册cell
    [self registerCell];
    
    
}
- (void)loginVC{
    
    LoginVC *VC = [LoginVC sharedInstance];
    [self.tabBarController presentViewController:VC animated:YES completion:nil];
}

/** 注册cell */
- (void)registerCell{
    
        [self.tableView registerNib:[UINib nibWithNibName:@"ZBMineCell" bundle:nil] forCellReuseIdentifier:Cell];
}

//创建数据源
-(void)loadData{
    _currentIndex=0;
    _dataArray0=[[NSMutableArray alloc]init];
    _dataArray1=[[NSMutableArray alloc]init];
    _dataArray2=[[NSMutableArray alloc]init];
    for (int i=0; i < 3; i++) {
        if (i == 0) {
            
            _dataArray0 = [self.dataArr mutableCopy];
            
//            for (int i=0; i<10; i++) {
//                NSString * string=[NSString stringWithFormat:@"第%d行",i];
//                [_dataArray0 addObject:string];
//            }
        }else if(i == 1){
            for (int i=1; i<8; i++) {
                NSString * string=[NSString stringWithFormat:@"%d 娃",i];
                [_dataArray1 addObject:string];
            }
        }else if (i == 2){
            for (int i=0; i<3; i++) {
                NSString * string=[NSString stringWithFormat:@"this is %d",i];
                [_dataArray2 addObject:string];
            }
        }
    }
}
//拉伸顶部图片
-(void)lashenBgView{
    UIImage *image=[UIImage imageNamed:@"bg_eco3"];
    //图片的宽度设为屏幕的宽度，高度自适应
    NSLog(@"%f",image.size.height);
    _backgroundImgV=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, image.size.height*0.6)];
    _backgroundImgV.contentMode = UIViewContentModeScaleAspectFill;
    _backgroundImgV.image=image;
    _backgroundImgV.userInteractionEnabled=YES;
    [self.view addSubview:_backgroundImgV];
    _backImgHeight=_backgroundImgV.frame.size.height;
    _backImgWidth=_backgroundImgV.frame.size.width;
    _backImgOrgy=_backgroundImgV.frame.origin.y;
}
//创建TableView
-(void)createTableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
        _tableView.backgroundColor=[UIColor clearColor];
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.dataSource=self;
        _tableView.delegate=self;
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 250)];
        footView.backgroundColor = [UIColor whiteColor];
        _tableView.tableFooterView = footView;
        [self.view addSubview:_tableView];
    }
    [_tableView setTableHeaderView:[self headImageView]];
}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    UIView *targetview = sender.view;
    if(targetview.tag == 1) {
        return;
    }
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        if (_currentIndex>1) {
            return;
        }
        _currentIndex++;
    }else if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        if (_currentIndex<=0) {
            return;
        }
        _currentIndex--;
    }
    [_headLineView setCurrentIndex:_currentIndex];
}
-(void)refreshHeadLine:(NSInteger)currentIndex
{
    _currentIndex=currentIndex;
    [_tableView reloadData];
}

//头视图
-(HeadImageView *)headImageView{
    if (!_headImageView) {
        _headImageView=[[HeadImageView alloc]init];
        _headImageView.frame=CGRectMake(0, 64, WIDTH, 170);
        _headImageView.backgroundColor=[UIColor clearColor];
        
        //_headImageView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"个人页背景图.png"]];
        
        _headerImg=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-35, 50, 70, 70)];
        _headerImg.center=CGPointMake(WIDTH/2, 70);
        [_headerImg setImage:[UIImage imageNamed:@"minion"]];
        [_headerImg.layer setMasksToBounds:YES];
        [_headerImg.layer setCornerRadius:35];
        _headerImg.backgroundColor=[UIColor whiteColor];
        _headerImg.userInteractionEnabled=YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        [_headerImg addGestureRecognizer:tap];
        [_headImageView addSubview:_headerImg];
        //昵称
        _nickLabel=[[UILabel alloc]initWithFrame:CGRectMake(147, 130, 105, 20)];
        _nickLabel.center=CGPointMake(WIDTH/2, 125);
        _nickLabel.text=@"Never";
        //        _nickLabel.font=JXFont(14);
        _nickLabel.textColor=[UIColor whiteColor];
        _nickLabel.textAlignment=NSTextAlignmentCenter;
        UIButton *fixBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        fixBtn.frame=CGRectMake(CGRectGetMaxX(_nickLabel.frame)+5, 114, 22, 22);
        [fixBtn setImage:[UIImage imageNamed:@"pencil-light-shadow"] forState:UIControlStateNormal];
        [fixBtn addTarget:self action:@selector(fixClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headImageView addSubview:fixBtn];
        [_headImageView addSubview:_nickLabel];
    }
    return _headImageView;
}
//头像点击事件
-(void)tapClick:(UITapGestureRecognizer *)recognizer{
    NSLog(@"你打到我的头了");
    [self loginVC];
}
//修改昵称
-(void)fixClick:(UIButton *)btn{
    NSLog(@"修改昵称");
   __block  NSString *nikeText = _nickLabel.text;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"修改昵称" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            UITextField *textField = alertController.textFields.firstObject;
        
            //将 昵称输入的内容
            _nickLabel.text = textField.text;
    }]];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入昵称";
        textField.text = nikeText;
    }];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

-(void)createNav{
    self.NavView=[[NavHeadTitleView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 64)];
    self.NavView.title=@"个人中心";
    self.NavView.color=[UIColor whiteColor];
    self.NavView.backTitleImage=@"Mail";
    self.NavView.rightTitleImage=@"Setting";
    self.NavView.delegate=self;
    [self.view addSubview:self.NavView];
}
//左按钮
-(void)NavHeadback{
//    NSLog(@"点击了左按钮");
    MBProgressHUD *HUD =[Tools MBProgressHUDOnlyText:@"暂无信息"];
    [HUD hideAnimated:YES afterDelay:1.5f];
}
//右按钮回调
-(void)NavHeadToRight{
//    NSLog(@"点击了右按钮");
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"你确定删除所有数据？" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [ZFMDBTool deleteAllData];
        self.dataArr = [[ZFMDBTool dataArr] mutableCopy];
        [self.tableView reloadData];
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark ---- UITableViewDelegate ----
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 48;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_currentIndex==0) {
        return self.callBackArr.count;
    }else if(_currentIndex==1){
        return self.buyDataArr.count;
    }else{
        return self.collectionDataArr.count;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (!_headLineView) {
        _headLineView=[[HeadLineView alloc]init];
        _headLineView.frame=CGRectMake(0, 0, WIDTH, 48);
        _headLineView.delegate=self;
        [_headLineView setTitleArray:@[@"回收单",@"购机单",@"心愿单"]];
    }
    //如果headLineView需要添加图片，请到HeadLineView.m中去设置就可以了，里面有注释
    
    return _headLineView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //创建一个静态标识符  来给每一个cell 加上标记  方便我们从复用队列里面取到 名字为该标记的cell
//    static NSString *reusID=@"ID";
    //我创建一个cell 先从复用队列dequeue 里面 用上面创建的静态标识符来取
    
    ZBMineCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    //做一个if判断  如果没有cell  我们就创建一个新的 并且 还要给这个cell 加上复用标识符
    if (!cell) {
        cell = [[ZBMineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell ViewController:self];
    }
    if (_currentIndex==0) {
        
        ZBProductListModel *model = [self.callBackArr objectAtIndex:indexPath.row];
        
        [cell refreshUI:model];
        
        return cell;
        
    }else if(_currentIndex==1){
        
        ZBProductListModel *model = [self.buyDataArr objectAtIndex:indexPath.row];
        
        [cell refreshUI:model];

        return cell;
        
    }else if(_currentIndex==2){
        ZBProductListModel *model = [self.collectionDataArr objectAtIndex:indexPath.row];
        
        [cell refreshUI:model];

        return cell;
    }
    
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //cell被点击恢复
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ZBProductListModel *model;
    if (_currentIndex==0) {
        NSLog(@"第一模块：%ld",indexPath.row);
//        model = [self.dataArr objectAtIndex:indexPath.row];
        return;
    }else if (_currentIndex==1){
        NSLog(@"第二模块：%ld",indexPath.row);
        model = [self.buyDataArr objectAtIndex:indexPath.row];
    }else{
        NSLog(@"第三模块：%ld",indexPath.row);
        model = [self.collectionDataArr objectAtIndex:indexPath.row];
    }
    ZBDetailViewController *VC = [[ZBDetailViewController alloc] init];
    VC.product_id = model.product_id;
    VC.productModel = model;
    self.navigationController.navigationBar.hidden = NO;
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return   UITableViewCellEditingStyleDelete;
    
}

//先要设Cell可编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES;
    
}

//进入编辑模式，按下出现的编辑按钮后

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    [tableView setEditing:NO animated:YES];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"你确定删除该消息？" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            ZBProductListModel *model = [self.dataArr objectAtIndex:indexPath.row];
            //取消收藏
             [[NSUserDefaults standardUserDefaults] setBool:NO forKey:model.product_id];
            [ZFMDBTool deleteData:model];
            [self dataArr];
            [self.tableView reloadData];
        }]];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
}

//修改编辑按钮文字

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

//设置进入编辑状态时，Cell不会缩进
- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


//-(void)popView{
//    [self addAnimation];
//}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int contentOffsety = scrollView.contentOffset.y;
    
    if (scrollView.contentOffset.y<=170) {
        self.NavView.headBgView.alpha=scrollView.contentOffset.y/170;
        self.NavView.backTitleImage=@"Mail";
        self.NavView.rightImageView=@"Setting";
        self.NavView.color=[UIColor whiteColor];
        //状态栏字体白色
        [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
    }else{
        self.NavView.headBgView.alpha=1;
        //self.NavView.title
        self.NavView.backTitleImage=@"Mail-click";
        self.NavView.rightImageView=@"Setting-click";
        self.NavView.color=JXColor(87, 173, 104, 1);
        //隐藏黑线
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        //状态栏字体黑色
        [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleDefault;
    }
    if (contentOffsety<0) {
        CGRect rect = _backgroundImgV.frame;
        rect.size.height = _backImgHeight-contentOffsety;
        rect.size.width = _backImgWidth* (_backImgHeight-contentOffsety)/_backImgHeight;
        rect.origin.x =  -(rect.size.width-_backImgWidth)/2;
        rect.origin.y = 0;
        _backgroundImgV.frame = rect;
    }else{
        CGRect rect = _backgroundImgV.frame;
        rect.size.height = _backImgHeight;
        rect.size.width = _backImgWidth;
        rect.origin.x = 0;
        rect.origin.y = -contentOffsety;
        _backgroundImgV.frame = rect;
        
    }
    
}

- (NSMutableArray *)dataArr{
    
    _dataArr = [[ZFMDBTool dataArr] mutableCopy];

    return _dataArr;
}

- (NSMutableArray *)callBackArr{
    
    _callBackArr = [[ZFMDBTool callBackArr] mutableCopy];
    
    return _callBackArr;
    
}

- (NSMutableArray *)buyDataArr{
    
    _buyDataArr = [[ZFMDBTool buyDataArr] mutableCopy];
    
    return _buyDataArr;
    
}

-(NSMutableArray *)collectionDataArr{
    
    _collectionDataArr = [[ZFMDBTool collectionDataArr] mutableCopy];
    
    return _collectionDataArr;
}
- (MBProgressHUD *)textHUD{
    
    if (!_textHUD) {
        _textHUD = [Tools MBProgressHUDOnlyText:@""];
    }
    return _textHUD;
}

@end
