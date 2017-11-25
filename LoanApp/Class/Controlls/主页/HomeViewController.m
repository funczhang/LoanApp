//
//  HomeViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/4.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "HomeViewController.h"
#import "PageController.h"
#import "Masonry.h"
#import "InformTableViewController.h"
#import "LoginViewController.h"
#import "UseCreditTableViewController.h"
#import "RepayViewController.h"
#import "GuidViewController.h"
#import "BankCardViewController.h"
#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
@interface HomeViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic,strong) UIScrollView *sv;
@property (nonatomic,strong) NSArray *images;
@property (nonatomic,strong) PageController *pageContro;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSTimer *timer;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *main = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, SCREEN_W, SCREEN_H-64-49)];
    main.contentSize = CGSizeMake(0, SCREEN_H-64);
    [self.view addSubview:main];
    main.userInteractionEnabled = YES;
    main.backgroundColor = [UIColor whiteColor];
    main.scrollEnabled = YES;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon-email"] style:UIBarButtonItemStylePlain target:self action:@selector(toInform)];
    self.navigationItem.rightBarButtonItem = right;
    UIImageView *titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-logo"]];
    self.navigationItem.titleView = titleView;
    _scrollView = [self createScrollView:main.bounds.size.width withHight:main.bounds.size.width*0.42];
    _scrollView.delegate = self;
    [main addSubview:_scrollView];
    UIView *informView = [[UIView alloc]init];
    informView.backgroundColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1];
    informView.frame = CGRectMake(0, self.view.bounds.size.width*0.42, self.view.bounds.size.width, 30);
    UIImageView *informLogo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-inform"]];
    [informView addSubview:informLogo];
    [informLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(informView.mas_top).offset(8);
        make.left.equalTo(informView.mas_left).offset(20);
        make.bottom.equalTo(informView.mas_bottom).offset(-8);
        make.width.mas_equalTo(@50);
    }];
    UIView *dot = [[UIView alloc]init];
    [informView addSubview:dot];
    dot.layer.cornerRadius = 3;
    [dot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@6);
        make.width.equalTo(@6);
        make.left.equalTo(informLogo.mas_right).offset(15);
        make.top.equalTo(informView.mas_centerY).offset(-3);
    }];
    
//    UIButton
    UILabel *inform = [[UILabel alloc]init];
    inform.text = @"兴盛e贷APP上线！";
    inform.font = [UIFont systemFontOfSize:13];
    [inform setTextColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]];
    [informView addSubview:inform];
    [inform mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(informView.mas_top).offset(10);
        make.left.equalTo(dot.mas_right).offset(5);
        make.bottom.equalTo(informView.mas_bottom).offset(-10);
        make.right.equalTo(informView.mas_right).offset(0);
    }];
    [main addSubview:informView];
    //    快捷图标
    UIView *quickGoView = [[UIView alloc]init];
    [main addSubview:quickGoView];
//    quickGoView.backgroundColor = [UIColor redColor];
    [quickGoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(informView.mas_bottom).offset(0);
        make.height.equalTo(@110);
        make.width.mas_equalTo(self.view.bounds.size.width);
    }];
    UIImageView *accountImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-account"]];
    UIImageView *loanImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-loan"]];
    UIImageView *repayImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-pay"]];
    UIImageView *guaranteeImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-guarantee"]];
    UILabel *accountLabel = [[UILabel alloc]init];
    UILabel *loanLabel = [[UILabel alloc]init];
    UILabel *repayLabel = [[UILabel alloc]init];
    UILabel *guaranteeLabel = [[UILabel alloc]init];
    accountLabel.text = @"我的银行卡";
    loanLabel.text = @"我的用信";
    repayLabel.text = @"我的还款";
    guaranteeLabel.text = @"我的担保";
    [quickGoView addSubview:accountImg];
    [quickGoView addSubview:loanImg];
    [quickGoView addSubview:repayImg];
    [quickGoView addSubview:guaranteeImg];
    [quickGoView addSubview:accountLabel];
    [quickGoView addSubview:loanLabel];
    [quickGoView addSubview:repayLabel];
    [quickGoView addSubview:guaranteeLabel];
    accountLabel.textAlignment = YES;
    loanLabel.textAlignment = YES;
    repayLabel.textAlignment = YES;
    guaranteeLabel.textAlignment = YES;
    [accountLabel setTextColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]];
    [loanLabel setTextColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]];
    [repayLabel setTextColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]];
    [guaranteeLabel setTextColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]];
    CGFloat off = (CGFloat)(SCREEN_W-180)/8;
//    给图片添加约束
    [accountImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(quickGoView.mas_top).offset(18);
        make.left.equalTo(quickGoView.mas_left).offset(off);
        make.height.equalTo(@45);
        make.width.equalTo(@45);
    }];
    [loanImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(quickGoView.mas_top).offset(18);
        make.left.equalTo(accountImg.mas_right).offset(off*2);
        make.height.equalTo(@45);
        make.width.equalTo(@45);
    }];
    [repayImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(quickGoView.mas_top).offset(18);
        make.left.equalTo(loanImg.mas_right).offset(off*2);
        make.height.equalTo(@45);
        make.width.equalTo(@45);
    }];
    [guaranteeImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(quickGoView.mas_top).offset(18);
        make.left.equalTo(repayImg.mas_right).offset(off*2);
        make.height.equalTo(@45);
        make.width.equalTo(@45);
    }];
//    给label添加约束
    [accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(accountImg.mas_bottom).offset(10);
        make.bottom.equalTo(quickGoView.mas_bottom).offset(-18);
        make.left.equalTo(quickGoView.mas_left).offset(0);
        make.width.mas_equalTo(SCREEN_W/4);
    }];
    [loanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loanImg.mas_bottom).offset(10);
        make.bottom.equalTo(quickGoView.mas_bottom).offset(-18);
        make.left.equalTo(accountLabel.mas_right).offset(0);
        make.width.mas_equalTo(SCREEN_W/4);
    }];
    [repayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(repayImg.mas_bottom).offset(10);
        make.bottom.equalTo(quickGoView.mas_bottom).offset(-18);
        make.left.equalTo(loanLabel.mas_right).offset(0);
        make.width.mas_equalTo(SCREEN_W/4);
    }];
    [guaranteeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(guaranteeImg.mas_bottom).offset(10);
        make.bottom.equalTo(quickGoView.mas_bottom).offset(-18);
        make.left.equalTo(repayLabel.mas_right).offset(0);
        make.width.mas_equalTo(SCREEN_W/4);
    }];
    // 添加申请view
    UIView *applyView = [[UIView alloc]init];
    UIImageView *applyImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-apply2"]];
//    applyImg.frame = CGRectMake(0, 0, SCREEN_W, 130);
    [main addSubview:applyView];
    [applyView addSubview:applyImg];
//    applyView.backgroundColor = [UIColor yellowColor];
    [applyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(quickGoView.mas_bottom).offset(0);
        make.width.mas_equalTo(SCREEN_W);
        make.height.equalTo(@115);
    }];
    [applyImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(applyView.mas_top).offset(0);
        make.height.mas_equalTo(130);
        make.left.mas_equalTo(applyView.mas_left).offset(10);
        make.right.mas_equalTo(applyView.mas_right).offset(-10);
    }];
    UIView *more = [[UIView alloc]init];
    [main addSubview:more];
//    more.backgroundColor = [UIColor redColor];
    [more mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(applyView.mas_bottom).offset(18);
        make.width.mas_equalTo(SCREEN_W);
        make.height.equalTo(@115);
    }];
    CGFloat moreDis = (SCREEN_W-330)/4;
    UIImageView *pay = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-1"]];
    UIImageView *money = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-2"]];
    UIImageView *activity = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-3"]];
    UILabel *guid = [[UILabel alloc]init];
    UILabel *service = [[UILabel alloc]init];
    UILabel *hot = [[UILabel alloc]init];
    guid.text = @"信贷引导";
    service.text = @"理财服务";
    hot.text = @"热门活动";
    [more addSubview:pay];
    [more addSubview:money];
    [more addSubview:activity];
    [pay addSubview:guid];
    [money addSubview:service];
    [activity addSubview:hot];
    [pay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(more.mas_top).offset(0);
        make.left.equalTo(more.mas_left).offset(moreDis);
        make.width.mas_equalTo(110);
        make.height.equalTo(@110);
    }];
    [money mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(more.mas_top).offset(0);
        make.left.equalTo(pay.mas_right).offset(moreDis);
        make.width.mas_equalTo(110);
        make.height.equalTo(@110);
    }];
    [activity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(more.mas_top).offset(0);
        make.left.equalTo(money.mas_right).offset(moreDis);
        make.width.mas_equalTo(110);
        make.height.equalTo(@110);
    }];
//    添加label的约束
    [guid mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pay.mas_top).offset(12);
        make.left.equalTo(pay.mas_left).offset(13);
        make.right.equalTo(pay.mas_right).offset(-10);
        make.height.equalTo(@20);
    }];
    [service mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(money.mas_top).offset(12);
        make.left.equalTo(money.mas_left).offset(13);
        make.right.equalTo(money.mas_right).offset(-10);
        make.height.equalTo(@20);
    }];
    [hot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(activity.mas_top).offset(12);
        make.left.equalTo(activity.mas_left).offset(13);
        make.right.equalTo(activity.mas_right).offset(-10);
        make.height.equalTo(@20);
    }];
    repayLabel.userInteractionEnabled = YES;
    
    //    给图片添加一个手势
    ////  打开图片用户交互
    accountImg.userInteractionEnabled = YES;
    //    初始化一个手势
//    UIGestureRecognizer *singleTap = [[UIGestureRecognizer alloc]initWithTarget:self action:@selector(toRepay:)];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toUseLoan:)];
     UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toRepay:)];
    repayLabel.userInteractionEnabled = YES;
    //    为图片添加手势
//    [accountImg addGestureRecognizer:singleTap];
    loanLabel.userInteractionEnabled = YES;
    [loanLabel addGestureRecognizer:singleTap];
    [repayLabel addGestureRecognizer:singleTap2];
    //    打开图片用户交互
    UITapGestureRecognizer *guidGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toGuid:)];
    pay.userInteractionEnabled = YES;
    [pay addGestureRecognizer:guidGes];
    
    
    UITapGestureRecognizer *bankCardGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toBankCardList:)];
    accountLabel.userInteractionEnabled = YES;
    [accountLabel addGestureRecognizer:bankCardGes];
    
//    添加定时器
    [self addTimer];
    
}
-(void)toBankCardList:(UITapGestureRecognizer *)sender{
    BankCardViewController *card = [[BankCardViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:card animated:YES];
}
-(void)toGuid:(UITapGestureRecognizer *)sender{
    GuidViewController *guid = [[GuidViewController alloc]init];
    [self.navigationController pushViewController:guid animated:YES];
}
-(void)toUseLoan:(UITapGestureRecognizer *)sender{
    UseCreditTableViewController *use = [[UseCreditTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:use animated:YES];
}
-(void)toRepay:(UITapGestureRecognizer *)sender{
    RepayViewController *repay = [[RepayViewController alloc]initWithStyle:UITableViewStyleGrouped];
    [self.navigationController pushViewController:repay animated:YES];
}
-(void)toLogin{
    LoginViewController *login = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
}
-(UIScrollView *)createScrollView:(CGFloat) width withHight:(CGFloat) height{
    UIScrollView *view = [[UIScrollView alloc]init];
    view.frame = CGRectMake(0, 0, width, height);
    //    1.添加图片view和图片
    for (int i=0; i<4; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.frame = CGRectMake(width*i, 0, width, height);
        NSString *imageName = [NSString stringWithFormat:@"0%i",i+1];
        imageView.image = [UIImage imageNamed:imageName];
        [view addSubview:imageView];
    }
    //    2.设置滚动范围也就是滚动视图的高度和宽度
    view.contentSize = CGSizeMake(width*4, 0);
    //    3.设置分页
    view.pagingEnabled = YES;
    //    4.添加定时器
    //    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    return view;
}
-(void)nextImage{
     NSInteger page = _pageContro.currentPage;
     if (page == 3){
         page = 0;
     } else{
         page ++;
     }
     _scrollView.contentOffset = CGPointMake(self.view.frame.size.width*page, 0);
     [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width*page, 0) animated:YES];
     
 }
-(void)addTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
}
-(void)toInform{
    InformTableViewController *inform = [[InformTableViewController alloc]init];
    [self.navigationController pushViewController:inform animated:YES];
}
#pragma mark - watch scroll
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offectX = scrollView.contentOffset.x;
    CGFloat width = scrollView.frame.size.width;
    int pageNum = (offectX +0.5 *width)/width;
//    [self.view viewWithTag:101].currentPage = pageNum;
    _pageContro.currentPage = pageNum;
//    [self.view viewWithTag:101];
}
-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_timer invalidate];
    _timer = nil;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self addTimer];
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
