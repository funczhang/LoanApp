//
//  MyTableViewCell.m
//  LoanApp
//
//  Created by 张超 on 2017/11/6.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self crearUI];
    }
    return self;
}
-(void)crearUI
{
    self.label=[[UILabel alloc]init];
}
@end
