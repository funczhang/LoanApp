//
//  XHAssureCell.m
//  LoanApp
//
//  Created by 张超 on 2017/12/2.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "XHAssureCell.h"

@implementation XHAssureCell
-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(instancetype)cellWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}
@end
