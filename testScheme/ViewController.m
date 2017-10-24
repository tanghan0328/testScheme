//
//  ViewController.m
//  testScheme
//
//  Created by tang on 2017/10/24.
//  Copyright © 2017年 tang. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btn = [[UIButton alloc]initWithFrame:CGRectZero];
    [self.btn setTitle:@"测试" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(onCLickTarget:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.left.equalTo(self.view).with.offset(25);
        make.right.equalTo(self.view).with.offset(-25);
        make.top.equalTo(self.view).with.offset(25);
    }];
}

- (void)onCLickTarget:(UIButton *)btn
{
    NSURL *url = [NSURL URLWithString:@"Photos://"];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        // 系统小于10的时候，打开Wi-Fi界面
        [[UIApplication sharedApplication] openURL:url];
    } else {
        // 系统大于10的时候直接打开当前App的设置界面
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
