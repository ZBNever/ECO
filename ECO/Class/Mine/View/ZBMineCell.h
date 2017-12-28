//
//  ZBMineCell.h
//  ECO
//
//  Created by Never on 2017/10/27.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBProductListModel.h"

@interface ZBMineCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier ViewController:(UIViewController *)VC;


- (void)refreshUI:(ZBProductListModel *)model;

@end
