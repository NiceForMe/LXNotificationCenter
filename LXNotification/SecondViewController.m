//
//  SecondViewController.m
//  LXNotification
//
//  Created by HSEDU on 2019/5/29.
//  Copyright © 2019年 HSEDU. All rights reserved.
//

#import "SecondViewController.h"
#import "LXNotificationCenter/LXNotificationCenter.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[LXNotificationCenter defaultCenter]postNotificationName:@"Test" object:nil userInfo:@{@"age" : @"23"}];
    });
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}



@end
