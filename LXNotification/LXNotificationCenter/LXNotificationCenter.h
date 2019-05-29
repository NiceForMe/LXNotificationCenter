//
//  LXNotificationCenter.h
//  LXNotification
//
//  Created by HSEDU on 2019/5/29.
//  Copyright © 2019年 HSEDU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXNotification.h"

typedef NSString *LXNotificationName;

@interface LXNotificationCenter : NSObject
+ (LXNotificationCenter *)defaultCenter;
@property (nonatomic,copy) LXNotificationName name;

/**
 postNotification
 
 @param notification 实例
 */
- (void)postNotification:(LXNotification *)notification;

/**
 postNotificationName with no userinfo
 
 @param name name
 @param object object
 */
- (void)postNotificationName:(nonnull LXNotificationName)name object:(nullable id)object;

/**
 postNotificationName
 
 @param name name
 @param object object
 @param userInfo userInfo
 */
- (void)postNotificationName:(nonnull LXNotificationName)name object:(nullable id)object userInfo:(nullable NSDictionary *)userInfo;

/**
 addObserver
 
 @param observer observer
 @param aSelector aSelector
 @param aName aName
 @param anObject anObject
 */
- (void)addObserver:(id)observer selector:(SEL)aSelector name:(nullable LXNotificationName)aName object:(nullable id)anObject;

/**
 addObserverForName
 
 @param name name
 @param object object
 @param queue queue
 @param block block
 */
- (void)addObserverForName:(nullable LXNotificationName)name object:(nullable id)object queue:(nullable NSOperationQueue *)queue usingBlock:(nonnull void(^)(LXNotification *noti))block;

/**
 removeObserver
 
 @param observer observer
 */
- (void)removeObserver:(id)observer;

/**
 removeObserver
 
 @param observer observer
 @param name name
 @param object object
 */
- (void)removeObserver:(id)observer notificationName:(nullable LXNotificationName)name object:(nullable id)object;


@end

