//
//  PageController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/4.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "PageController.h"

@implementation PageController
//-(id)initwithWitdh:(CGFloat)x withHeight:(CGFloat)y{
//    self = [super init];
//    self.frame = CGRectMake(50, y, 100, 100);
//    self.currentPageIndicatorTintColor = [UIColor redColor];
//    self.pageIndicatorTintColor = [UIColor whiteColor];
//    self.numberOfPages = 4;
//    self.currentPage = 0;
//    return self;
//}
-(id)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        self.frame=CGRectMake(50, frame.size.height, 100, 100);
    }
    return self;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
