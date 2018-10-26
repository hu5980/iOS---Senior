//
//  ViewController_B.m
//  Memory
//
//  Created by Bruce on 2018/10/25.
//  Copyright © 2018年 yangyang. All rights reserved.
//

#import "ViewController_B.h"
#import "NSTimer+WeakTimer.h"
@interface ViewController_B ()

@property (nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController_B

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 50);
    
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = UIColor.greenColor;
    [self.view addSubview:button];
    
    self.timer = [NSTimer scheduledWeakTimerWithTimeInterval:1 target:self selector:@selector(test) userInfo:nil repeats:YES];
   
    
    
    // Do any additional setup after loading the view.
}

- (void) buttonAction {
  
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)test {
    NSLog(@"打印");
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
