//
//  CategoriesView.m
//  ECO
//
//  Created by Never on 2017/10/1.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "CategoriesView.h"



@implementation CategoriesView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)refreshUI:(NSArray *)modelArr{
    
    for (int i = 0; i<modelArr.count; i++) {
        
        HomeCategoriesModel *model = modelArr[i];
        switch ([model.Id intValue]) {

            case 1:
            {
                [self.phoneImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
                self.phoneTitle.text = model.name;
                self.phoneDesc.text = model.subtitle;
            }
                break;
            case 5:
            {
                [self.macbookImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
                self.macbookTitle.text = model.name;
                self.macbookDesc.text = model.subtitle;
            }
                break;
            case 6:
            {
                [self.ipadImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
                self.ipadTitle.text = model.name;
                self.ipadDesc.text = model.subtitle;
            }
                break;
            case 22:
            {
                
                [self.cameraImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
                self.cameraTitle.text = model.name;
                self.cameraDesc.text = model.subtitle;
            }
                break;
            case 3:
            {
                [self.otherImageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
                self.otherTitle.text = model.name;
                self.otherDesc.text = model.subtitle;
            }
                break;
                
            default:
                break;
        }
        
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
