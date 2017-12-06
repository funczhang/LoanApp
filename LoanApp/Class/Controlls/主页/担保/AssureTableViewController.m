//
//  AssureTableViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/29.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "AssureTableViewController.h"
#import "AssureTableViewCell.h"
#import "XHAssureCell.h"
@interface AssureTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *data;
@end

@implementation AssureTableViewController
-(NSArray *)data{
    if (_data == nil) {
//        1.获取全路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"assure" ofType:@"plist"];
//        2.读取plist文件
        NSArray *dicArr = [NSArray arrayWithContentsOfFile:path];
//        3.字典转模型
        NSMutableArray *tempDic = [NSMutableArray array];
        for (NSDictionary *dic in dicArr) {
            XHAssureCell *cell = [XHAssureCell cellWithDic:dic];
            [tempDic addObject:cell];
        }
        _data = tempDic;
    }
    return _data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的担保";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.sectionHeaderHeight  = 0;
    self.tableView.sectionFooterHeight = 0;
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
//    1.创建cell
    static NSString *ID = @"assure";
    AssureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"AssureTableViewCell" owner:self options:nil]lastObject];
    }
    XHAssureCell *xh = self.data[indexPath.row];
//    直接赋值就可以
    cell.data = xh;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
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
