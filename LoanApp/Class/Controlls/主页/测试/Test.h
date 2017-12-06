//
//  Test.h
//  LoanApp
//
//  Created by 张超 on 2017/12/5.
//  Copyright © 2017年 张超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *gender;
@property (nonatomic,copy) NSString *age;
-(instancetype)initWithData:(NSDictionary *)dic;
+(instancetype)initWithData:(NSDictionary *)dic;
@end
