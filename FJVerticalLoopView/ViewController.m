//
//  ViewController.m
//  FJVerticalLoopView
//
//  Created by fengjun on 2017/1/24.
//  Copyright © 2017年 fengjun. All rights reserved.
//

#import "ViewController.h"
#import "UIVerticalLoopView.h"

@interface ViewController ()<VerticalLoopDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *tickerArrs = @[@[@"揽客宝更新升级啦",@"顾客少，我这有你秘笈"],@[@"想要吐槽快升级吧",@"您有新订单，请注意查收"],@[@"放不开了方便",@"666666666"]];
    
    UIVerticalLoopView *verticalLoopV = [[UIVerticalLoopView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.height, 50)];
    verticalLoopV.loopDelegate = self;
    verticalLoopV.backgroundColor = [UIColor whiteColor];
    verticalLoopV.verticalLoopContentArr = tickerArrs;
    verticalLoopV.verticalLoopAnimationDuration = 1;
    verticalLoopV.Direction = VerticalLoopDirectionDown;
    [self.view addSubview:verticalLoopV];
    [verticalLoopV start];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didClickContentAtIndex:(NSInteger)index{
    
    NSLog(@"%ld",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
