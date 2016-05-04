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

//记录当前的控制器View，进入下一个控制器View时移除，节约资源
@property(nonatomic,strong)UIView* showView;

//一个专门用来做转场动画的View
@property(nonatomic,strong)UIView* transitionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitionView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    
    [self.view addSubview:self.transitionView];
    
    //只有变成子控制器才能接收事件处理
    [self addChildViewController:[[FirstViewController alloc]init]];
    [self addChildViewController:[[SecondTableViewController alloc]init]];
    [self addChildViewController:[[ThirdViewController alloc]init]];
    
}
- (IBAction)buttonClicked:(UIButton *)sender {
    
    [self.showView removeFromSuperview];
    
    UIViewController* vc=self.childViewControllers[sender.tag];
    
    vc.view.frame=self.transitionView.bounds;
    
    [self.transitionView addSubview:vc.view];
    
    self.showView=vc.view;
    
    CATransition* anim=[[CATransition alloc]init];
    
    anim.type=@"cube";
    
    anim.duration=0.8;
    
    [self.transitionView.layer addAnimation:anim forKey:nil];
}



@end
