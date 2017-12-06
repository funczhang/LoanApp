//
//  HybridViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/27.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "HybridViewController.h"

@interface HybridViewController ()

@end

@implementation HybridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"兴盛e贷";
//    [self.navigationController setNavigationBarHidden:YES];
//    self.tabBarController hi
//    [self.tabBarController hidesBottomBarWhenPushed];
    self.view.backgroundColor = [UIColor whiteColor];
    UIWebView *main = [[UIWebView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height-20)];
    main.scalesPageToFit = YES;
//    网络加载
//    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
////    本地资源加载
//    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"index"
//                                                         ofType:@"html"
//                                                    inDirectory:@"dist"];
//    NSString *url = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
//    NSString *path=[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"dist"];
//    NSString *path2=[[NSBundle mainBundle] pathsForResourcesOfType:@"html" inDirectory:@"dist"];
//    NSString *path3=[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"dist"];
//    NSString *abc = @"/work/LoanApp/LoanApp/dist";
//    NSString *pathStr = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:nil];
//    NSURL *url = [NSURL fileURLWithPath:pathStr];
//    NSURL *url = [NSURL fileURLWithPath:filePath];
//    NSURL *url=[[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html" subdirectory:@"dist"];
//    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
//    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    [main loadHTMLString:html baseURL:baseURL];
//    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"dist"];
    NSURL *fileURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:fileURL];
    [main loadRequest:request];
    [self.view addSubview:main];
}

- (void)didReceiveMemoryWarning {
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
