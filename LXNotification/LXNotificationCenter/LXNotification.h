//
//  LXNotification.h
//  LXNotification
//
//  Created by HSEDU on 2019/5/29.
//  Copyright © 2019年 HSEDU. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString * LXNotificationName;

@interface LXNotification : NSObject
@property (nonatomic,copy) LXNotificationName name;
@property (nonatomic,strong) NSDictionary *userInfo;
@property (nullable,nonatomic,strong) id object;
- (instancetype)initWithNotificationName:(LXNotificationName)notificationName object:(id)object userInfo:(NSDictionary *)userInfo;
+ (instancetype)notificationWithName:(LXNotificationName)name object:(id)object;
+ (instancetype)notificationWithName:(LXNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo;
@end

