//
//  ZBCallBackView.m
//  ECO
//
//  Created by Never on 2017/11/7.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBCallBackView.h"

@implementation ZBCallBackView

+(instancetype)initCallBackView{
    
    return [[NSBundle mainBundle] loadNibNamed:@"ZBCallBackView" owner:self options:nil].lastObject;
}

@end
