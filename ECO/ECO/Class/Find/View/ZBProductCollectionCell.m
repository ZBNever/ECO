//
//  ZBProductCollectionCell.m
//  ECO
//
//  Created by Never on 2017/10/15.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBProductCollectionCell.h"

@implementation ZBProductCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)refreshUI:(ZBProductListModel *)listModel{
    
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:listModel.main_pic] placeholderImage:[UIImage imageNamed:@"voidImage"]];
    self.priceLab.text = listModel.price;
    self.productNameLab.text = listModel.product_name_str1;
    self.contentLab.text = listModel.product_name_str2;
    
}
@end
