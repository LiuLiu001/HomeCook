//
//  BussinessDetailViewController.h
//  tuangou_iphone
//
//  Created by Aidyliu on 2017/12/10.
//  Copyright © 2017年 蔡欣东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessModel.h"

@interface BussinessDetailViewController : UIViewController

@property (strong,nonatomic) BusinessModel *businessModel;
@property (weak, nonatomic) IBOutlet UIImageView *payImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *payImageViewTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *payImageHeightConstraint;

@end
