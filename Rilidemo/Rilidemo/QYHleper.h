//
//  QYHleper.h
//  QYHlper
//
//  Created by guoqingyang on 16/1/16.
//  Copyright © 2016年 郭庆扬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface QYHleper : NSObject
/**
 *  正则验证手机号
 *
 *  @param mobileNum 传入的手机号
 *
 *  @return YES则是手机号
 */
- (BOOL)isMobileNum:(NSString *)mobileNum;
/**
 *  正则验证身份证号
 *
 *  @param identityCard 传入的身份证号
 *
 *  @return YES则是身份证号
 */
- (BOOL)isIdCard: (NSString *)identityCard;
/**
 *  根据输入的年月日判断今天周几
 *
 *  @param year  年
 *  @param month 月
 *  @param day   日
 *
 *  @return 周
 */
+(NSString*)getWeekDay:(int)year :(int)month :(int)day;
/**
 *  获得今天周几
 *
 *  @return 返回今天所在的周几
 */
-(NSString*)getWeekDay;
/**
 *  根据传入的年和月算出这个月所在的天数
 *
 *  @param year  传入的年
 *  @param month 传入的月
 *
 *  @return 返回的天数
 */
+ (NSInteger)DaysfromYear:(NSInteger)year andMonth:(NSInteger)month;
/**
 *  把字典转化成json格式
 *
 *  @param dic 输入的字典
 *
 *  @return 返回的json字符串
 */
-(NSString*)JSStringWithDic:(NSDictionary*)dic;
/**
 *  图片压缩
 *
 *  @param image 输入的图片
 *
 *  @return 返回压缩的NSData
 */
+(NSData *)compactImage:(UIImage *)image;
/**
 *  获取系统版本号
 *
 *  @return 返回的系统版本号
 */
+(NSString*)getOsVersion;
/**
 *  获取app的版本
 *
 *  @return 返回app的版本
 */
+(NSString*)getAppVersion;
/**
 *  判断字符串中是否含有表情
 *
 *  @param string 传入的字符串
 *
 *  @return 返回YES即含有表情
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;
/**
 *  获取手机的唯一标识
 *
 *  @return 返回手机的唯一标识
 */
+(NSString*)getUDID;
@end
