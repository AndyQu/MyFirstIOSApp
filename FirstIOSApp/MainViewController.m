//
//  MainViewController.m
//  FirstIOSApp
//
//  Created by andy on 15/11/25.
//  Copyright © 2015年 andy. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *label;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textField=[[UITextField alloc] initWithFrame:CGRectMake(10.f, 30.0f, 300.0f, 30.0f)];
    self.textField.borderStyle=UITextBorderStyleRoundedRect;
    self.textField.delegate = self;
    
    UIButton* button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(110.0f, 200.0f, 100.0f, 30.0f);
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Press Me" forState:UIControlStateNormal];
    
    self.label=[[UILabel alloc]initWithFrame:CGRectMake(115.0f, 300.0f, 200.0f, 30.0f)];
    
    [self.view addSubview:self.textField];
    [self.view addSubview:button];
    [self.view addSubview:self.label];
}

- (void)buttonPressed {
    self.label.text=self.textField.text;
    CGRect newFrame=self.label.frame;
    newFrame.origin.x+=50;
    CGRect oldFrame=self.label.frame;
    
    [UIView animateWithDuration:1.5
                     animations:^{
                         self.label.frame=newFrame;
                     }
                     completion:^(BOOL fininshed){
                         [UIView animateWithDuration:2.0
                                          animations:^{
                                              self.label.frame=oldFrame;
                                          }];
                         
                     }
     ];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 告诉操作系统移除前置的软键盘
    [textField resignFirstResponder];
    
    //returns NO. 加入一个换行字符
    //文本框忽略
    return NO;
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
