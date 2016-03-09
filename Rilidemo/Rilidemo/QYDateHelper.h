//
//  QYDateHelper.h
//  QYHlper
//
//  Created by guoqingyang on 16/1/18.
//  Copyright © 2016年 guoqingyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYDateHelper : NSObject
/**
 *  判断是否是闰年
 *
 *  @param year 传入的年
 *
 *  @return 返回是不是闰年,YES则是
 */
+(BOOL)isLeapYear:(NSInteger)year;
/**
 *  计算今年月份的天数
 *
 *  @param month 传入的月份(1-12)
 *
 *  @return 返回的天数
 */
+(NSInteger)numberOfDaysInMonth:(NSInteger)month;
/**
 *  根据传入的年月求出天数
 *
 *  @param month 传入的月
 *  @param year  传入的年
 *
 *  @return 返回的天数
 */
+ (NSInteger)numberOfDaysInMonth:(NSInteger)month year:(NSInteger) year;
/**
 *  求出今年的年份
 *
 *  @return 今年的年份
 */
+ (NSInteger)getCurrentYear;
/**
 *  求出本月的月份
 *
 *  @return 返回月份
 */
+ (NSInteger)getCurrentMonth;
/**
 *  求出今天的日
 *
 *  @return 返回今天的日  
 */
+ (NSInteger)getCurrentDay;
/**
 *  根据传入的date求出月份
 *
 *  @param date 传入的date
 *
 *  @return 返回天数
 */
+ (NSInteger)getMonthWithDate:(NSDate*)date;
/**
 *  根据传入的date求月份
 *
 *  @param date 输入的date
 *
 *  @return 返回的天数
 */
+ (NSInteger)getDayWithDate:(NSDate*)date;
/**
 *  求出距现在天数后面之后date
 *
 *  @param dayInterval 传入的天数间隔
 *
 *  @return 返回的date
 */
+ (NSDate*)dateSinceNowWithInterval:(NSInteger)dayInterval;
/**
 *  根据两个时间求时间间隔(小时)
 *
 *  @param currentTime 输入的时间,yyyy-MM-dd格式
 *  @param nextTime    下一个时间点,yyyy-MM-dd HH:mm:ss格式
 *
 *  @return 返回时间间隔
 */
+(NSInteger)numberOfDaysFrom:(NSString *)currentTime  withNextTime:(NSString *)nextTime;
/**
 *  根据传入的date和format求字符串
 *
 *  @param date   传入的date
 *  @param format 设置的format
 *
 *  @return 返回的字符串
 */
+(NSString*)stringWithDate:(NSDate*) date withFormat:(NSString*)format;
/**
 *  根据传入的时间和format返回NSDate
 *
 *  @param time   传入的时间
 *  @param format 传入的format
 *
 *  @return 返回的NSDate
 */
+(NSDate*)dateWithTime:(NSString*)time Format:(NSString*)format;
@end
