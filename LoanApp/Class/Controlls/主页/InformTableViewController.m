//
//  InformTableViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/8.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "InformTableViewController.h"
#import "MyTableViewCell.h"
@interface InformTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation InformTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"系统公告",@"活动公告",nil]];
    seg.selectedSegmentIndex = 0;
    [seg addTarget:self action:@selector(segChange:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = seg;
//    设置tableview左侧的间隙为0
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    header.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    self.tableView.tableHeaderView = header;
    
}
-(void)segChange:(UISegmentedControl *)seg{
    if(seg.selectedSegmentIndex == 0) {
        
    } else {
        
    }
}
#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell *cell = [[MyTableViewCell alloc]init];
//    cell.backgroundColor = [UIColor yellowColor];
    return cell;
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
