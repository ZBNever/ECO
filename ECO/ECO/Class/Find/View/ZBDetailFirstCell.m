//
//  ZBDetailFirstCell.m
//  ECO
//
//  Created by Never on 2017/10/18.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBDetailFirstCell.h"

@implementation ZBDetailFirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)refreshUI:(ZBProductDetailModel *)model{
    
    self.firstLab.text = model.product_name;
    self.secondLab.text = model.netword_string;
    self.thirdLab.text = model.banben_string;
    self.forthLab.text = [NSString stringWithFormat:@"￥%@", model.price];
    self.fifthLab.text = [NSString stringWithFormat:@"全新:￥%@", model.ori_price];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
