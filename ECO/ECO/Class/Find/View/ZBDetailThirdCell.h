//
//  ZBDetailThirdCell.h
//  ECO
//
//  Created by Never on 2017/10/26.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBProductDetailModel.h"

@interface ZBDetailThirdCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *IMEILab;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *jobLab;
@property (weak, nonatomic) IBOutlet UILabel *resultLab;

- (void)refreshUI:(ZBProductDetailModel *)model;

@end
