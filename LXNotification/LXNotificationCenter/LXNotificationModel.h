//
//  LXNotificationModel.h
//  LXNotification
//
//  Created by HSEDU on 2019/5/29.
//  Copyright © 2019年 HSEDU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXNotification.h"

typedef void(^OperationBlock)(LXNotification *notification);

@interface LXNotificationModel : NSObject
//** 观察者对象 */
@property (nonatomic,unsafe_unretained) id observer;
//** 执行方法 */
@property (nonatomic,assign) SEL selector;
//** 执行方法 */
@property (nonatomic,copy) NSString *notificationName;
//** 对象 */
@property (nonatomic,strong) id object;
//** 队列 */
@property (nonatomic,strong) NSOperationQueue *operationQueue;
//** 回调 */
@property (nonatomic,copy) OperationBlock block;
@end

