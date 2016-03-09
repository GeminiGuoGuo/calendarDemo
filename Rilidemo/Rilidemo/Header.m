//
//  Header.m
//  textsousuoDemo
//
//  Created by guoqingyang on 16/2/24.
//  Copyright © 2016年 guoqingyang. All rights reserved.
//

#import "Header.h"
#define kWidth  [[UIScreen mainScreen] bounds].size.width
#define kHeight  [[UIScreen mainScreen] bounds].size.height
@implementation Header

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, kWidth, 50)];
    if (self) {
        [self drawview];
        }
    return self;
}

-(void)drawview{
    CGFloat width = kWidth/7.0;
    NSArray *array = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    for (int i=0; i<array.count; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i*width, 0, width, 50)];
        [self addSubview:label];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = array[i];
    }
}

@end
