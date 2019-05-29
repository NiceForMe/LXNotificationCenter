//
//  LXNotification.m
//  LXNotification
//
//  Created by HSEDU on 2019/5/29.
//  Copyright © 2019年 HSEDU. All rights reserved.
//

#import "LXNotification.h"

@implementation LXNotification
- (instancetype)initWithNotificationName:(LXNotificationName)notificationName object:(id)object userInfo:(NSDictionary *)userInfo
{
    if (self = [super init]) {
        self.name = notificationName;
        self.object = object;
        self.userInfo = userInfo;
    }
    return self;
}

+ (instancetype)notificationWithName:(LXNotificationName)name object:(id)object
{
    return [self notificationWithName:name object:object userInfo:nil];
}

+ (instancetype)notificationWithName:(LXNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo
{
    LXNotification *noti = [[LXNotification alloc]initWithNotificationName:name object:object userInfo:userInfo];
    return noti;
}
@end
