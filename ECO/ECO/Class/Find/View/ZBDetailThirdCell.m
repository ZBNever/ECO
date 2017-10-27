//
//  ZBDetailThirdCell.m
//  ECO
//
//  Created by Never on 2017/10/26.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBDetailThirdCell.h"

@implementation ZBDetailThirdCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)refreshUI:(ZBProductDetailModel *)model{
    
    self.IMEILab.text = [NSString stringWithFormat:@"IMEI:%@",model.imei];
    self.nameLab.text = model.engineer_name;
    self.jobLab.text = model.professional;
    self.resultLab.text = model.check_res;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
