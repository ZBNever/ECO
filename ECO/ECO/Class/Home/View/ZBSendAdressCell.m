//
//  ZBSendAdressCell.m
//  ECO
//
//  Created by Never on 2017/11/9.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "ZBSendAdressCell.h"

@implementation ZBSendAdressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)infoBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.addressTextView.secureTextEntry = sender.selected;
    self.nameTextView.secureTextEntry = sender.selected;
    self.phoneNumTextView.secureTextEntry = sender.selected;
}

@end
