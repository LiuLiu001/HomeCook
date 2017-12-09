//
//  BussinessTableViewCell.h
//  tuangou_iphone
//
//  Created by Aidyliu on 2017/12/9.
//  Copyright © 2017年 蔡欣东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessModel.h"

@interface BussinessTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *businessName;
@property (weak, nonatomic) IBOutlet UILabel *businessSalesInfo;
@property (weak, nonatomic) IBOutlet UIImageView *businessImage;

@property (weak, nonatomic) IBOutlet UIScrollView *foodInfoScrollerView;

@property (weak, nonatomic) IBOutlet UILabel *businessAddress;
@property (weak, nonatomic) IBOutlet UILabel *bussinessDiscount;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;

@property (strong,nonatomic) BusinessModel *businessModel;
@end
