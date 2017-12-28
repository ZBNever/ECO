//
//  ZBDetailSecondCell.m
//  ECO
//
//  Created by Never on 2017/10/23.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBDetailSecondCell.h"

@implementation ZBDetailSecondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)refreshUI:(ZBProductDetailModel *)dataModel{

    for (int i = 0; i<dataModel.param_value.count; i++) {
        ZBParamValueModel *model = dataModel.param_value[i];
        if ( i == 0) {
            self.firstLab.text = model.p_value;
        }else if (i== 1){
            self.secondLab.text = model.p_value;
        }else if (i == 2){
            self.thirdLab.text = model.p_value;
        }else if (i == 3){
            self.forthLab.text = model.p_value;
        }else if (i == 4){
            self.fifthLab.text = model.p_value;
        }else if (i == 5){
            self.sixthLab.text = model.p_value;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
