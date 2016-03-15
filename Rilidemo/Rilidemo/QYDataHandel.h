//
//  QYDataHandel.h
//  Rilidemo
//
//  Created by guoqingyang on 16/3/15.
//  Copyright © 2016年 guoqingyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface QYDataHandel : NSObject

@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;


+(QYDataHandel*)shareData;

@end
