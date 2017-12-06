//
//  TestViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/12/5.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "TestViewController.h"
#import "TestCell.h"
#import "Test.h"
@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSArray *data;
@end

@implementation TestViewController
-(NSArray *)data{
    if(_data == nil) {
//        获取全路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"plist"];
//        读取plist文件
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
//        字典转模型
        NSMutableArray *temp = [NSMutableArray new];
        for (NSDictionary *dic in tempArr) {
            Test *t = [Test initWithData:dic];
            [temp addObject:t];
        }
        _data = temp;
    }
    return _data;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"测试使用";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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
//    TestCell alloc
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test"];
    if (cell == nil) {
        cell  = [[[NSBundle mainBundle]loadNibNamed:@"TestCell" owner:self options:nil]lastObject];
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
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
