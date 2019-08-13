//
//  ViewController.m
//  Objective-C
//
//  Created by gavin hu on 2018/12/11.
//  Copyright © 2018 gavin hu. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerB.h"
@interface ViewController ()

@property (nonatomic,strong) NSString *text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.text = @"hello";

    NSLog(@"%@",self.text);
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%@",self.text);
}

- (IBAction)test:(UIButton *)sender {
    ViewControllerB *vc = [[ViewControllerB alloc] init];
    vc.textB = self.text;
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end
