//
//  BussinessTableViewCell.m
//  tuangou_iphone
//
//  Created by Aidyliu on 2017/12/9.
//  Copyright © 2017年 蔡欣东. All rights reserved.
//

#import "BussinessTableViewCell.h"

@implementation BussinessTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.businessImage.layer.cornerRadius = 15;
    self.businessImage.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
