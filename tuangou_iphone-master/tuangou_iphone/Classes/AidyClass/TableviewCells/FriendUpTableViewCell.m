//
//  FriendUpTableViewCell.m
//  tuangou_iphone
//
//  Created by Aidyliu on 2017/12/9.
//  Copyright © 2017年 蔡欣东. All rights reserved.
//

#import "FriendUpTableViewCell.h"

@implementation FriendUpTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.outView.layer.borderColor = [UIColor colorWithRed:220.f/255.f green:220.f/255.f blue:220.f/255.f alpha:1].CGColor;
    self.outView.layer.borderWidth = 1;
    self.outView.layer.cornerRadius = 20;
    self.outView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
