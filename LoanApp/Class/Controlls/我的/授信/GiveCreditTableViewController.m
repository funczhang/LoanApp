//
//  GiveCreditTableViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/25.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "GiveCreditTableViewController.h"
#import "GiveCreditTableViewCell.h"
@interface GiveCreditTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSMutableArray *data;
@end

@implementation GiveCreditTableViewController
-(NSMutableArray *)data{
    if(_data == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"givecredit" ofType:@"plist"];
        _data = [[NSMutableArray alloc]initWithContentsOfFile:path];
    }
    return  _data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的授信";
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon-refresh"] style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    self.navigationItem.rightBarButtonItem = right;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 0;
}

#pragma mark - Table view data source
-(void)refresh{
    NSLog(@"刷新按钮点击~~~");
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    GiveCreditTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"GiveCreditTableViewCell" owner:self options:nil]lastObject];
    cell.sqr.text = [self.data[indexPath.section]objectForKey:@"sqr"];
    cell.sxed.text = [[self.data[indexPath.section]objectForKey:@"sxed"]stringByAppendingString:@"元"];
    cell.sxsj.text = [self.data[indexPath.section]objectForKey:@"sxsj"];
    cell.spll.text = [[self.data[indexPath.section]objectForKey:@"spll"]stringByAppendingString:@"%"];
    cell.hth.text = [self.data[indexPath.section]objectForKey:@"hth"];
    cell.htqx.text = [self.data[indexPath.section]objectForKey:@"htqx"];
    cell.sqzt.text = [self.data[indexPath.section]objectForKey:@"sqzt"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 275;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
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
