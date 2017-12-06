//
//  AssureTableViewCell.h
//  LoanApp
//
//  Created by 张超 on 2017/11/29.
//  Copyright © 2017年 张超. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XHAssureCell;
@interface AssureTableViewCell : UITableViewCell
@property(strong,nonatomic) XHAssureCell *data;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *id;
@property (weak, nonatomic) IBOutlet UILabel *amount;
-(void)setData:(XHAssureCell *)cell;
@end
