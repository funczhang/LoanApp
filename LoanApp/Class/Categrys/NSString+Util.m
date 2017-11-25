//
//  NSString+Util.m
//  LoanApp
//
//  Created by 张超 on 2017/11/25.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "NSString+Util.h"

@implementation NSString (Util)
+(NSString *)formatNSString:(NSString *)str{
    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
//    NSString *temp = [[NSString alloc]initWithString:@""];
    NSInteger len = [str length];
    NSRange range = NSMakeRange(0, len-4);
    str = [str substringWithRange:range];
    str = [str stringByAppendingString:@"****"];
    return str;
}
@end
