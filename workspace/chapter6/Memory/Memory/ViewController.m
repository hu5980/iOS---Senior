//
//  ViewController.m
//  Memory
//
//  Created by yangyang38 on 2018/3/4.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "ViewController.h"
#import "ViewController_B.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.backgroundColor = UIColor.redColor;
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
}


- (void) buttonAction {
    ViewController_B *vc_B =  [[ViewController_B alloc]init];
    
    [self presentViewController:vc_B animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
