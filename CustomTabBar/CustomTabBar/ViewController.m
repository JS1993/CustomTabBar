//
//  ViewController.m
//  CustomTabBar
//
//  Created by  江苏 on 16/5/4.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondTableViewController.h"
#import "ThirdViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController:[[FirstViewController alloc]init]];
    [self addChildViewController:[[SecondTableViewController alloc]init]];
    [self addChildViewController:[[ThirdViewController alloc]init]];
}
- (IBAction)buttonClicked:(UIButton *)sender {
    
    UIViewController* vc=self.childViewControllers[sender.tag];
    
    vc.view.frame=CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64);
    
    [self.view addSubview:vc.view];
    
    
}



@end
