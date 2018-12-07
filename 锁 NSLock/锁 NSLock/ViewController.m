//
//  ViewController.m
//  锁 NSLock
//
//  Created by gavin hu on 2018/12/7.
//  Copyright © 2018 gavin hu. All rights reserved.
//

#import "ViewController.h"
#include <pthread.h>
#include <os/lock.h>
#include <libkern/OsspinLockDeprecated.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  //  [self synchronized];
    
  //  [self nslock];
    
  //  [self nslock_4];
    
  //  [self nslock_5];
    
  //  [self  nsrecursivelock];
    
  //  [self nsconditionlock];
    
  //  [self nscondition];
    
  // [self dispatch_semaphore];
    
  //  [self pthread_mutex];
    
 // [self pthread_mutex_recursive];
    
  //  [self osspinlock];
    
   [self os_unfair_lock];
    // Do any additional setup after loading the view, typically from a nib.
}

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
        sleep(4);
        @synchronized(cjobj){
            NSLog(@"线程2");
        }
    });
}

- (void)nslock{
    NSLock *huLock = [[NSLock alloc]init];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [huLock lock];
        NSLog(@"线程1加锁成功");
        sleep(3);
        [huLock unlock];
        NSLog(@"线程1解锁成功");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        if ([huLock tryLock]) {
            NSLog(@"线程2加锁成功");
            [huLock unlock];
            NSLog(@"线程2解锁成功");
        }else{
            NSLog(@"线程2加锁失败");
        }
    });
    
}

- (void)nslock_4 {
    NSLock * cjlock = [NSLock new];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [cjlock lock];
        NSLog(@"线程1加锁成功");
        sleep(3);
        [cjlock unlock];
        NSLog(@"线程1解锁成功");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(4);
        if ([cjlock tryLock]) {
            NSLog(@"线程4加锁成功");
            [cjlock unlock];
            NSLog(@"线程4解锁成功");
        }else {
            NSLog(@"线程4加锁失败");
        }
    });
    
    
}

- (void)nslock_5 {
    NSLock * cjlock = [NSLock new];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [cjlock lock];
        NSLog(@"线程1加锁成功");
        sleep(2);
        [cjlock unlock];
        NSLog(@"线程1解锁成功");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //lockBeforeDate 在指定时间之前加锁
        if ([cjlock lockBeforeDate:[NSDate dateWithTimeIntervalSinceNow:10]]) {
            NSLog(@"线程5加锁成功");
            [cjlock unlock];
            NSLog(@"线程5解锁成功");
        }else {
            NSLog(@"线程5加锁失败");
        }
    });
}

 // 递归锁 可以允许同一线程多次加锁，而不会造成死锁。递归锁会跟踪它被lock的次数。每次成功的lock都必须平衡调用unlock操作。只有所有达到这种平衡，锁最后才能被释放，以供其它线程使用
- (void)nsrecursivelock{
   
    NSRecursiveLock * cjlock = [[NSRecursiveLock alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        static void (^RecursiveBlock)(int);
        RecursiveBlock = ^(int value) {
            [cjlock lock];
            NSLog(@"%d加锁成功",value);
            if (value > 0) {
                NSLog(@"value:%d", value);
                RecursiveBlock(value - 1);
            }
            [cjlock unlock];
            NSLog(@"%d解锁成功",value);
        };
        RecursiveBlock(3);
    });
}

//NSConditionLock 对象所定义的互斥锁可以在使得在某个条件下进行锁定和解锁，它和 NSLock 类似，都遵循 NSLocking 协议，方法都类似，只是多了一个 condition 属性，以及每个操作都多了一个关于 condition 属性的方法，例如 tryLock、tryLockWhenCondition:，所以 NSConditionLock 可以称为条件锁。

//只有 condition 参数与初始化时候的 condition 相等，lock 才能正确进行加锁操作。
//unlockWithCondition: 并不是当 condition 符合条件时才解锁，而是解锁之后，修改 condition 的值。

- (void)nsconditionlock {
    NSConditionLock * cjlock = [[NSConditionLock alloc] initWithCondition:0];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [cjlock lock];
        NSLog(@"线程1加锁成功");
        sleep(1);
        [cjlock unlock];
        NSLog(@"线程1解锁成功");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        [cjlock lockWhenCondition:1];
        NSLog(@"线程2加锁成功");
        [cjlock unlock];
        NSLog(@"线程2解锁成功");
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(2);
        if ([cjlock tryLockWhenCondition:0]) {
            NSLog(@"线程3加锁成功");
            sleep(2);
            [cjlock unlockWithCondition:2];
            NSLog(@"线程3解锁成功");
        } else {
            NSLog(@"线程3尝试加锁失败");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if ([cjlock lockWhenCondition:2 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]]) {
            NSLog(@"线程4加锁成功");
            [cjlock unlockWithCondition:1];
            NSLog(@"线程4解锁成功");
        } else {
            NSLog(@"线程4尝试加锁失败");
        }
    });
}

//NSCondition
/*
 NSCondition类是互斥锁和条件锁的结合体。需要注意的是，由于操作系统实现的差异，即使在代码中没有发送signal消息，线程也有可能被唤醒，所以需要增加谓词变量来保证程序的正确性
 
 在加上锁之后，调用条件对象的 wait 或 waitUntilDate: 方法来阻塞线程，直到条件对象发出唤醒信号或者超时之后，再进行之后的操作。
 signal 和 broadcast 方法的区别在于，signal 只是一个信号量，只能唤醒一个等待的线程，想唤醒多个就得多次调用，而 broadcast 可以唤醒所有在等待的线程。
 
 */
- (void)nscondition {
    NSCondition * cjcondition = [NSCondition new];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [cjcondition lock];
        NSLog(@"线程1线程加锁");
        [cjcondition wait];
        NSLog(@"线程1线程唤醒");
        [cjcondition unlock];
        NSLog(@"线程1线程解锁");
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [cjcondition lock];
        NSLog(@"线程2线程加锁");
        //释放互斥量，使当前线程等待到某一个时间，切换到其它线程执行
        if ([cjcondition waitUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]]) {
            NSLog(@"线程2线程唤醒");
            [cjcondition unlock];
            NSLog(@"线程2线程解锁");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(2);
        ////CPU发信号告诉线程不用在等待，可以继续执行
        //[cjcondition signal];
        //唤醒所有等待的线程
         [cjcondition broadcast];
    });
}

/*
 dispatch_semaphore 使用信号量机制实现锁，等待信号和发送信号。
 dispatch_semaphore 是 GCD 用来同步的一种方式，与他相关的只有三个函数，一个是创建信号量，一个是等待信号，一个是发送信号。
 dispatch_semaphore 的机制就是当有多个线程进行访问的时候，只要有一个获得了信号，其他线程的就必须等待该信号释放。
 
 dispatch_semaphore 和 NSCondition 类似，都是一种基于信号的同步方式，但 NSCondition 信号只能发送，不能保存（如果没有线程在等待，则发送的信号会失效）。而 dispatch_semaphore 能保存发送的信号。dispatch_semaphore 的核心是 dispatch_semaphore_t 类型的信号量。
 dispatch_semaphore_create(1) 方法可以创建一个 dispatch_semaphore_t 类型的信号量，设定信号量的初始值为 1。注意，这里的传入的参数必须大于或等于 0，否则 dispatch_semaphore_create 会返回 NULL。
 dispatch_semaphore_wait(semaphore, overTime); 方法会判断 semaphore 的信号值是否大于 0。大于 0 不会阻塞线程，消耗掉一个信号，执行后续任务。如果信号值为 0，该线程会和 NSCondition 一样直接进入 waiting 状态，等待其他线程发送信号唤醒线程去执行后续任务，或者当 overTime 时限到了，也会执行后续任务。
 dispatch_semaphore_signal(semaphore); 发送信号，如果没有等待的线程接受信号，则使 signal 信号值加一（做到对信号的保存）。
 一个 dispatch_semaphore_wait(semaphore, overTime); 方法会去对应一个 dispatch_semaphore_signal(semaphore); 看起来像 NSLock 的 lock 和 unlock，其实可以这样理解，区别只在于有信号量这个参数，lock unlock 只能同一时间，一个线程访问被保护的临界区，而如果 dispatch_semaphore 的信号量初始值为 x ，则可以有 x 个线程同时访问被保护的临界区。
 
 */

- (void)dispatch_semaphore {
    // 创建一个信号量 信号量可以创建多个 只有信号量被消耗到为0 的时候才会阻塞流程
    dispatch_semaphore_t semaphore =  dispatch_semaphore_create(2);
    // 设置超时时间
    dispatch_time_t overtime = dispatch_time(DISPATCH_TIME_NOW, 6 * NSEC_PER_SEC);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 消耗掉一个信号量
        dispatch_semaphore_wait(semaphore, overtime);
        NSLog(@"线程1开始");
        sleep(5);
        NSLog(@"线程1结束");
        // 线程结束添加信号量
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        NSLog(@"进入异步线程2");
        // 判断信号量的个数是否大于0 ，大于不阻塞 ，小于阻塞
        dispatch_semaphore_wait(semaphore, overtime);
        NSLog(@"线程2开始");
        sleep(5);
        dispatch_semaphore_signal(semaphore);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(2);
        NSLog(@"进入异步线程3");
        // 判断信号量的个数是否大于0 ，大于不阻塞 ，小于阻塞
        dispatch_semaphore_wait(semaphore, overtime);
        NSLog(@"线程3开始");
        dispatch_semaphore_signal(semaphore);
    });
}

/*
 pthread 表示 POSIX thread，定义了一组跨平台的线程相关的 API，POSIX 互斥锁是一种超级易用的互斥锁，使用的时候：
 只需要使用 pthread_mutex_init 初始化一个 pthread_mutex_t，
 pthread_mutex_lock 或者 pthread_mutex_trylock 来锁定 ，
 pthread_mutex_unlock 来解锁，
 当使用完成后，记得调用 pthread_mutex_destroy 来销毁锁

 它的用法和 NSLock 的 lock unlock 用法一致，而它也有一个 pthread_mutex_trylock 方法，pthread_mutex_trylock 和 tryLock 的区别在于，tryLock 返回的是 YES 和 NO，pthread_mutex_trylock 加锁成功返回的是 0，失败返回的是错误提示码。
 pthread_mutex(recursive) 作用和 NSRecursiveLock 递归锁类似。如果使用 pthread_mutex_init(&theLock, NULL); 初始化锁的话，上面的代码的第二部分会出现死锁现象，使用递归锁就可以避免这种现象。
 */

- (void)pthread_mutex {
    
    // 声明一个pthread_mutex_t 互斥锁 变量
    __block pthread_mutex_t cjlock;
    
    // 初始化pthread_mutex_t互斥锁
    pthread_mutex_init(&cjlock, NULL);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        pthread_mutex_lock(&cjlock);
        NSLog(@"线程1开始");
        sleep(3);
        NSLog(@"线程1结束");
        pthread_mutex_unlock(&cjlock);
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        pthread_mutex_lock(&cjlock);
        NSLog(@"线程2");
        pthread_mutex_unlock(&cjlock);
    });
}

- (void)pthread_mutex_recursive {
    __block pthread_mutex_t cjlock;
    
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    pthread_mutex_init(&cjlock, &attr);
    pthread_mutexattr_destroy(&attr);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        static void (^RecursiveBlock)(int);
        
        RecursiveBlock = ^(int value) {
            pthread_mutex_lock(&cjlock);
            NSLog(@"%d加锁成功",value);
            if (value > 0) {
                NSLog(@"value = %d", value);
                sleep(1);
                RecursiveBlock(value - 1);
            }
            NSLog(@"%d解锁成功",value);
            pthread_mutex_unlock(&cjlock);
        };
        RecursiveBlock(3);
    });
}

/*
 OSSpinLock
 OSSpinLock 是一种自旋锁，和互斥锁类似，都是为了保证线程安全的锁。但二者的区别是不一样的，对于互斥锁，当一个线程获得这个锁之后，其他想要获得此锁的线程将会被阻塞，直到该锁被释放。但自选锁不一样，当一个线程获得锁之后，其他线程将会一直循环在哪里查看是否该锁被释放。所以，此锁比较适用于锁的持有者保存时间较短的情况下。
 

 

 */

- (void)osspinlock {
    __block OSSpinLock theLock = OS_SPINLOCK_INIT;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        OSSpinLockLock(&theLock);
        NSLog(@"线程1开始");
        sleep(3);
        NSLog(@"线程1结束");
        OSSpinLockUnlock(&theLock);
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        OSSpinLockLock(&theLock);
        sleep(1);
        NSLog(@"线程2");
        OSSpinLockUnlock(&theLock);
        
    });
}

/*
 6.os_unfair_lock
 自旋锁已经不再安全，然后苹果又整出来个 os_unfair_lock，这个锁解决了优先级反转问题。
 常用相关API：
 // 初始化
 os_unfair_lock_t unfairLock = &(OS_UNFAIR_LOCK_INIT);
 // 加锁
 os_unfair_lock_lock(unfairLock);
 // 尝试加锁
 BOOL b = os_unfair_lock_trylock(unfairLock);
 // 解锁
 os_unfair_lock_unlock(unfairLock);
 
 os_unfair_lock 用法和 OSSpinLock 基本一直，就不一一列出了。
 */

- (void)os_unfair_lock {
    
    os_unfair_lock_t unfairLock = &(OS_UNFAIR_LOCK_INIT);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        os_unfair_lock_lock(unfairLock);
        NSLog(@"线程1开始");
        sleep(3);
        NSLog(@"线程1结束");
        os_unfair_lock_unlock(unfairLock);
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        os_unfair_lock_lock(unfairLock);
        sleep(1);
        NSLog(@"线程2");
        os_unfair_lock_unlock(unfairLock);
    });
}


@end
