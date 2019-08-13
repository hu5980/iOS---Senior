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


/**
 添加成员变量
 */
+ (void)addVariables {
    
    Class Person = objc_allocateClassPair([NSObject class], "Person", 0);
    
    BOOL flag1 = class_addIvar(Person, "_name", sizeof(NSString *), log2(sizeof(NSString*)), @encode(NSString*));
    
    if (flag1) {
        NSLog(@"NSString*类型  _name变量添加成功");
    }
    unsigned int varCount ;
    
    Ivar *varList =  class_copyIvarList(Person, &varCount);
    
    for (int  i = 0; i < varCount; i++) {
        NSLog(@"%s",ivar_getName(varList[i]));
    }
    
    NSLog(@"成员变量打印结束");
    
    objc_registerClassPair(Person);
    
}

+ (NSString *) getName{
    return @"小芳";
}

+ (void)addMethod {
    Class class = NSClassFromString(@"Person");
    
    SEL sel = NSSelectorFromString(@"getName");
    
    Method method = class_getClassMethod(class, sel);
    
    IMP imp = method_getImplementation(method);
    
    char *types = method_getTypeEncoding(method);
    
    class_addMethod(class, sel, imp, types);
}

@end
