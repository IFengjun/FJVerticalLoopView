//
//  TwoLabeView.m
//  FJTestDemo
//
//  Created by fengjun on 2017/1/23.
//  Copyright © 2017年 fengjun. All rights reserved.
//

#import "TwoLabeView.h"

@implementation TwoLabeView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        
        [self setupViews];
    }
    
    return self;
}

- (void)setupViews{
    self.lab1 = [self createLab];
    self.lab2 = [self createLab];
    
    CGFloat totalHeight = self.frame.size.height;
    self.lab1.frame = CGRectMake(0, 0, self.frame.size.width, totalHeight/2);
    self.lab2.frame = CGRectMake(0, CGRectGetMaxY(self.lab1.frame), self.frame.size.width, totalHeight/2);
    [self addSubview:self.lab1];
    [self addSubview:self.lab2];
}

- (UILabel *)createLab{
    
    UILabel *lab = [[UILabel alloc]init];
    lab.lineBreakMode = NSLineBreakByTruncatingTail;
    [lab setTextColor:[UIColor redColor]];
    lab.font = [UIFont boldSystemFontOfSize:15.0];
    [lab setNumberOfLines:1];
    return lab;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
