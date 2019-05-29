//
//  ViewController.m
//  LXNotification
//
//  Created by HSEDU on 2019/5/29.
//  Copyright © 2019年 HSEDU. All rights reserved.
//

#import "ViewController.h"
#import "LXNotificationCenter/LXNotificationCenter.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    SecondViewController *secVC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:secVC animated:YES];
    [[LXNotificationCenter defaultCenter]addObserver:self selector:@selector(observerAction:) name:@"Test" object:nil];
}

- (void)observerAction:(LXNotification *)noti
{
    NSLog(@"noti user info is %@",noti.userInfo);
}



@end
