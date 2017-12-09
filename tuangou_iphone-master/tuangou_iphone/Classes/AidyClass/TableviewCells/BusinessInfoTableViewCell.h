//
//  BusinessInfoTableViewCell.h
//  tuangou_iphone
//
//  Created by Aidyliu on 2017/12/10.
//  Copyright © 2017年 蔡欣东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BusinessInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIView *businessInfoView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *samallImageView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeTownLabel;
@end
