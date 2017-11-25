//
//  BankCardViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/24.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "BankCardViewController.h"
#import "BankCardTableViewCell.h"
#import "NSString+Util.h"
@interface BankCardViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSMutableArray *data;
@end

@implementation BankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的银行卡";
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 0;
//    self.tableView.bounces = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 15)];
    headView.backgroundColor = [UIColor colorWithRed:244.0/255 green:244.0/255 blue:244.0/255 alpha:1];
    self.tableView.tableHeaderView = headView;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 110)];
    view.backgroundColor = [UIColor whiteColor];
    UIView *btnView = [[UIView alloc]initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 50)];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(0, 15, self.view.bounds.size.width,50);
    btnView.backgroundColor = [UIColor colorWithRed:244.0/255 green:244.0/255 blue:244.0/255 alpha:1];
    UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-add"]];
    icon.frame = CGRectMake(self.view.bounds.size.width/2 - 50, 15, 20, 20);
    [btnView addSubview:icon];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2 - 20, 15, 100, 20)];
    title.textAlignment = NSTextAlignmentLeft;
    title.text = @"添加银行卡";
    [btnView addSubview:title];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addCard:)];
    btnView.userInteractionEnabled = YES;
    [btnView addGestureRecognizer:tap];
//    btn.imageView.image = [UIImage imageNamed:@"icon-add"];
//    btn.titleLabel.text = @"添加银行卡";
    [view addSubview:btnView];
    self.tableView.tableFooterView = view;
    
}
-(void)addCard:(UITapGestureRecognizer *)sender{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"确认" message:@"确认添加银行卡" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:@"取消", nil];
    [alert show];
}
//-(void)loadData{
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"bank" ofType:@"plist"];
//    NSMutableArray *dic = [NSMutableDictionary dictionaryWithContentsOfFile:path];
//    _data = dic;
//}
-(NSMutableArray *)data{
    if (_data == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"bank" ofType:@"plist"];
        _data = [[NSMutableArray alloc]initWithContentsOfFile:path];
    }
    return _data;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    BankCardTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"BankCardTableViewCell" owner:self options:nil]lastObject];
    cell.bank.text = [self.data[indexPath.section]objectForKey:@"bank"];
    cell.type.text = [self.data[indexPath.section]objectForKey:@"type"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.card.text = [NSString formatNSString:[self.data[indexPath.section]objectForKey:@"card"]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
