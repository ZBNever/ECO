//
//  ZBMineCell.m
//  ECO
//
//  Created by Never on 2017/10/27.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBMineCell.h"

@implementation ZBMineCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier ViewController:(UIViewController *)VC{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)refreshUI:(ZBProductListModel *)model{
    
    [self.productImageView sd_setImageWithURL:[NSURL URLWithString:model.main_pic] placeholderImage:[UIImage imageNamed:@"viodImage"]];
    self.productName.text = model.product_name;
    self.priceLab.text = [NSString stringWithFormat:@"￥%@",model.price];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
