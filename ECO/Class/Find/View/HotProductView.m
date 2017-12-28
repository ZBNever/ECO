//
//  HotProductView.m
//  ECO
//
//  Created by Never on 2017/10/10.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "HotProductView.h"
#import "HotProductModel.h"

@implementation HotProductView

- (void)refreshUI:(NSArray *)modelArr{
    
    for (int i = 0; i<modelArr.count; i++) {
        HotProductModel *model = modelArr[i];
        switch (i) {
            case 0:
                {
                    [self.firstImageView sd_setImageWithURL:[NSURL URLWithString: model.hot_banner_url]];
                }
                break;
            case 1:
            {
                [self.secondImageView sd_setImageWithURL:[NSURL URLWithString: model.hot_banner_url]];
            }
                break;
            case 2:
            {
                [self.thirdImageView sd_setImageWithURL:[NSURL URLWithString: model.hot_banner_url]];
            }
                break;
            default:
                break;
        }
    }
}

@end
