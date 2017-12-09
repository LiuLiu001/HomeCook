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
#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 280;
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
