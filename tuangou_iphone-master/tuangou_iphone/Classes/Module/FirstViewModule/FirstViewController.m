//
//  FirstViewController2.m
//  tuangou_iphone
//
//  Created by 蔡欣东 on 15/12/2.
//  Copyright © 2015年 蔡欣东. All rights reserved.
//

#import "FirstViewController.h"
#import "TuanGouViewController.h"
#import "CitySelectViewController.h"
#import "DetailViewController.h"
#import "SearchViewController.h"
#import "FirstVCHeaderView.h"
#import "FriendUpTableViewCell.h"
#import "ActivityTableViewCell.h"
#import "BussinessTableViewCell.h"
#import "HomeTownViewController.h"
#import "BusinessModel.h"
#import "BussinessDetailViewController.h"

@interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate,DPRequestDelegate,UISearchBarDelegate,FirstVCHeaderViewDelegate>{
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


@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,strong)FirstVCHeaderView* myHeaderView;
@property(nonatomic,strong)NSMutableArray* tableViewDataSource;
@property(nonatomic,strong)NSString* selectCityName;
@property(nonatomic,strong)NetworkRequest* networkRequest;
@property(nonatomic,strong)NSArray* itemTitles;
@property(strong,nonatomic)UIButton* requestBtn;
@property(nonatomic,strong)AMapLocationManager* locationManager;
@property(nonatomic,strong)UIButton* getMoreBtn;
@property(nonatomic,strong)MJRefreshNormalHeader* header;
@end

@interface FirstViewController (handle)
/**
 * 定位
 **/
-(void)locateRequest;

/**
 * 从NSUserDefaults获取城市数据
 **/
-(void)getCityInUserDefault;

/**
 * 向TuanGouViewController发通知
 **/
-(void)broadcasttoTuanGouVC;

/**
 * 检查当前城市是否为所在城市
 **/
-(void)checkCurrentCityIsLocatedCity;

/**
 * 网络请求
 **/
-(void)request;
@end


@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    self.automaticallyAdjustsScrollViewInsets = NO;
   
    
//    [self locateRequest];
//    [self getCityInUserDefault];
    
    
    
    self.myTableView.tableHeaderView = self.myHeaderView;
//    _myTableView.tableFooterView = self.getMoreBtn;//tableview底部信息
    [_myTableView addSubview:self.requestBtn];
    _requestBtn.hidden = YES;
    _myTableView.header = _header;
    
//    [self request];
     _cityLabel.text = @"彩虹大厦（开拓路）";
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headViewTapAction)];
    [self.myHeaderView addGestureRecognizer:tapGesture];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cityChange:) name:CITYCHANGE1 object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cityChange2:) name:CITYCHANGE2 object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cityChange4:) name:CITYCHANGE4 object:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.mySearchBar resignFirstResponder];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - 初始化数据
- (void)initData{
    bussinessNameArray = @[@"刘阿姨私房菜",@"徽州小厨",@"王叔重庆小面"];
    bussinessSalearray = @[@"江苏 苏州人 · 月销101单 · 5.0分 · 30元起送",
                           @"安徽 芜湖人 · 月销106单 · 5.0分 · 40元起送",
                           @"四川 成都人 · 月销140单 · 5.0分 · 20元起送"];
    bussinessImageArray = @[@"business1",@"business2",@"business3"];
    foodImage1Array = @[@"A_foodImage1",@"B_foodImage1",@"C_foodImage1"];
    foodImage2Array = @[@"A_foodImage2",@"B_foodImage2",@"C_foodImage2"];
    foodImage3Array = @[@"A_foodImage3",@"B_foodImage3",@"C_foodImage3"];
    bussinessAddressArray= @[@"中山北路1022号 · 600米",@"北京西路200号 · 800米",@"城南美食街9号 · 1.5千米"];
    bussinessDiscountArray = @[@"满100减10",@"满60九折",@"特色菜品八折"];
    businessHomeTownArray = @[@"江苏 苏州",@"安徽 芜湖",@"四川 成都"];
//    [self.myTableView reloadData];
}


#pragma mark - dpapi delegate
-(void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    NSDictionary* dict = result;
    dealModel* md = [[dealModel alloc]init];
    _tableViewDataSource =  [NSMutableArray arrayWithArray:[md asignModelWithDict:dict]];
    [_myTableView reloadData];
}

-(void)request:(DPRequest *)request didFailWithError:(NSError *)error{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    NSString *estr = [NSString stringWithFormat:@"%@",error];
    if ([estr containsString:@"Error Domain=Required parameter city is missing"]) {
        NSLog(@"city is missing");
    }else if([estr containsString:@"Error Domain=NSURLErrorDomain Code=-1009"]){
        [_tableViewDataSource removeAllObjects];
        [_myTableView reloadData];
        _requestBtn.hidden = NO;
    }else{
        NSLog(@"%@",error);
    }
}

#pragma mark - HeaderViewTap
- (void)headViewTapAction{
    self.hidesBottomBarWhenPushed = YES;
    HomeTownViewController *homeTownVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeTownViewController"];
    
    [self.navigationController pushViewController:homeTownVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else if (section == 1){
        return 1;
    }
    else{
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 280;
    }
    else if (indexPath.section == 1){
        return 80;
    }else{
        return 200;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ActivityTableViewCell *activityCell = [tableView dequeueReusableCellWithIdentifier:@"ActivityTableViewCell" forIndexPath:indexPath];
        activityCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return activityCell;
    }
    else if (indexPath.section == 1){
        FriendUpTableViewCell *friendUpCell = [tableView dequeueReusableCellWithIdentifier:@"FriendUpTableViewCell" forIndexPath:indexPath];
        friendUpCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return friendUpCell;
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
    if (indexPath.section == 0 || indexPath.section == 1) {
        return;
    }
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

#pragma mark - UISearchBarDelegate
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    SearchViewController* svc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:svc animated:NO];
    return YES;
}

- (IBAction)searchButtonAction:(id)sender {
    SearchViewController* svc = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:svc animated:NO];
}


#pragma mark - FirstVCHeaderViewDelegate
-(void)itemClick:(UIButton *)sender{
    int index = (int)sender.tag-1;
    NSString* selectCategory = self.itemTitles[index];
    TuanGouViewController* tvc = [self.storyboard instantiateViewControllerWithIdentifier:@"TuanGouViewController"];
    tvc.selectCityName = _selectCityName;
    tvc.selectCategory = selectCategory;
    tvc.myFlag = 1;
    [self.navigationController pushViewController:tvc animated:YES];
}


#pragma mark - event response
/**
 * 城市选择按钮
 **/
- (IBAction)cityBtnClick:(UIButton *)sender {
    CitySelectViewController* csv = [self.storyboard instantiateViewControllerWithIdentifier:@"CitySelectViewController"];
    [self.navigationController pushViewController:csv animated:YES];
}
/**
 * 定位按钮
 **/
- (IBAction)locateBtnClick:(UIButton *)sender {
    [self locateRequest];
}

-(void)requestBtnClick:(UIButton*)sender{
    [self request];
}

-(void)getMore:(UIButton*)sender{
    [self.tabBarController setSelectedIndex:1];
}

-(void)cityChange:(NSNotification*)noti{
    _selectCityName = (NSString*)[noti.userInfo valueForKey:cityName1];
    [self broadcasttoTuanGouVC];
    [self request];
}

-(void)cityChange2:(NSNotification*)noti{
    _selectCityName = (NSString*)[noti.userInfo valueForKey:cityName1];
    [self broadcasttoTuanGouVC];
    [self request];
}

-(void)cityChange4:(NSNotification*)noti{
    _selectCityName = [[NSUserDefaults standardUserDefaults]valueForKey:cityName1];
    [self request];
}

#pragma mark - getter
-(UITableView *)myTableView{
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [_myTableView registerNib:[UINib nibWithNibName:CELLID bundle:nil] forCellReuseIdentifier:CELLID];
    return _myTableView;
}

-(FirstVCHeaderView *)myHeaderView{
    if (!_myHeaderView) {
        _myHeaderView = [[FirstVCHeaderView alloc]init];
        _myHeaderView.delegate = self;
        float height = 80;
//        NSString* device = [Utils getDeviceName];
//        if ([device isEqualToString:@"4"]) {
//            height = 380;
//        }else if([device isEqualToString:@"5"]){
//            height = 283;
//        }else if ([device isEqualToString:@"6"]){
//            height = 200;
//        }else if ([device isEqualToString:@"6+"]){
//            height = 120;
//        }
        [_myHeaderView setFrame:CGRectMake(0, 0, WIDTH,height)];
    }
    return _myHeaderView;
}

-(UIButton *)requestBtn{
    if (!_requestBtn) {
        _requestBtn = [[UIButton alloc]initWithFrame:CGRectMake((WIDTH-150)/2, 10,150,150)];
        [_requestBtn setImage:[UIImage imageNamed:@"bg_rotNetwork"] forState:UIControlStateNormal];
        [_requestBtn addTarget:self action:@selector(requestBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _requestBtn;
}

-(UIButton *)getMoreBtn{
    if (!_getMoreBtn) {
        _getMoreBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 44)];
        _getMoreBtn.backgroundColor = [UIColor whiteColor];
        _getMoreBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_getMoreBtn setTitle:@"查看全部团购" forState:UIControlStateNormal ];
        [_getMoreBtn setTitleColor:[UIColor colorWithRed:0.16 green:0.76 blue:0.55 alpha:1.0] forState:UIControlStateNormal];
        _getMoreBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_getMoreBtn addTarget:self action:@selector(getMore:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getMoreBtn;
}

-(MJRefreshNormalHeader *)header{
    if (!_header) {
        MJRefreshNormalHeader* header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self request];
            [_myTableView.header endRefreshing];
        }];
        header.lastUpdatedTimeLabel.hidden = YES;
    }
    return _header;
}

-(NetworkRequest *)networkRequest{
    if (!_networkRequest) {
        _networkRequest = [[NetworkRequest alloc]initWithDelegate:self];
    }
    return _networkRequest;
}

-(NSArray *)itemTitles{
    if (!_itemTitles) {
        _itemTitles = @[@"美食",@"电影",@"酒店",@"休闲娱乐",@"丽人",@"生活服务",@"购物",@"旅游"];
    }
    return _itemTitles;
}

@end

@implementation FirstViewController (handle)

-(void)locateRequest{
    self.locationManager = [[AMapLocationManager alloc]init];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        if (error) {
            NSLog(@"locate error is %@",error);
        }
        if (regeocode) {
            NSString* city = regeocode.city;
            NSString* str = [city substringToIndex:2];
            _selectCityName = str;
            [[NSUserDefaults standardUserDefaults]setValue:str forKey:locatedCity1];
            [[NSUserDefaults standardUserDefaults]setValue:_selectCityName forKey:cityName1];
            [self broadcasttoTuanGouVC];
            [self request];
            NSLog(@"首页-当前城市为%@",_selectCityName);
        }
    }];
}

-(void)getCityInUserDefault{
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud stringForKey:cityName1]) {
        _selectCityName = [ud stringForKey:cityName1];
    }
    if (_selectCityName==nil) {
        _selectCityName = @"广州";
    }
}

-(void)broadcasttoTuanGouVC{
    if (_selectCityName) {
        [[NSUserDefaults standardUserDefaults]setValue:_selectCityName forKey:cityName1];
        [[NSNotificationCenter defaultCenter]postNotificationName:CITYCHANGE3 object:nil];
    }
}

-(void)checkCurrentCityIsLocatedCity{
    NSString* locatedCity = [[NSUserDefaults standardUserDefaults] valueForKey:locatedCity1];
    if (locatedCity) {
        if (![_selectCityName isEqualToString:locatedCity]) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"" message:[NSString stringWithFormat:@"当前定位的城市为 %@ ,是否切换为 %@ ",locatedCity,locatedCity] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* changeAction = [UIAlertAction actionWithTitle:@"切换" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                _selectCityName = locatedCity;
                [self request];
                [self broadcasttoTuanGouVC];
            }];
            UIAlertAction* cancle = [UIAlertAction actionWithTitle:@"再逛逛" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:changeAction];
            [alert addAction:cancle];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
 
}

-(void)request{
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText=@"加载数据中";
    hud.userInteractionEnabled = NO;
    NSLog(@"city is %@",_selectCityName);
    if (_selectCityName) {
        NSDictionary* params = @{city1:_selectCityName,category1:@"美食",limit1:@20,sort1:@1};
        NSMutableDictionary* mulParams = [NSMutableDictionary dictionaryWithDictionary:params];
        [self.networkRequest requestWithParams:mulParams];
    }
    
}
@end
