//
//  ZBDetailSecondCell.h
//  ECO
//
//  Created by Never on 2017/10/23.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBProductDetailModel.h"

@interface ZBDetailSecondCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *firstLab;
@property (weak, nonatomic) IBOutlet UILabel *secondLab;
@property (weak, nonatomic) IBOutlet UILabel *thirdLab;
@property (weak, nonatomic) IBOutlet UILabel *forthLab;
@property (weak, nonatomic) IBOutlet UILabel *fifthLab;
@property (weak, nonatomic) IBOutlet UILabel *sixthLab;

- (void)refreshUI:(ZBProductDetailModel *)dataModel;

@end
