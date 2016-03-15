//
//  DateCell.m
//  Rilidemo
//
//  Created by guoqingyang on 16/3/15.
//  Copyright © 2016年 guoqingyang. All rights reserved.
//

#import "DateCell.h"
#import "QYDataHandel.h"
@implementation DateCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, [QYDataHandel shareData].width/7.0-10, [QYDataHandel shareData].height/6.0-10)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor lightGrayColor];
        self.label.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.label];
    }
    return self;
}

@end
