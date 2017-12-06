//
//  AssureTableViewCell.m
//  LoanApp
//
//  Created by 张超 on 2017/11/29.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "AssureTableViewCell.h"
#import "XHAssureCell.h"
@implementation AssureTableViewCell
//懒加载 设置data的值
-(void)setData:(XHAssureCell *)cell{
//    如果拖线到.h文件中可以在外部操作，拖到.m文件中我们可以传递一个模型对象来赋值，外部不可访问私有属性
    _data = cell;
    self.name.text = cell.name;
    self.id.text = cell.id;
    self.amount.text = cell.amount;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
