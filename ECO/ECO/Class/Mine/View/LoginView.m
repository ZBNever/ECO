//
//  LoginView.m
//  HunterSmart
//
//  Created by Never on 2017/3/11.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "LoginView.h"

@interface LoginView () <UITextFieldDelegate>

@end

@implementation LoginView 

+ (instancetype)loginView{
    
    return [[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:self options:nil][0];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor greenColor];

    self.loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.loginBtn setTitle:@"请输入11位手机号码" forState:UIControlStateNormal];
    self.loginBtn.tag = 0;
    self.loginBtn.enabled = NO;
    self.loginBtn.layer.borderWidth = 1.0f;
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = 5.0;
    
    self.phoneTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.phoneTextField.delegate = self;
    self.phoneTextField.layer.borderWidth = 1.0f;
    self.phoneTextField.layer.masksToBounds = YES;
    self.phoneTextField.layer.cornerRadius = 5.0;
    self.codeTextFeild.layer.borderColor = [UIColor whiteColor].CGColor;
    self.codeTextFeild.delegate = self;
    self.codeTextFeild.layer.borderWidth = 1.0f;
    self.codeTextFeild.layer.masksToBounds = YES;
    self.codeTextFeild.layer.cornerRadius = 5.0;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self endEditing:YES];
}

- (IBAction)loginBtnAction:(UIButton *)sender {
    
    switch (sender.tag) {
        case 0:
            {

            }
            break;
            case 1:
            {
                NSString *code = [self getString];
                [[NSUserDefaults standardUserDefaults] setObject:code forKey:@"code"];
                [self.loginBtn setTitle:code forState:UIControlStateNormal];
            }
            break;
        case 2:
        {
                if ([self.delegate respondsToSelector:@selector(loginAction:)]) {
            
                    [self.delegate loginAction:sender];
                }
        }
            break;
        default:
            break;
    }

//    self.tag += 1;
    

}
- (NSString *)getString{
    
    NSInteger x = arc4random()%1000000;
    
    NSString *code = [NSString stringWithFormat:@"%06ld",x];
    
    NSLog(@"%@",code);
    
    return code;
    
}
- (IBAction)registerBtnAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(registerAction:)]) {
        [self.delegate registerAction:sender];
    }
}

- (IBAction)forgetPassWordBtnAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(forgerPassWordAction:)]) {
        [self.delegate forgerPassWordAction:sender];
    }
}
- (IBAction)dissmissVC:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(dissmissVC:)]) {
        [self.delegate dissmissVC:sender];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if ([textField isEqual:self.phoneTextField]) {
        if (range.location > 10) {
            
            MBProgressHUD *hud = [Tools MBProgressHUDOnlyText:@"手机号超出11位，请检查一下"];
            [hud hideAnimated:YES afterDelay:1.0];
            self.loginBtn.enabled = YES;
            self.loginBtn.tag = 1;
            [self.loginBtn setTitle:@"获取登录密码" forState:UIControlStateNormal];
            return NO;
        }else{
            return YES;
        }
    }else{
    
        if (range.location > 5) {
            
            MBProgressHUD *hud = [Tools MBProgressHUDOnlyText:@"超出6位，请检查一下"];
            NSString *code = [[NSUserDefaults standardUserDefaults] objectForKey:@"code"];
            
            if ([textField.text isEqualToString:code]) {
                [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
                self.loginBtn.tag = 2;
            }
            [hud hideAnimated:YES afterDelay:1.0];
            return NO;
        }else{
            return YES;
        }
        
        }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (self.phoneTextField.text.length == 11) {
        self.loginBtn.enabled = YES;
        self.loginBtn.tag = 1;
        [self.loginBtn setTitle:@"获取登录密码" forState:UIControlStateNormal];
        
    }else{
        MBProgressHUD *hud = [Tools MBProgressHUDOnlyText:@"请输入11位手机号码"];
        [hud hideAnimated:YES afterDelay:1.5f];
        [self.phoneTextField becomeFirstResponder];
        return;
    }
    
    if (self.codeTextFeild.text.length == 6) {
        NSString *code = [[NSUserDefaults standardUserDefaults] objectForKey:@"code"];
        
        if ([textField.text isEqualToString:code]) {
            [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
            self.loginBtn.tag = 2;
        }
    }else{
        MBProgressHUD *hud = [Tools MBProgressHUDOnlyText:@"请输入6位密码"];
        [hud hideAnimated:YES afterDelay:1.5f];
        [self.codeTextFeild becomeFirstResponder];
    }

    
}

- (void)drawRect:(CGRect)rect {
    // Drawing code

}
- (void)layoutSubviews{

    
}

@end
