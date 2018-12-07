//
//  ViewController.m
//  Block_Study
//
//  Created by Bruce on 2018/11/23.
//  Copyright © 2018年 Bruce. All rights reserved.
//

#import "ViewController.h"

typedef void (^testBlock)(NSObject* obj);

@interface ViewController ()

@property (nonatomic,copy) testBlock block;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(Test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    self.block = ^(NSObject* obj) {
        NSLog(@"obj = %@",obj);
        NSLog(@"%@",button);
    };
    
    NSLog(@"self.block = %@",self.block);
   
    int i = 0;
    
    void (^stackBlock)(void) = ^(){
        NSLog(@"%d",i);
    };
    
    NSLog(@"stackBlock = %@",stackBlock);
    
}

- (void)viewDidLayoutSubviews {
    
}

- (void)Test {
    self.block([[NSNumber alloc]initWithInt:5]);
}





@end
