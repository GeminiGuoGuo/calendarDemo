//
//  QYDateHelper.m
//  QYHlper
//
//  Created by guoqingyang on 16/1/18.
//  Copyright © 2016年 guoqingyang. All rights reserved.
//

#import "QYDateHelper.h"

@implementation QYDateHelper
+(BOOL)isLeapYear:(NSInteger)year{
    NSAssert(!(year < 1), @"invalid year number");
    BOOL leap = FALSE;
    if ((0 == (year % 400))) {
        leap = TRUE;
    }
    else if((0 == (year%4)) && (0 != (year % 100))) {
        leap = TRUE;
    }
    return leap;
}
+ (NSInteger)numberOfDaysInMonth:(NSInteger)month
{
    return [QYDateHelper numberOfDaysInMonth:month year:[QYDateHelper getCurrentYear]];
}

+ (NSInteger)getCurrentYear
{
    time_t ct = time(NULL);
    struct tm *dt = localtime(&ct);
    int year = dt->tm_year + 1900;
    return year;
}

+ (NSInteger)getCurrentMonth
{
    time_t ct = time(NULL);
    struct tm *dt = localtime(&ct);
    int month = dt->tm_mon + 1;
    return month;
}

+ (NSInteger)getCurrentDay
{
    time_t ct = time(NULL);
    struct tm *dt = localtime(&ct);
    int day = dt->tm_mday;
    return day;
}

+ (NSInteger)getMonthWithDate:(NSDate*)date
{
    unsigned unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:date];
    NSInteger month = comps.month;
    return month;
}

+ (NSInteger)getDayWithDate:(NSDate*)date
{
    unsigned unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday;
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:date];
    NSInteger day = comps.day;
    return day;
}

+ (NSInteger)numberOfDaysInMonth:(NSInteger)month year:(NSInteger) year
{
    NSAssert(!(month < 1||month > 12), @"invalid month number");
    NSAssert(!(year < 1), @"invalid year number");
    month = month - 1;
    static int daysOfMonth[12] = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    NSInteger days = daysOfMonth[month];
    /*
     * feb
     */
    if (month == 1) {
        if ([QYDateHelper isLeapYear:year]) {
            days = 29;
        }
        else {
            days = 28;
        }
    }
    return days;
}
+ (NSDate*)dateSinceNowWithInterval:(NSInteger)dayInterval{
    return [NSDate dateWithTimeIntervalSinceNow:dayInterval*24*60*60];
}
//根据两个时间求时间间隔
+(NSInteger)numberOfDaysFrom:(NSString *)currentTime  withNextTime:(NSString *)nextTime{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //    [gregorian setFirstWeekday:2];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *fromDate = [dateFormatter dateFromString:currentTime];
    NSString *subMonthStr = [nextTime substringToIndex:10];
    NSDate *toDate = [dateFormatter dateFromString:subMonthStr];
    NSDateComponents *dayComponents = [gregorian components:NSCalendarUnitDay fromDate:fromDate toDate:toDate options:0];
    NSRange range= {11,2};
    NSInteger inter = [[nextTime substringWithRange:range]integerValue];
    return dayComponents.day *24 + inter;
}
//根据传入的时间和format返回string
+(NSString*)stringWithDate:(NSDate*) date withFormat:(NSString*)format{
    NSDateFormatter *datefor = [[NSDateFormatter alloc]init];
    [datefor setDateFormat:format];
    NSString *time  = [datefor stringFromDate:date];
    return time;
}
//根君传入的时间字符串和format返回对应时间
+(NSDate*)dateWithTime:(NSString*)time Format:(NSString*)format{
    NSDateFormatter *mat = [[NSDateFormatter alloc]init];
    [mat setDateFormat:format];
    NSDate *date = [mat dateFromString:time];
    return date;
}
@end
