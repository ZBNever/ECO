//
//  LoginVC.m
//  HunterSmart
//
//  Created by Never on 2017/3/10.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "LoginVC.h"
#import "YGGravity.h"
#import "YGGravityImageView.h"
#import "LoginView.h"

@interface LoginVC () <LoginViewDelegate>

@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, strong) MBProgressHUD *HUD;
@property (nonatomic, strong) MBProgressHUD *textHUD;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    
    YGGravityImageView *imageView = [[YGGravityImageView alloc]initWithFrame:CGRectMake(0, 0, screen_width , screen_height)];
    //添加毛玻璃效果
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectview.frame = CGRectMake(0, 0, screen_width, screen_height);
    [imageView addSubview:effectview];
    //图片宽度必须超出屏幕宽度，否则没效果！！！
    imageView.image = [UIImage imageNamed:@"login_bg6.png"];
    [self.view addSubview:imageView];
    [imageView startAnimate];

    self.loginView = [LoginView loginView];
    self.loginView.delegate = self;
    self.loginView.backgroundColor = [UIColor clearColor];
    self.loginView.frame = self.view.bounds;
    [self.view addSubview:self.loginView];
}

-(void)loginAction:(id)sender{
    
    if (!_HUD) {
        _HUD = [Tools MBProgressHUD:@""];
    }

    if (self.loginView.phoneTextField.text.length<11) {
        _HUD.label.text = @"请输入11位手机号";
        [_HUD showAnimated:YES];
        [_HUD hideAnimated:YES afterDelay:1.5f];
        return;
    }else if (self.loginView.codeTextFeild.text.length<6){
        _HUD.label.text = @"请输入6位密码";
         [_HUD showAnimated:YES];
        [_HUD hideAnimated:YES afterDelay:1.5f];
        return;
    }else{
         [_HUD showAnimated:YES];
        _HUD.label.text = @"正在登录……";
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        [_HUD hideAnimated:YES];

        if (!_textHUD) {
            _textHUD = [Tools MBProgressHUDOnlyText:@"登录成功"];
        }else{

            [_textHUD showAnimated:YES];
        }
        [_textHUD hideAnimated:YES afterDelay:2.0f];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"login"];
        [self dissmissVC:nil];
    });

    
}
- (void)registerAction:(id)sender{
//    NSLog(@"sendr:%@",sender);
    if (!_HUD) {
        _HUD = [Tools MBProgressHUD:@""];
    }
    
    if (self.loginView.phoneTextField.text.length<11) {
        _HUD.label.text = @"请输入11位手机号";
        [_HUD showAnimated:YES];
        [_HUD hideAnimated:YES afterDelay:1.5f];
        return;
    }else if (self.loginView.codeTextFeild.text.length<6){
        _HUD.label.text = @"请输入6位密码";
        [_HUD showAnimated:YES];
        [_HUD hideAnimated:YES afterDelay:1.5f];
        return;
    }else{
        [_HUD showAnimated:YES];
        _HUD.label.text = @"正在注册……";
    }
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [_HUD hideAnimated:YES];
        
        if (!_textHUD) {
            _textHUD = [Tools MBProgressHUDOnlyText:@"注册成功"];
        }else{
            
            [_textHUD showAnimated:YES];
        }
        [_textHUD hideAnimated:YES afterDelay:2.0f];
        [self dissmissVC:nil];
    });
    
}
- (void)forgerPassWordAction:(id)sender{
    
//    NSLog(@"sendr:%@",sender);
}
- (void)dissmissVC:(id)sender{
    
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"login"]) {
        self.tabBarController.selectedIndex = 0;
    }
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    
}

- (NSInteger )getString{
    
    NSInteger x = arc4random()%1000000;
    
    NSLog(@"%ld",x);
    
    return x;
    
}

+ (instancetype)sharedInstance
{
    static LoginVC *VC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        VC = [[self alloc] init];
        
    });
    return VC;
}


@end
