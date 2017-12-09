//
//  BussinessDetailViewController.m
//  tuangou_iphone
//
//  Created by Aidyliu on 2017/12/10.
//  Copyright © 2017年 蔡欣东. All rights reserved.
//

#import "BussinessDetailViewController.h"
#import "BusinessInfoTableViewCell.h"
#import "FinderTableViewCell.h"

@interface BussinessDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation BussinessDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showPayInfo)];
    self.payImageView.userInteractionEnabled = YES;
    [self.payImageView addGestureRecognizer:tapGesture];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showPayInfo{
    
    [UIView animateWithDuration:0.1 animations:^{
        self.payImageView.image = [UIImage imageNamed:@"pic_pay2"];
        self.payImageHeightConstraint.constant = 260;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            
            self.payImageViewTopConstraint.constant = self.payImageView.frame.size.height;
            [self.view layoutIfNeeded];
        }];
    }];
    
    
}
#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 280;
    }
    else if (indexPath.row == 1){
        return 90;
    }
    else{
        return 626;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        BusinessInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BusinessInfoTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.mainImageView.image = [UIImage imageNamed:self.businessModel.businessMainImage];
        cell.titleLabel.text = self.businessModel.businessName;
        cell.samallImageView.image = [UIImage imageNamed:self.businessModel.businessMainImage];
        cell.addressLabel.text = self.businessModel.businessAddress;
        cell.homeTownLabel.text = self.businessModel.businessHomeTown;
        return cell;
    }
    else if (indexPath.row == 1){
        FinderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FinderTableViewCell" forIndexPath:indexPath];
        cell.finderImage.image = [UIImage imageNamed:@"pic_banner2"];
        return cell;
    }
    else{
        FinderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FinderTableViewCell" forIndexPath:indexPath];
        cell.finderImage.image = [UIImage imageNamed:@"pic_foodlist"];
        return cell;
    }
    
//    if (indexPath.section == 0) {
//
//    }
//    else{
//        BussinessTableViewCell *businessCell = [tableView dequeueReusableCellWithIdentifier:@"BussinessTableViewCell" forIndexPath:indexPath];
//        businessCell.businessName.text = bussinessNameArray[indexPath.row];
//        businessCell.businessSalesInfo.text = bussinessSalearray[indexPath.row];
//        businessCell.businessImage.image = [UIImage imageNamed:bussinessImageArray[indexPath.row]];
//        businessCell.imageView1.image = [UIImage imageNamed:foodImage1Array[indexPath.row]];
//        businessCell.imageView2.image = [UIImage imageNamed:foodImage2Array[indexPath.row]];
//        businessCell.imageView3.image = [UIImage imageNamed:foodImage3Array[indexPath.row]];
//        businessCell.businessAddress.text = bussinessAddressArray[indexPath.row];
//        businessCell.bussinessDiscount.text = bussinessDiscountArray[indexPath.row];
//
//        businessCell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return businessCell;
//    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2) {
        [UIView animateWithDuration:0.25 animations:^{
            self.payImageViewTopConstraint.constant = self.payImageView.frame.size.height;
            [self.view layoutIfNeeded];
        }];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
