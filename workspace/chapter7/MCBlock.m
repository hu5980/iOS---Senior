//
//  MCBlock.m
//  Block
//
//  Created by yangyang38 on 2018/3/5.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "MCBlock.h"

@implementation MCBlock

//- (void)method {
//    static int multiplier = 6;
//    int(^Block)(int) = ^int(int num)
//    {
//        return num * multiplier;
//    };
//
//    Block(2);
//}
//
//
//- (void)blockHowToRunInCpp {
//    int  number = 1;
//    int (^testBlock) (int) = ^int(int num) {
//        return num * number;
//    };
//    testBlock(5);
//}

int global_var = 4;

static int static_global_var = 5;

- (void)blockVariableMethod {
    int var = 1;
    __unsafe_unretained id unsafe_obj = nil;
    __strong id strong_obj = nil;
    
    static int static_var = 3;
    void (^Block)(void) = ^{
        NSLog(@"局部变量<基本数据类型>  var %d",var);
        
        NSLog(@"局部变量<__unsafe_unretained 对象类型>  var %@",unsafe_obj);
        NSLog(@"局部变量__strong 对象类型>  var %@",strong_obj);
        
        NSLog(@"局部变量<静态变量>  var %d",static_var);
        
        NSLog(@"局部变量<全局变量>  var %d",global_var);
        NSLog(@"局部变量<静态全局变量>  var %d",static_global_var);
    };
    
    Block();
}







@end

