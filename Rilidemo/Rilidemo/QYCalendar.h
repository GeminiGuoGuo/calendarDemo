//
//  QYCalendar.h
//  Rilidemo
//
//  Created by guoqingyang on 16/3/15.
//  Copyright © 2016年 guoqingyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QYCalendarDelegate <NSObject>

@optional
-(void)sendMonth:(NSString*)month;
-(void)sendDate:(NSString*)date;
@end


@interface QYCalendar : UIView

@property(nonatomic,assign)id<QYCalendarDelegate>delegate;

//下个月
-(void)nextMonth;
//上个月
-(void)lastMonth;
@end
