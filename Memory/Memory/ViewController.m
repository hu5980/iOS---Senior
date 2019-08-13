//
//  ViewController.m
//  Memory
//
//  Created by gavin hu on 2018/12/10.
//  Copyright © 2018 gavin hu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonAction:(UIButton *)sender {
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *resourcePath = [bundle resourcePath];
    NSString *filePath = [resourcePath stringByAppendingPathComponent:@"233.png"];
//    self.imageView.image =  [UIImage imageWithContentsOfFile:filePath]; //[UIImage imageNamed:@"233"];
    
    self.imageView.image = [UIImage imageNamed:@"233"];
   
}

@end
