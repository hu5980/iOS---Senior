//
//  ViewController.m
//  CoreAnimation
//
//  Created by gavin hu on 2019/8/13.
//  Copyright © 2019 gavin hu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
//    CALayer *blueLayer = [CALayer layer];
//    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
//    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//
//
//    [self.layerView.layer addSublayer:blueLayer];
    
    UIImage *image = [UIImage imageNamed:@"Snowman.png"];
    self.layerView.layer.contents = (__bridge id)image.CGImage;
    
    self.layerView.layer.contentsGravity = kCAGravityCenter;
    self.layerView.layer.contentsScale = image.scale;;
    
}


@end

