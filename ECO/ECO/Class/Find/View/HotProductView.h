//
//  HotProductView.h
//  ECO
//
//  Created by Never on 2017/10/10.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotProductView : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *firstImageView;

@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;

@property (weak, nonatomic) IBOutlet UIImageView *thirdImageView;

- (void)refreshUI:(NSArray *)modelArr;

@end
