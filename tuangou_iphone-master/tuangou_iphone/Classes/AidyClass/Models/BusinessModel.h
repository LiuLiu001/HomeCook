//
//  BusinessModel.h
//  tuangou_iphone
//
//  Created by Aidyliu on 2017/12/10.
//  Copyright © 2017年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusinessModel : NSObject
@property (nonatomic, copy) NSString *businessName; // 头部标题
@property (nonatomic, copy) NSString *businessMainImage;
@property (nonatomic, copy) NSString *businessFoodImage1;
@property (nonatomic, copy) NSString *businessFoodImage2;
@property (nonatomic, copy) NSString *businessFoodImage3;
@property (nonatomic, copy) NSString *businessAddress;
@property (nonatomic, copy) NSString *businessHomeTown;
@property (nonatomic, copy) NSString *businessDiscountInfo;

@end
