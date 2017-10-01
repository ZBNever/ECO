//
//  HomeCell.m
//  HunterSmart
//
//  Created by Never on 2017/3/8.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "HomeCell.h"
#import "UIImageView+WebCache.h"

@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)refresAihuishouhUI:(HomeHotProductsModel *)model{
    
//    NSURL *imageUrl = [NSURL URLWithString:model.imgUrl];
//    NSData *data = [NSData dataWithContentsOfURL:imageUrl];
//    UIImage *image = [UIImage imageWithData:data];
    
    [self.cellImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:nil];
    self.cellLab.text = model.name;
    
}


- (IBAction)deleteBtn:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(deleteCell:)]) {
        [self.delegate deleteCell:sender];
    }
}


@end
