//
//  main.m
//  锁 Lock
//
//  Created by gavin hu on 2018/12/7.
//  Copyright © 2018 gavin hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSLock_Study.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLock_Study *lockStudy = [[NSLock_Study alloc]init];
      
        [lockStudy synchronized];
        
    }
    return 0;
}




