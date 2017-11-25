//
//  RepayViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/23.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "RepayViewController.h"
#import "RepayTableViewCell.h"
@interface RepayViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSMutableArray* data;
@end
@implementation RepayViewController
-(NSMutableArray *)data{
    if(_data == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:@"repay" ofType:@"plist"];
        _data = [[NSMutableArray alloc]initWithContentsOfFile:path];
    }
    return _data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的还款";
//    self.navigationItem.title
    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 0;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RepayTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"RepayTableViewCell" owner:self options:nil]lastObject];
    cell.jjh.text = [[self.data objectAtIndex:indexPath.section]objectForKey:@"jjh"];
    cell.jkr.text = [[self.data objectAtIndex:indexPath.section]objectForKey:@"jkr"];
    cell.yll.text = [[[self.data objectAtIndex:indexPath.section]objectForKey:@"yll"]stringByAppendingString:@"%"];
    cell.hkzh.text = [[self.data objectAtIndex:indexPath.section]objectForKey:@"hkzh"];
    cell.hkje.text = [[self.data objectAtIndex:indexPath.section]objectForKey:@"hkje"];
    cell.hklx.text = [[self.data objectAtIndex:indexPath.section]objectForKey:@"hklx"];
    cell.hksj.text = [[self.data objectAtIndex:indexPath.section]objectForKey:@"hksj"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
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
