//
//  ZBConfirmHeadView.m
//  ECO
//
//  Created by Never on 2017/11/21.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBConfirmHeadView.h"

@implementation ZBConfirmHeadView

+ (instancetype)initHeadView{
    
    return [[NSBundle mainBundle] loadNibNamed:@"ZBConfirmHeadView" owner:self options:nil][0];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
