//
//  CategoriesView.h
//  ECO
//
//  Created by Never on 2017/10/1.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCategoriesModel.h"

@interface CategoriesView : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *phoneImageView;
@property (weak, nonatomic) IBOutlet UILabel *phoneTitle;
@property (weak, nonatomic) IBOutlet UILabel *phoneDesc;

@property (weak, nonatomic) IBOutlet UIImageView *macbookImageView;
@property (weak, nonatomic) IBOutlet UILabel *macbookTitle;
@property (weak, nonatomic) IBOutlet UILabel *macbookDesc;


@property (weak, nonatomic) IBOutlet UIImageView *ipadImageView;
@property (weak, nonatomic) IBOutlet UILabel *ipadTitle;
@property (weak, nonatomic) IBOutlet UILabel *ipadDesc;


@property (weak, nonatomic) IBOutlet UIImageView *cameraImageView;
@property (weak, nonatomic) IBOutlet UILabel *cameraTitle;
@property (weak, nonatomic) IBOutlet UILabel *cameraDesc;


@property (weak, nonatomic) IBOutlet UIImageView *otherImageView;
@property (weak, nonatomic) IBOutlet UILabel *otherTitle;
@property (weak, nonatomic) IBOutlet UILabel *otherDesc;

- (void)refreshUI:(NSArray *)modelArr;

@end
