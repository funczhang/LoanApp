//
//  BankCardTableViewCell.h
//  LoanApp
//
//  Created by 张超 on 2017/11/24.
//  Copyright © 2017年 张超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankCardTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bank;
//@property (weak, nonatomic) IBOutlet UILabel *type;
//@property (weak, nonatomic) IBOutlet UILabel *card;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *card;

@end
