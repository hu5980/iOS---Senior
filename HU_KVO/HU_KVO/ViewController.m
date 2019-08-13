//
//  ViewController.m
//  HU_KVO
//
//  Created by Bruce on 2018/12/3.
//  Copyright © 2018年 Bruce. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+KVO.h"
#import <objc/runtime.h>
#import "HURunTimeStudy.h"
#import "JKTest.h"
#import "JKTest+JKTestExtension.h"

@protocol protocol nameViewControllerProtocol <NSObject>



@end

@interface ViewController ()
@property (nonatomic,strong) NSObject *person ;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) JKTest *test;
@property (nonatomic,assign) BOOL setColor;

- (void)test;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [HURunTimeStudy addVariables];
    [HURunTimeStudy addMethod];
    Class class = NSClassFromString(@"Person");
    
    self.person = [class new];
    self.test = [JKTest new];
    
    [self.test study];
    
    NSString *mesage;
    
    NSLog(@"%lu",(unsigned long)[mesage length]) ;
    
 
    [self.person setValue:@"小明" forKey:@"name"];
    
    [self.view PG_addObserver:self forKey:@"backgroundColor" withBlock:^(id  _Nonnull observedObject, NSString * _Nonnull observedKey, id  _Nonnull oldValue, id  _Nonnull newValue) {
        
        NSLog(@"observedKey = %@",observedKey);
        
        NSLog(@"oldValue = %@",oldValue);
        NSLog(@"newValue = %@",newValue);

        
    }];
    
    
    NSLog(@"%@",object_getClass(self.view));
   
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!_setColor) {
        //        self.view.backgroundColor = [UIColor redColor];
        _setColor = YES;
        [self.person setValue:@"小李" forKey:@"name"];
        NSLog(@" %@" ,[self.person valueForKey:@"name"]);
        
    } else {
        //        self.view.backgroundColor = [UIColor yellowColor];
        _setColor = NO;
        [self.person setValue:@"小明" forKey:@"name"];
        NSLog(@" %@" ,[self.person valueForKey:@"name"]);
    }
    
}

- (void)setName:(NSString *)name {
    
}

@end
