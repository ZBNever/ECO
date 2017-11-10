//
//  ZBBottomBtnView.h
//  ECO
//
//  Created by Never on 2017/11/8.
//  Copyright © 2017年 Never. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZBBottomBtnViewDelegate <NSObject>

- (void)bottomBtnClick:(UIButton *)sender;

@end

@interface ZBBottomBtnView : UIView

@property (nonatomic, weak) id<ZBBottomBtnViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;

@end
