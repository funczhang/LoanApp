//
//  MyViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/4.
//  Copyright © 2017年 张超. All rights reserved.
//
#import "MyViewController.h"
//#import "MyHeaderViewController.h"
#import "Masonry.h"
@interface MyViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *cellData;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"我的";
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"右侧按钮" style:UIBarButtonItemStyleDone target:self action:nil];
    // 我的模块页面
    UITableView *table = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
    table.tableHeaderView = [self createTableHeaderView];
//    设置section高度
    table.sectionFooterHeight = 13;
    table.sectionHeaderHeight = 0;
    table.dataSource = self;
    table.delegate=self;
    // 设置下边框从0开始
    [table setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    // 字典转模型
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cell" ofType:@"plist"];
    _cellData = [[NSArray alloc] initWithContentsOfFile:path];
    [self.view addSubview:table];
}
//点击屏幕
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    CGRect temp =  CGRectMake(0, 0, _blueView.frame.size.width +10, _blueView.frame.size.height +10);
//    _blueView.frame = temp;
//}
-(UIView *)createTableHeaderView{
    UIView *header = [[UIView alloc]init];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    header.frame = CGRectMake(0, 0, width, width*0.42);
    UIImageView *bg = [[UIImageView alloc]initWithFrame:header.bounds];
    bg.image = [UIImage imageNamed:@"bg-my"];
    [header addSubview:bg];
    // 设置头像
    UIImageView *personView = [[UIImageView alloc]init];
    personView.layer.cornerRadius = 40;
    personView.image = [UIImage imageNamed:@"default-img"];
    [bg addSubview:personView];
//    masrony设置
    [personView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(header.mas_centerY).offset(-40);
        make.left.equalTo(header.mas_centerX).offset(-40);
        make.size.mas_equalTo(CGSizeMake(80,80));
    }];
    
//    添加登录注册按钮
    UIButton *loginOrResgin = [[UIButton alloc]init];
    [bg addSubview:loginOrResgin];
    bg.userInteractionEnabled=YES;
    [loginOrResgin setTitle:@"登录/注册" forState:UIControlStateNormal];
    [loginOrResgin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginOrResgin addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [loginOrResgin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(personView.mas_bottom).offset(5);
        make.centerX.equalTo(bg.mas_centerX).offset(0);
        make.height.mas_equalTo(30);
    }];
//    bg.userInteractionEnabled=YES;
    return header;
}
-(void)login{
    UIAlertView *login = [[UIAlertView alloc]initWithTitle:@"登录注册" message:@"跳转登录注册页面" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [login show];
}
#pragma mark - tableview datasource
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 1.0;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0;
//}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 2;
    } else {
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    NSDictionary *dic = [[NSDictionary alloc]init];
    dic = _cellData[indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[dic objectForKey:@"icon"]];
    cell.textLabel.text = [dic objectForKey:@"text"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
#pragma mark - table头部
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *head = [[UIView alloc]init];
//    head.frame = CGRectMake(0, 0, 100, 100);
//    head.backgroundColor = [UIColor yellowColor];
//    return head;
//}
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    if (section == 0) {
//        return @"section1 header";
//    } else if(section == 1){
//        return @"section2 header";
//    } else {
//        return @"section3 header";
//    }
//}
//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    if (section == 0) {
//        return @"section1 footer";
//    } else if(section == 1){
//        return @"section2 footer";
//    } else {
//        return @"section3 footer";
//    }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
