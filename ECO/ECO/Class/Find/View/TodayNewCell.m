//
//  TodayNewCell.m
//  ECO
//
//  Created by Never on 2017/10/11.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "TodayNewCell.h"

@implementation TodayNewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)refreshUI:(TodayNewDataModel *)model{
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.main_pic]];
    self.descLab.text = model.product_name_str1;
    self.colorLab.text = model.product_name_str2;
    self.priceLab.text = [NSString stringWithFormat:@"￥%@",model.price];
}
@end
