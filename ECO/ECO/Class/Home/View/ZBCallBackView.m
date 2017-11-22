//
//  ZBCallBackView.m
//  ECO
//
//  Created by Never on 2017/11/7.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBCallBackView.h"

@implementation ZBCallBackView

- (instancetype)initWithFrame:(CGRect)frame model:(HomeHotProductsModel *)model{
    
//    self.model = model;
    if (self = [super initWithFrame:frame]) {
      [self addSubview: [ZBCallBackView initCallBackView]];
        [self.productImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
        self.priceLab.text = model.topPrice;
        self.nameLab.text = model.name;
    }
    return self;
    
}

+ (instancetype)shareManager{
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        instance = [[self alloc] init];
        instance = [self initCallBackView];
    });
    return instance;
    
}

+(instancetype)initCallBackView{
    
    return [[NSBundle mainBundle] loadNibNamed:@"ZBCallBackView" owner:self options:nil].lastObject;
}

- (void)setModel:(HomeHotProductsModel *)model{
    
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
    self.priceLab.text = [NSString stringWithFormat:@"%@元",model.topPrice];
    self.nameLab.text = model.name;
}

- (void)refreshHeadUI:(HomeHotProductsModel *)model{
    

}
@end
