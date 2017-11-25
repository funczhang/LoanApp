//
//  UseCreditTableViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/22.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "UseCreditTableViewController.h"
#import "UseCreditTableViewCell.h"
@interface UseCreditTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (assign,nonatomic) NSInteger count;
@property (strong,nonatomic) NSMutableArray *data;
@end

@implementation UseCreditTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的用信";
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 0;
//    [self.tableView registerNib:[UINib nibWithNibName:@"UseCreditTableViewCell" bundle:[NSBundle mainBundle] ] forCellReuseIdentifier:@"UseCreditTableViewCell"];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    NSString *path = [[NSBundle mainBundle] pathForResource:@"usecredit" ofType:@"plist"];
    _data = [[NSMutableArray alloc]initWithContentsOfFile:path];
    return _data.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UseCreditTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UseCreditTableViewCell"];
//    if (!cell) {
//        cell=[[UseCreditTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UseCreditTableViewCell"];
//    }
    UseCreditTableViewCell *cell= [[[NSBundle  mainBundle]  loadNibNamed:@"UseCreditTableViewCell" owner:self options:nil]  lastObject];
    NSInteger index = indexPath.section + indexPath.row;
    cell.hth.text = [[_data objectAtIndex:index] objectForKey:@"id"];
    cell.jkr.text = [[_data objectAtIndex:index] objectForKey:@"borrower"];
    cell.jkh.text = [[_data objectAtIndex:index] objectForKey:@"borrownumber"];
    cell.yll.text = [[_data objectAtIndex:index] objectForKey:@"rate"];
    cell.ykje.text = [[_data objectAtIndex:index] objectForKey:@"amount"];
    cell.yksj.text = [[_data objectAtIndex:index] objectForKey:@"time"];
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    UseCreditTableViewCell *cell1 = (UseCreditTableViewCell *)cell;
//    for (int i = 0; i < _data.count; i++) {
//        cell1.hth.text = [[_data objectAtIndex:i] objectForKey:@"id"];
//        cell1.jkr.text = [[_data objectAtIndex:i] objectForKey:@"borrower"];
//        cell1.jkh.text = [[_data objectAtIndex:i] objectForKey:@"borrownumber"];
//        cell1.yll.text = [[_data objectAtIndex:i] objectForKey:@"rate"];
//        cell1.ykje.text = [[_data objectAtIndex:i] objectForKey:@"amount"];
//        cell1.yksj.text = [[_data objectAtIndex:i] objectForKey:@"time"];
//    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 260;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
