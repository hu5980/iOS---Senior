//
//  ViewControllerB.m
//  Objective-C
//
//  Created by gavin hu on 2018/12/11.
//  Copyright © 2018 gavin hu. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB ()

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self setUI];
    // Do any additional setup after loading the view.
}


- (void)setUI {
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(100, 100, 100, 50);
    back.backgroundColor = [UIColor redColor];
    [back addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    UIButton *change = [UIButton buttonWithType:UIButtonTypeCustom];
    change.frame = CGRectMake(100, 200, 100, 50);
    change.backgroundColor = [UIColor redColor];
    [change addTarget:self action:@selector(changeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:change];
    
}


- (void)backAction {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)changeAction {
    
    NSMutableString *rer = @"改了";
    
    self.textB = rer;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
