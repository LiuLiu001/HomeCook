//
//  BusinessInfoTableViewCell.m
//  tuangou_iphone
//
//  Created by Aidyliu on 2017/12/10.
//  Copyright © 2017年 蔡欣东. All rights reserved.
//

#import "BusinessInfoTableViewCell.h"

@implementation BusinessInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.samallImageView.layer.masksToBounds = YES;
    self.samallImageView.layer.cornerRadius = self.samallImageView.frame.size.width * 0.5;
    
    self.businessInfoView.layer.masksToBounds = YES;
    self.businessInfoView.layer.cornerRadius = 20;
    self.businessInfoView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.businessInfoView.layer.shadowOffset = CGSizeMake(0, 0);
    self.businessInfoView.layer.shadowOpacity = 0.6;
    self.businessInfoView.layer.shadowRadius = 20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
