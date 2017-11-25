//
//  GuidViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/24.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "GuidViewController.h"

@interface GuidViewController ()
@property (strong,nonatomic) UIScrollView *scview;
@property (strong,nonatomic) UIImageView *img;
@end

@implementation GuidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"信贷引导";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"guid-page"];
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    _scview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    _img = [[UIImageView alloc]initWithImage:image];
    _img.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width*height/width);
    self.img.contentMode = UIViewContentModeScaleAspectFill;
    _scview.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width*height/width);
    [self.view addSubview:_scview];
    [_scview addSubview:self.img];
}

- (void)didReceiveMemoryWarning {
//    self.view.layer.cornerRadius =
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
