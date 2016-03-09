//
//  QYHleper.m
//  QYHlper
//
//  Created by guoqingyang on 16/1/16.
//  Copyright © 2016年 guoqingyang. All rights reserved.
//

#import "QYHleper.h"

@implementation QYHleper
#pragma mark-正则验证-
//正则监测手机号
- (BOOL)isMobileNum:(NSString *)mobileNum{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
//正则监测身份证号
- (BOOL)isIdCard: (NSString *)identityCard{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
//输入一个日期来判断星期几
+(NSString*)getWeekDay:(int)year :(int)month :(int)day{
    int a = GetDayOfWeek(year, month, day);
    if (a==1) {
        return @"周日";
    }else if (a==2)
    {
        return @"周一";
    }else if (a==3)
    {
        return @"周二";
    }else if (a==4)
    {
        return @"周三";
    }else if (a==5)
    {
        return @"周四";
    }else if (a==6)
    {
        return @"周五";
    }else
    {
        return @"周六";
    }
}
//获取当前周几
-(NSString*)getWeekDay{
    NSDateFormatter *formater =[[NSDateFormatter alloc] init];
    [formater setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *date  = [NSDate date];
    NSString *time = [formater stringFromDate:date];
    NSString *year = [time substringWithRange:NSMakeRange(0, 4)];
    NSInteger yearnum = [(NSNumber *)year integerValue];
    NSString *month = [time substringWithRange:NSMakeRange(5, 2)];
    NSInteger monthnum = [(NSNumber*)month integerValue];
    NSString *day = [time substringWithRange:NSMakeRange(8, 2)];
    NSInteger daynum = [(NSNumber*)day integerValue];
    NSLog(@"%ld,%ld,%ld",yearnum,monthnum,daynum);
    int a = GetDayOfWeek((int)yearnum, (int)monthnum, (int)daynum);
    if (a==1) {
        return @"周日";
    }else if (a==2){
        return @"周一";
    }else if (a==3){
        return @"周二";
    }else if (a==4){
        return @"周三";
    }else if (a==5){
        return @"周四";
    }else if (a==6){
        return @"周五";
    }else{
        return @"周六";
    }
}
int GetDayOfWeek(int nYear, int nMonth, int nDay)
{
    struct tm atm = {0};
    atm.tm_mday = nDay;
    atm.tm_mon = nMonth - 1;
    atm.tm_year = nYear - 1900;
    atm.tm_isdst = -1;
    time_t t = mktime(&atm);
    return localtime(&t)->tm_wday + 1;
}

//字典转json
-(NSString*)JSStringWithDic:(NSDictionary*)dic{
    return [[NSString alloc] initWithData:[self toJSONData:dic] encoding:NSUTF8StringEncoding];
}
- (NSData *)toJSONData:(id)theData{
    if (theData==nil) {
        return nil;
    }
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData options:NSJSONWritingPrettyPrinted error:&error];
    if ([jsonData length] > 0 && error == nil){
        return jsonData;
    }else{
        return nil;
    }
}

/*图片压缩*/
static float scale = 1.0;
+(NSData *)compactImage:(UIImage *)image{
    NSData * resultData= nil;
    NSData * data = UIImageJPEGRepresentation(image, scale);
    resultData = data;
    while (resultData.length > 1024 * 100 && scale > 0.1) {
        scale -= 0.05;
        UIImage * newImage = [UIImage imageWithData:data];
        NSData * newData = UIImageJPEGRepresentation(newImage, scale);
        resultData = newData;
    }
    scale = 1.0;
    return resultData;
}
//通过年月求每月天数
+ (NSInteger)DaysfromYear:(NSInteger)year andMonth:(NSInteger)month{
    NSInteger num_year  = year;
    NSInteger num_month = month;
    
    BOOL isrunNian = num_year%4==0 ? (num_year%100==0? (num_year%400==0?YES:NO):YES):NO;
    switch (num_month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:{
            return 31;
        }
            break;
        case 4:
        case 6:
        case 9:
        case 11:{
            return 30;
        }
            break;
        case 2:{
            if (isrunNian) {
                return 29;
            }else{
                return 28;
            }
        }
            break;
        default:
            break;
    }
    return 0;
}
/**
 *  获取系统版本号
 *
 *  @return 返回系统版本号
 */
+(NSString*)getOsVersion{
  return  [NSString stringWithFormat:@"%.f",[[[UIDevice currentDevice] systemVersion] floatValue]];
}
/**
 *  获取app版本号
 *
 *  @return 返回app版本号
 */
+(NSString*)getAppVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}
//判断是否含有表情
+ (BOOL)stringContainsEmoji:(NSString *)string{
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    return returnValue;
}
+(NSString*)getUDID{
    //udid
    NSString *udid = [[UIDevice currentDevice] identifierForVendor].UUIDString;
    NSArray *uuids = [udid componentsSeparatedByString:@"-"];
    udid = [NSString stringWithFormat:@"%@%@%@%@%@",uuids[0],uuids[1],uuids[2],uuids[3],uuids[4]];
    return udid;
}

@end
