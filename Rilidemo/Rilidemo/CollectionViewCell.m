//
//  CollectionViewCell.m
//  textsousuoDemo
//
//  Created by guoqingyang on 16/2/24.
//  Copyright © 2016年 guoqingyang. All rights reserved.
//

#import "CollectionViewCell.h"
#define kWidth  [[UIScreen mainScreen] bounds].size.width
#define kHeight  [[UIScreen mainScreen] bounds].size.height
@implementation CollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, kWidth/7.0-10, kWidth/7.0-10)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.label];
    }
    return self;
}
@end
