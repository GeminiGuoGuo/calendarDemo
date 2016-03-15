//
//  HraderView.m
//  Rilidemo
//
//  Created by guoqingyang on 16/3/15.
//  Copyright © 2016年 guoqingyang. All rights reserved.
//

#import "HraderView.h"
#import "QYDataHandel.h"
@implementation HraderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, [QYDataHandel shareData].width, [QYDataHandel shareData].height/6.0)];
    if (self) {
        [self drawview];
    }
    return self;
}

-(void)drawview{
    CGFloat width = [QYDataHandel shareData].width/7.0;
    NSArray *array = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    for (int i=0; i<array.count; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i*width, 0, width, [QYDataHandel shareData].height/6.0)];
        [self addSubview:label];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = array[i];
    }
}

@end
