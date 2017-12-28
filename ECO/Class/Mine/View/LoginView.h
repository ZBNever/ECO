//
//  LoginView.h
//  HunterSmart
//
//  Created by Never on 2017/3/11.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewDelegate <NSObject>

- (void)loginAction:(UIButton *)sender;
- (void)registerAction:(UIButton *)sender;
- (void)forgerPassWordAction:(UIButton *)sender;
- (void)dissmissVC:(UIButton *)sender;

@end

@interface LoginView : UIView

+ (instancetype)loginView;

@property (weak, nonatomic) id <LoginViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextFeild;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;
@property (weak, nonatomic) IBOutlet UIButton *dissmissBtn;

@end
