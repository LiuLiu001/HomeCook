//
//  HomeTownViewController.m
//  tuangou_iphone
//
//  Created by Aidyliu on 2017/12/10.
//  Copyright © 2017年 蔡欣东. All rights reserved.
//

#import "HomeTownViewController.h"
#import "HomeTownFoodTableViewCell.h"
#import "BussinessTableViewCell.h"
#import "BussinessDetailViewController.h"
#import "FoodViewController.h"


@interface HomeTownViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
{
    NSArray *bussinessNameArray;
    NSArray *bussinessSalearray;
    NSArray *bussinessImageArray;
    NSArray *foodImage1Array;
    NSArray *foodImage2Array;
    NSArray *foodImage3Array;
    NSArray *bussinessAddressArray;
    NSArray *bussinessDiscountArray;
    NSArray *businessHomeTownArray;
}

@end

@implementation HomeTownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initData{
    bussinessNameArray = @[@"江姐私房菜",@"长春小厨",@"黑龙江烧烤"];
    bussinessSalearray = @[@"辽宁 铁岭人 · 月销101单 · 5.0分 · 30元起送",
                           @"吉林 长春人 · 月销106单 · 5.0分 · 40元起送",
                           @"黑龙江 哈尔滨人 · 月销140单 · 5.0分 · 20元起送"];
    bussinessImageArray = @[@"business1",@"business2",@"business3"];
    foodImage1Array = @[@"A_foodImage1",@"B_foodImage1",@"C_foodImage1"];
    foodImage2Array = @[@"A_foodImage2",@"B_foodImage2",@"C_foodImage2"];
    foodImage3Array = @[@"A_foodImage3",@"B_foodImage3",@"C_foodImage3"];
    bussinessAddressArray= @[@"中山北路1022号 · 600米",@"北京西路200号 · 800米",@"城南美食街9号 · 1.5千米"];
    bussinessDiscountArray = @[@"满100减10",@"满60九折",@"午夜烧烤八折"];
    businessHomeTownArray = @[@"辽宁 铁岭",@"吉林 长春",@"黑龙江 哈尔滨"];
}
#pragma mark - Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    
    else{
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionView = [[UIView alloc]init];
    sectionView.backgroundColor = [UIColor whiteColor];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 300, 15)];
    titleLabel.textColor = [UIColor colorWithRed:220./255. green:77./255. blue:47./255. alpha:1];
    titleLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightBold];
    if (section == 0) {
        titleLabel.text = @"东北美食汇";
    }else{
        titleLabel.text = @"您附近的东北家厨";
    }
    [sectionView addSubview:titleLabel];
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 210;
    }
    else{
        return 200;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HomeTownFoodTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTownFoodTableViewCell" forIndexPath:indexPath];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return Cell;
    }
    else{
        BussinessTableViewCell *businessCell = [tableView dequeueReusableCellWithIdentifier:@"BussinessTableViewCell" forIndexPath:indexPath];
        businessCell.businessName.text = bussinessNameArray[indexPath.row];
        businessCell.businessSalesInfo.text = bussinessSalearray[indexPath.row];
        businessCell.businessImage.image = [UIImage imageNamed:bussinessImageArray[indexPath.row]];
        businessCell.imageView1.image = [UIImage imageNamed:foodImage1Array[indexPath.row]];
        businessCell.imageView2.image = [UIImage imageNamed:foodImage2Array[indexPath.row]];
        businessCell.imageView3.image = [UIImage imageNamed:foodImage3Array[indexPath.row]];
        businessCell.businessAddress.text = bussinessAddressArray[indexPath.row];
        businessCell.bussinessDiscount.text = bussinessDiscountArray[indexPath.row];
        
        businessCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return businessCell;
    }
    //    DealTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    //    dealModel* md = _tableViewDataSource[indexPath.row];
    //    [cell showUIWithModel:md];
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FoodViewController *foodVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FoodViewController"];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:foodVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
    else{
        BusinessModel *model = [[BusinessModel alloc]init];
        model.businessName = bussinessNameArray[indexPath.row];
        model.businessMainImage = bussinessImageArray[indexPath.row];
        model.businessFoodImage1 = foodImage1Array[indexPath.row];
        model.businessFoodImage2 = foodImage2Array[indexPath.row];
        model.businessFoodImage3 = foodImage3Array[indexPath.row];
        model.businessAddress = bussinessAddressArray[indexPath.row];
        model.businessDiscountInfo = bussinessDiscountArray[indexPath.row];
        model.businessHomeTown = businessHomeTownArray[indexPath.row];
        
        BussinessDetailViewController *businessDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"BussinessDetailViewController"];
        businessDetailVC.businessModel = model;
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:businessDetailVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
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
