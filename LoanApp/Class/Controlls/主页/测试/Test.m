//
//  Test.m
//  LoanApp
//
//  Created by 张超 on 2017/12/5.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "Test.h"

@implementation Test
-(instancetype)initWithData:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(instancetype)initWithData:(NSDictionary *)dic{
    return [[self alloc]initWithData:dic];
}
@end
