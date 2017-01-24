//
//  UIVerticalLoopView.h
//  FJTestDemo
//
//  Created by fengjun on 2017/1/22.
//  Copyright © 2017年 fengjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwoLabeView.h"

@protocol VerticalLoopDelegate<NSObject>

- (void)didClickContentAtIndex:(NSInteger)index;

@end
typedef enum
{
    VerticalLoopDirectionBottom,
    VerticalLoopDirectionDown,
    
}VerticalLoopDirection;

@interface UIVerticalLoopView : UIView
{
    
    // 创建两个label循环滚动
    TwoLabeView *_firstContentView;
    TwoLabeView *_secondContentView;
    
    // 记录
    int currentIndex;
    
}
/** 动画方向默认往上
 *  跑马灯动画时间
 */
@property(nonatomic) float verticalLoopAnimationDuration;
/**
 *  显示的内容(支持多条数据)
 */
@property(nonatomic, retain) NSArray<NSArray *> *verticalLoopContentArr;
/**
 * loop方向(上下/右)
 */
@property(nonatomic) VerticalLoopDirection Direction;
@property (nonatomic)id<VerticalLoopDelegate> loopDelegate;
/**
 *  开启
 */
-(void)start;

@end
