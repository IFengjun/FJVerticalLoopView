# FJVerticalLoopView
跑马灯，支持向上或向下滚动
![image](https://github.com/IFengjun/FJVerticalLoopView/blob/master/redme/demo.gif)
使用方法，导入UIVerticalLoopView，TwoLabeView两个文件至项目中

    NSArray *tickerArrs = @[@[@"揽客宝更新升级啦",@"顾客少，我这有你秘笈"],@[@"想要吐槽快升级吧",@"您有新订单，请注意查收"],@[@"放不开了方便",@"666666666"]];
    UIVerticalLoopView *verticalLoopV = [[UIVerticalLoopView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.height, 50)];
    verticalLoopV.loopDelegate = self;
    verticalLoopV.backgroundColor = [UIColor whiteColor];
    verticalLoopV.verticalLoopContentArr = tickerArrs;
    verticalLoopV.verticalLoopAnimationDuration = 1;
    verticalLoopV.Direction = VerticalLoopDirectionDown;
    [self.view addSubview:verticalLoopV];
    [verticalLoopV start];
   
