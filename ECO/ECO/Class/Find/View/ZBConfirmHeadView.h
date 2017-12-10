//
//  ZBConfirmHeadView.h
//  ECO
//
//  Created by Never on 2017/11/21.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZBConfirmHeadView : UIView

+ (instancetype)initHeadView;

@property (weak, nonatomic) IBOutlet UILabel *priceLab;

@property (nonatomic, strong) NSString *priceText;

@end
