//
//  QYDataHandel.m
//  Rilidemo
//
//  Created by guoqingyang on 16/3/15.
//  Copyright © 2016年 guoqingyang. All rights reserved.
//

#import "QYDataHandel.h"

@implementation QYDataHandel

static QYDataHandel *data = nil;


+(QYDataHandel*)shareData{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        data = [QYDataHandel new];
    });
    return data;
}
@end
