//
//  LoginViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/21.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "LoginViewController.h"
#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
#define TOP_HEIGHT 64
@interface LoginViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic) UISegmentedControl *seg;
@property (strong,nonatomic) UIScrollView *scroll;
@end

@implementation LoginViewController
-(void)initSeg{
    NSArray *titleArr = @[@"账号登录",@"验证码登录"];
    _seg = [[UISegmentedControl alloc]initWithItems:titleArr];
    _seg.frame = CGRectMake(0, TOP_HEIGHT, SCREEN_W, 60);
//    _seg.segmentedControlStyle = 0;
    [self.view addSubview:_seg];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSeg];
     _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 124, SCREEN_W, SCREEN_H-124-49)];
//    [self.view addSubview:_scroll];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 1500)];
    view1.backgroundColor = [UIColor greenColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 300, 1400);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"测试使用" forState:UIControlStateNormal];
    [view1 addSubview:btn];
    [_scroll addSubview:view1];
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_W, 0, SCREEN_W, 1500)];
    view2.backgroundColor = [UIColor orangeColor];
    view1.backgroundColor = [UIColor greenColor];
    _scroll.delegate = self;
    _scroll.scrollEnabled = YES;
    _scroll.contentSize = CGSizeMake(2*SCREEN_W,SCREEN_H);
    _scroll.pagingEnabled = YES;
    [_scroll addSubview:view2];
//    _scroll.showsVerticalScrollIndicator = YES;
    _scroll.showsVerticalScrollIndicator = NO;
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.bounces = NO;
    [self.view addSubview:_scroll];
    _seg.selectedSegmentIndex = 0;
    [_seg addTarget:self action:@selector(switchTab:) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view from its nib.
}
-(void)switchTab:(UISegmentedControl *) sender{
    NSInteger i = sender.selectedSegmentIndex;
    [_scroll scrollRectToVisible:CGRectMake(i*SCREEN_W,0, SCREEN_W, SCREEN_H-124-49) animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createUI{
}
#pragma 监测滚动
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat x = scrollView.contentOffset.x;
    if(x == SCREEN_W){
        _seg.selectedSegmentIndex = 1;
    } else{
        _seg.selectedSegmentIndex = 0;
    }
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
