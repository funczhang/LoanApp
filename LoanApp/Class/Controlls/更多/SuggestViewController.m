//
//  SuggestViewController.m
//  LoanApp
//
//  Created by 张超 on 2017/11/23.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "SuggestViewController.h"

@interface SuggestViewController ()<UIImagePickerControllerDelegate,UINavigationBarDelegate>
@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIButton *four;
@property (weak, nonatomic) IBOutlet UITextField *text1;
@property (weak, nonatomic) IBOutlet UITextField *text2;
@property (weak, nonatomic) IBOutlet UIButton *camera;

@end

@implementation SuggestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:237.0/255 green:237.0/255 blue:237.0/255 alpha:1];
    [self.one setImage:[UIImage imageNamed:@"selected-radio"] forState:UIControlStateHighlighted];
    [self.two setImage:[UIImage imageNamed:@"selected-radio"] forState:UIControlStateHighlighted];
    [self.three setImage:[UIImage imageNamed:@"selected-radio"] forState:UIControlStateHighlighted];
    [self.four setImage:[UIImage imageNamed:@"selected-radio"] forState:UIControlStateHighlighted];
    [self.text1 setBorderStyle:UITextBorderStyleLine];
    [self.text2 setBorderStyle:UITextBorderStyleLine];
//    self.text1.layer.borderColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1].CGColor;
    self.text1.layer.borderColor = nil;
    self.text1.backgroundColor = [UIColor whiteColor];
    self.text1.layer.borderWidth = 0;
    self.text2.layer.borderColor = nil;
    self.text2.backgroundColor = [UIColor whiteColor];
    self.text2.layer.borderWidth = 0;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btn:(id)sender {
    UIImagePickerController *picker = [UIImagePickerController new];
    
    picker.delegate = self;
    
    picker.allowsEditing = YES;
    
    //打开相册
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:nil];
//    UIImagePickerController *type = UIImagePickerControllerSourceTypeCamera;
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
