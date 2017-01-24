//
//  UIVerticalLoopView.m
//  FJTestDemo
//
//  Created by fengjun on 2017/1/22.
//  Copyright © 2017年 fengjun. All rights reserved.
//

#import "UIVerticalLoopView.h"

#define Self_Height  self.frame.size.height
#define Self_Width   self.frame.size.width

@implementation UIVerticalLoopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupView];
    }
    return self;
}


-(void)setupView {
    
    _firstContentView = [[TwoLabeView alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width - 20, Self_Height)];
    [_firstContentView setBackgroundColor:[UIColor clearColor]];
    _firstContentView.backgroundColor = [UIColor yellowColor];
    _firstContentView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesturRecongnizer1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loopContentClick)];
    tapGesturRecongnizer1.numberOfTapsRequired = 1;
    [_firstContentView addGestureRecognizer:tapGesturRecongnizer1];
    
    
    _secondContentView = [[TwoLabeView alloc] initWithFrame:CGRectMake(10, self.frame.size.height , Self_Width - 20, Self_Height)];
    [_secondContentView setBackgroundColor:[UIColor clearColor]];
    _secondContentView.backgroundColor = [UIColor yellowColor];
    _secondContentView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesturRecongnizer2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loopContentClick)];
    tapGesturRecongnizer2.numberOfTapsRequired = 1;
    [_secondContentView addGestureRecognizer:tapGesturRecongnizer2];
    
    [self addSubview:_firstContentView];
    [self addSubview:_secondContentView];
    
    // 默认初始方向是向上
    _Direction = VerticalLoopDirectionDown;
    _verticalLoopAnimationDuration = 1;
    self.clipsToBounds = YES;
}



-(void)startVerticalLoopAnimation{
    
    _firstContentView.lab1.text = [_verticalLoopContentArr objectAtIndex:currentIndex].firstObject;
    _firstContentView.lab2.text = [_verticalLoopContentArr objectAtIndex:currentIndex].lastObject;
    
    float firstContentLaStartY = 0;
    float firstContentLaEndY = 0;
    float secondContentLaStartY = 0;
    float secondContentLaEndY = 0;
    
    int secondCurrentIndex  = currentIndex + 1;
    if (secondCurrentIndex > _verticalLoopContentArr.count - 1) {
        secondCurrentIndex = 0;
    }
    
    switch (_Direction) {
        case VerticalLoopDirectionBottom:
            
            firstContentLaStartY = 0;
            firstContentLaEndY = self.frame.size.height;
            
            secondContentLaStartY = firstContentLaStartY - Self_Height;
            secondContentLaEndY = firstContentLaEndY - Self_Height;
            
            break;
        case VerticalLoopDirectionDown:
            
            firstContentLaStartY = 0;
            firstContentLaEndY = -Self_Height;
            
            secondContentLaStartY = firstContentLaStartY + Self_Height;
            secondContentLaEndY = firstContentLaEndY + Self_Height;
            
            break;
        default:
            break;
    }
    
    _secondContentView.lab1.text = [_verticalLoopContentArr objectAtIndex:secondCurrentIndex].firstObject;
    _secondContentView.lab2.text = [_verticalLoopContentArr objectAtIndex:secondCurrentIndex].lastObject;
    
    _firstContentView.frame = CGRectMake(10, firstContentLaStartY, Self_Width - 20, Self_Height);
    _secondContentView.frame = CGRectMake(10, secondContentLaStartY, Self_Width - 20,Self_Height);
    
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDuration:_verticalLoopAnimationDuration];
    [UIView setAnimationDelay:1.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(verticalLoopAnimationDidStop:finished:context:)];
    CGRect firstContentLabelFrame = _firstContentView.frame;
    firstContentLabelFrame.origin.y = firstContentLaEndY;
    
    [_firstContentView setFrame:firstContentLabelFrame];
    [_secondContentView setFrame:CGRectMake(10,secondContentLaEndY, Self_Width - 20, Self_Height)];
    
    [UIView commitAnimations];
    
}

-(void)verticalLoopAnimationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    
    currentIndex++;
    if(currentIndex >= [_verticalLoopContentArr count]) {
        currentIndex = 0;
    }
    [self startVerticalLoopAnimation];
    
}
- (void)loopContentClick
{
    if ([self.loopDelegate respondsToSelector:@selector(didClickContentAtIndex:)]) {
        [self.loopDelegate didClickContentAtIndex:currentIndex];
    }
}
#pragma mark - verticalLoop Animation Handling
-(void)start {
    
    // 开启动画默认第一条信息
    currentIndex = 0;
    // 开始动画
    [self startVerticalLoopAnimation];
}

@end
