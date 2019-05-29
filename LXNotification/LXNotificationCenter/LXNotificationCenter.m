//
//  LXNotificationCenter.m
//  LXNotification
//
//  Created by HSEDU on 2019/5/29.
//  Copyright © 2019年 HSEDU. All rights reserved.
//

#import "LXNotificationCenter.h"
#import "LXNotificationModel.h"

@interface LXNotificationCenter ()
@property (nonatomic,strong) NSMutableArray *modelArray;
@end

@implementation LXNotificationCenter
//单例
+ (LXNotificationCenter *)defaultCenter
{
    static LXNotificationCenter *center;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        center = [[LXNotificationCenter alloc]init];
    });
    return center;
}

- (NSMutableArray *)modelArray
{
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}

#pragma mark - postNotification
- (void)postNotification:(LXNotification *)notification
{
    [self.modelArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LXNotificationModel *model = obj;
        if ([model.notificationName isEqualToString:notification.name]) {
            if (!model.operationQueue) {
                [model.observer performSelector:model.selector withObject:notification];
            }else{
                NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
                    model.block(notification);
                }];
                NSOperationQueue *queue = model.operationQueue;
                [queue addOperation:operation];
            }
        }
    }];
}

- (void)postNotificationName:(LXNotificationName)name object:(id)object
{
    [self postNotificationName:name object:object userInfo:nil];
}

- (void)postNotificationName:(LXNotificationName)name object:(id)object userInfo:(NSDictionary *)userInfo
{
    LXNotification *noti = [[LXNotification alloc]initWithNotificationName:name object:object userInfo:userInfo];
    [self postNotification:noti];
}

#pragma mark - addObserver
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(LXNotificationName)aName object:(id)anObject
{
    LXNotificationModel *model = [[LXNotificationModel alloc]init];
    model.observer = observer;
    model.selector = aSelector;
    model.notificationName = aName;
    model.object = anObject;
    [self.modelArray addObject:model];
}

- (void)addObserverForName:(LXNotificationName)name object:(id)object queue:(NSOperationQueue *)queue usingBlock:(void (^)(LXNotification *))block
{
    LXNotificationModel *model = [[LXNotificationModel alloc]init];
    model.notificationName = name;
    model.object = object;
    model.operationQueue = queue;
    model.block = block;
    [self.modelArray addObject:model];
}

#pragma mark - remove observer
- (void)removeObserver:(id)observer
{
    [self removeObserver:observer notificationName:nil object:nil];
}

- (void)removeObserver:(id)observer notificationName:(LXNotificationName)name object:(id)object
{
    [self.modelArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LXNotificationModel *model = obj;
        if (name != nil && name.length > 0) {
            if (observer == model.observer && [name isEqualToString:model.notificationName]) {
                [self.modelArray removeObject:model];
                NSLog(@"move success %@",self.modelArray);
            }
        }else{
            if (observer == model.observer) {
                [self.modelArray removeObject:model];
                NSLog(@"move success %@",self.modelArray);
            }
        }
    }];
}

@end
