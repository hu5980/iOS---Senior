//
//  JKPerson.m
//  HU_KVO
//
//  Created by gavin hu on 2019/4/7.
//  Copyright © 2019 Bruce. All rights reserved.
//

#import "HURunTimeStudy.h"
#import <objc/runtime.h>


@implementation HURunTimeStudy

- (void)addVariables {
    
    Class People = objc_allocateClassPair([NSObject class], "People", 0);
    
    BOOL flag1 = class_addIvar(People, "_name", sizeof(NSString *), log2(sizeof(NSString*)), @encode(NSString*));
    
    if (flag1) {
        NSLog(@"NSString*类型  _name变量添加成功");
    }
    unsigned int count ;
    
    Ivar *list =  class_copyIvarList(People, &count);
    
    for (int  i = 0; i < count; i++) {
        NSLog(@"%@",list[i]);
    }
    
    NSLog(@"成员变量打印结束");
    
    objc_registerClassPair(People);
    
}


@end
