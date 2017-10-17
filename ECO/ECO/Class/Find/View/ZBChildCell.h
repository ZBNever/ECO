//
//  ZBChildCell.h
//  ECO
//
//  Created by Never on 2017/10/15.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBProductDataModel.h"



@interface ZBChildCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageHeadView;

- (void)refreshUI:(ZBProductDataModel *)model;

@end
