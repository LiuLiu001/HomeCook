//
//  FirstVCHeaderView.m
//  tuangou_iphone
//
//  Created by 蔡欣东 on 15/12/2.
//  Copyright © 2015年 蔡欣东. All rights reserved.
//

#import "FirstVCHeaderView.h"

@implementation FirstVCHeaderView

-(instancetype)init{
    if ([super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"FirstVCHeaderView" owner:self options:nil]firstObject];
    }
    
    self.headImageView.layer.masksToBounds = YES;
    self.headImageView.layer.cornerRadius = self.headImageView.frame.size.width * 0.5;
    return self;
}
- (IBAction)itemBtnClick:(UIButton *)sender {
//    [self.delegate itemClick:sender];
}

@end
