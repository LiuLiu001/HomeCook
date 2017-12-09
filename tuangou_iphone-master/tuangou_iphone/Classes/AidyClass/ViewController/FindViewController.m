//
//  FindViewController.m
//  tuangou_iphone
//
//  Created by Aidyliu on 2017/12/10.
//  Copyright © 2017年 蔡欣东. All rights reserved.
//

#import "FindViewController.h"
#import "FinderTableViewCell.h"
#import "HomeTownViewController.h"

@interface FindViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 160;
    }
    else if (indexPath.row == 1){
        return 260;
    }else{
        return 550;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FinderTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"FinderTableViewCell" forIndexPath:indexPath];
        Cell.finderImage.image = [UIImage imageNamed:@"pic_banner"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return Cell;
    }else if (indexPath.row == 1){
        FinderTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"FinderTableViewCell" forIndexPath:indexPath];
        Cell.finderImage.image = [UIImage imageNamed:@"pic_home"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return Cell;
    }else{
        FinderTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"FinderTableViewCell" forIndexPath:indexPath];
        Cell.finderImage.image = [UIImage imageNamed:@"pic_bottle"];
        Cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return Cell;
    }
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        self.hidesBottomBarWhenPushed = YES;
        HomeTownViewController *homeTownVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeTownViewController"];
        
        [self.navigationController pushViewController:homeTownVC animated:YES];
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
