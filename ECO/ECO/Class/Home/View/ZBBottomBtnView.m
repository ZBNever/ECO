//
//  ZBBottomBtnView.m
//  ECO
//
//  Created by Never on 2017/11/8.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBBottomBtnView.h"

@implementation ZBBottomBtnView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, screen_height-49, screen_width, 49);
        [self initUI];
    }
    return self;
}

- (void)initUI{
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 0.5)];
    line.backgroundColor = [UIColor colorForCCC];
    [self addSubview:line];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(KWidth-130, 0.5, 130, KHeight)];
    btn.backgroundColor = [UIColor themeColor];
    [btn setTitle:@"提交回收单" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorForF3] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}
- (void)btnAction:(UIButton *)sender{
    
    
}
@end
