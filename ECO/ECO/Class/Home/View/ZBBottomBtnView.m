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
    
    self.backgroundColor = [UIColor blackColor];
    self.alpha = 0.6;
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 0.5)];
    line.backgroundColor = [UIColor colorForCCC];
    [self addSubview:line];
    
    UIButton *checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    checkBtn.frame = CGRectMake(10, 15, 20, 20);
    [checkBtn setImage:[UIImage imageNamed:@"gou_white"] forState:UIControlStateNormal];
    [checkBtn setImage:[UIImage imageNamed:@"gou_green"] forState:UIControlStateSelected];
    [checkBtn addTarget:self action:@selector(checkBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:checkBtn];
    
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    messageBtn.frame = CGRectMake(CGRectGetMaxX(checkBtn.frame), 10, 200, 30);
    [messageBtn setTitle:@"<我已阅读并同意相关条约>" forState:UIControlStateNormal];
    [messageBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    messageBtn.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [messageBtn addTarget:self action:@selector(messageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:messageBtn];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(KWidth-130, 0.5, 130, KHeight)];
    btn.backgroundColor = [UIColor themeColor];
    [btn setTitle:@"提交回收单" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorForF3] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}
- (void)btnAction:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(bottomBtnClick:)]) {
        [self.delegate bottomBtnClick:sender];
    }
}

- (void)checkBtnAction:(UIButton *)sender{
    sender.selected = !sender.selected;
}
- (void)messageBtnAction:(UIButton *)sender{
    
    
    
}
@end
