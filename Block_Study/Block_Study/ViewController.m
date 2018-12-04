//
//  ViewController.m
//  Block_Study
//
//  Created by Bruce on 2018/11/23.
//  Copyright © 2018年 Bruce. All rights reserved.
//

#import "ViewController.h"

typedef void(^testBlock)(NSObject* obj);

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(Test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
   
    // Do any additional setup after loading the view, typically from a nib.
}





- (void)Test {
    void(^testBlock)(NSObject* obj) = ^(NSObject* obj){
        NSLog(@"%@",obj);
    };
    
    testBlock([[NSNumber alloc]initWithInt:5]);
}





@end
