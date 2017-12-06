//
//  XHAssureCell.h
//  LoanApp
//
//  Created by 张超 on 2017/12/2.
//  Copyright © 2017年 张超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHAssureCell : NSObject
//姓名
@property (nonatomic,copy) NSString *name;
//身份证
@property (nonatomic,copy) NSString *id;
//金额
@property (nonatomic,copy) NSString *amount;
-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)cellWithDic:(NSDictionary *)dic;
@end
