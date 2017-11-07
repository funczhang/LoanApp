//
//  LoanViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/4.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "LoanViewController.h"
#import "Masonry.h"
#import "AFNetworking.h"
#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height

@interface LoanViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray *cellData;
@end

@implementation LoanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"我的贷款";
    
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 49 - 64 ) style:UITableViewStyleGrouped];
    
//    设置代理
    table.dataSource = self;
    table.delegate = self;
//    table.backgroundColor=[UIColor yellowColor];
//    table.contentInset = UIEdgeInsetsZero;
//    table.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:table];
    /* 创建网络请求对象 */
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    /* 设置请求和接收的数据编码格式 */
    session.requestSerializer = [AFJSONRequestSerializer serializer]; // 设置请求数据为 JSON 数据
    session.responseSerializer = [AFJSONResponseSerializer serializer]; // 设置接收数据为 JSON 数据
    /* 设置请求头 */
    [session.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
//    NSDictionary *parmdic=@{@"key":@"123",
//                            @"":@""
//                            };
    [session GET:@"http://194.168.1.154:8080/app/xsyd/homePageInit.do" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"请求成功");
        NSDictionary *dic=(NSDictionary *)responseObject;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
    
}
#pragma mark - table delagate
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    //    字典转模型
    NSString *path = [[NSBundle mainBundle] pathForResource:@"loanCell" ofType:@"plist"];
    //    NSArray *arr =
    _cellData = [[NSArray alloc] initWithContentsOfFile:path];
    NSDictionary *dic = [[NSDictionary alloc]init];
    dic = _cellData[indexPath.section][indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"text"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *foot = [[UIView alloc]init];
    foot.backgroundColor = [UIColor whiteColor];
    if(section == 0) {
        foot.backgroundColor = [UIColor colorWithRed:31.0/255 green:118.0/255 blue:226.0/255 alpha:0.9];
        UIImageView *progress = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fail03"]];
//        progress.contentMode = UIViewContentModeScaleAspectFill;
        [foot addSubview:progress];
    } else {
        UILabel *label1 = [[UILabel alloc]init];
        label1.text = @"授信额度(万)";
        UILabel *label2 = [[UILabel alloc]init];
        label2.text = @"利率(月)";
        UILabel *label3 = [[UILabel alloc]init];
        label3.text = @"截止日期(月)";
        UILabel *label4 = [[UILabel alloc]init];
        label4.text = @"10.0万";
        UILabel *label5 = [[UILabel alloc]init];
        label5.text = @"4.356%";
        UILabel *label6 = [[UILabel alloc]init];
        label6.text = @"24";
        [foot addSubview:label1];
        [foot addSubview:label2];
        [foot addSubview:label3];
        [foot addSubview:label4];
        [foot addSubview:label5];
        [foot addSubview:label6];
        label1.textAlignment = YES;
        label2.textAlignment = YES;
        label3.textAlignment = YES;
        label4.textAlignment = YES;
        label5.textAlignment = YES;
        label6.textAlignment = YES;
        [label1 setTextColor:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1]];
        [label2 setTextColor:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1]];
        [label3 setTextColor:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1]];
        [label4 setTextColor:[UIColor redColor]];
        [label5 setTextColor:[UIColor colorWithRed:31.0/255 green:118.0/255 blue:226.0/255 alpha:1]];
        [label6 setTextColor:[UIColor colorWithRed:31.0/255 green:118.0/255 blue:226.0/255 alpha:1]];
        
        label4.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.f];
        label5.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.f];
        label6.font = [UIFont fontWithName:@"Helvetica-Bold" size:20.f];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(foot.mas_top).offset(10);
            make.left.equalTo(foot.mas_left).offset(0);
            make.right.equalTo(foot.mas_right).offset(-self.view.bounds.size.width*0.66);
            make.height.mas_equalTo(30);
        }];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(foot.mas_top).offset(10);
            make.left.equalTo(label1.mas_right).offset(0);
            make.right.equalTo(foot.mas_right).offset(-self.view.bounds.size.width*0.33);
            make.height.mas_equalTo(30);
        }];
        [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(foot.mas_top).offset(10);
            make.left.equalTo(label2.mas_right).offset(0);
            make.right.equalTo(foot.mas_right).offset(0);
            make.height.mas_equalTo(30);
        }];
        [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label1.mas_bottom).offset(10);
            make.left.equalTo(foot.mas_left).offset(0);
            make.right.equalTo(foot.mas_right).offset(-self.view.bounds.size.width*0.66);
            make.height.mas_equalTo(20);
        }];
        [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label2.mas_bottom).offset(10);
            make.left.equalTo(label4.mas_right).offset(0);
            make.right.equalTo(foot.mas_right).offset(-self.view.bounds.size.width*0.33);
            make.height.mas_equalTo(20);
        }];
        [label6 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label3.mas_bottom).offset(10);
            make.left.equalTo(label5.mas_right).offset(0);
            make.right.equalTo(foot.mas_right).offset(0);
            make.height.mas_equalTo(20);
        }];
    }
    return foot;
}
#pragma mark - 去除tableview头部高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 80;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0.1;
//}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
//-(NSInteger)
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
