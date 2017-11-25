//
//  MoreViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/4.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "MoreViewController.h"
#import "SuggestViewController.h"
#import "Masonry.h"
@interface MoreViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *cellData;
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
    //    更多模块页面
    UITableView *table = [[UITableView alloc]initWithFrame:[[UIScreen mainScreen] bounds] style:UITableViewStyleGrouped];
    table.dataSource = self;
    table.delegate = self;
    //    设置下边框从0开始
    [table setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
//    设置头部没有空隙
//    self.view.contentInset = UIEdgeInsetsZero;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    table.contentInset = UIEdgeInsetsZero;
//    table.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    //    字典转模型
    NSString *path = [[NSBundle mainBundle] pathForResource:@"moreCell" ofType:@"plist"];
    //    NSArray *arr =
    _cellData = [[NSArray alloc] initWithContentsOfFile:path];
    [self.view addSubview:table];
    // 通过footerview添加退出按钮
    UIButton *exitBtn = [[UIButton alloc]init];
//    600 80
    UIView *foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
//    foot.backgroundColor = [UIColor yellowColor];
    table.tableFooterView = foot;
    [foot addSubview:exitBtn];
    exitBtn.backgroundColor = [UIColor whiteColor];
    [exitBtn addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
    exitBtn.layer.cornerRadius = 20;
    exitBtn.tintColor = [UIColor blackColor];
    [exitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [exitBtn setTitle:@"退出" forState:UIControlStateNormal];
    [exitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(foot.mas_top).offset(30);
        make.left.equalTo(foot.mas_left).offset(50);
        make.right.equalTo(foot.mas_right).offset(-50);
        make.height.mas_equalTo(@40);
    }];
//    设置section头尾高度
    table.sectionFooterHeight = 0;
    table.sectionHeaderHeight = 13;
    
//    [self.view viewWithTag:101]
    
}
-(void)exit{
//    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"退出应用" message:@"是否退出应用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
//    [alert show];
    SuggestViewController *su = [[SuggestViewController alloc]init];
    [self.navigationController pushViewController:su animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [_cellData[indexPath.section][indexPath.row] objectForKey:@"text"];
    cell.imageView.image = [UIImage imageNamed:[_cellData[indexPath.section][indexPath.row] objectForKey:@"icon"]];
    cell.tag = 101 + indexPath.section;
    return cell;
}

#pragma mark - 去除tableview头部高度
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0.1;
//}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
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
