//
//  MyTableViewCell.m
//  LoanApp
//
//  Created by 张超 on 2017/11/6.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "MyTableViewCell.h"
#import "Masonry.h"
@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    UILabel *label = [[UILabel alloc]init];
    label.text = @"系统公告";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:15];
    UILabel *time = [[UILabel alloc]init];
    time.text = @"11:20";
    time.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    time.font = [UIFont systemFontOfSize:12];
    UILabel *content = [[UILabel alloc]init];
    content.text = @"公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容公告内容";
    content.textColor = [UIColor blackColor];
    content.font = [UIFont systemFontOfSize:13];
    content.numberOfLines = 0;
    [content sizeToFit];
    UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-system-inform"]];
    [self.contentView addSubview:label];
    [self.contentView addSubview:icon];
    [self.contentView addSubview:time];
    [self.contentView addSubview:content];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(25);
        make.left.equalTo(self.contentView.mas_left).offset(15);
        make.width.mas_equalTo(36);
        make.height.mas_equalTo(36);
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(25);
        make.left.equalTo(icon.mas_right).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-100);
        make.height.mas_equalTo(10);
    }];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(25);
        make.left.equalTo(label.mas_right).offset(10);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.mas_equalTo(10);
    }];
    [content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(10);
        make.left.equalTo(icon.mas_right).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-25);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
}
@end
