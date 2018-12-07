//
//  NSLock_Study.m
//  锁 Lock
//
//  Created by gavin hu on 2018/12/7.
//  Copyright © 2018 gavin hu. All rights reserved.
//

#import "NSLock_Study.h"

@implementation NSLock_Study

- (void)synchronized {
    NSObject * cjobj = [NSObject new];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized(cjobj){
            NSLog(@"线程1开始");
            sleep(3);
            NSLog(@"线程1结束");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        @synchronized(cjobj){
            NSLog(@"线程2");
        }
    });
}

@end
