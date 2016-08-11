//
//  StringUtils.h
//  etoh22
//
//  Created by bim on 15/1/4.
//  Copyright (c) 2015年 winupon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtils : NSObject

/**
 * 字符串分割
 *
 * @param str
 *          要分割的字符串
 * @param seprator
 *          分割符号
 */
+(NSArray *)split:(NSString *)str seprator:(NSString *)seprator;

/**
 * 字符串数据合成
 *
 * @param strs
 *          要合成的字符串数组
 * @param seprator
 *          分割符号
 */
+(NSString *)compose:(NSArray *)strs seprator:(NSString *)seprator;

/**
 * 去掉字符串空格
 *
 * @param value
 *          字符串
 */
+ (NSString *)trim:(NSString *)value;

/**
 * 对象转成int
 *
 * @param value
 *          对象
 */
+ (NSInteger)toInteger:(id)value;

/**
 * 对象转成String
 *
 * @param value
 *          对象
 */
+ (NSString *)toString:(id)value;

/**
 * 将NSInteger转成字符串
 */
+ (NSString *)toStr:(NSInteger)value;

/**
 * 对象转成String的true或者false
 *
 * @param value
 *          对象
 */
+ (NSString *)toStringTureOrFalse:(id)value;

/**
 * 两个字符串合并
 *
 * @param str1
 *          字符串1
 * @param str2
 *          字符串2
 */
+ (NSString *) merge:(NSString *)str1 :(NSString *)str2;

/**
 * 两个字符串比较是否相等
 *
 * @param str1
 *          字符串1
 * @param str2
 *          字符串2
 */
+ (BOOL)isEqual:(NSString *)str1 to:(NSString *)str2;

/**
 * 获取字符个数，一个中文算一个长度，两个英文算一个长度
 */
+ (NSUInteger)length:(NSString *)value;

/**
 * 获取文本的宽度和高度
 */
+ (CGSize)getTextSize:(NSString *)content font:(UIFont *)font;

/**根据文字内容计算实际大小***/
+ (CGSize)getTextSize:(NSString *)content font:(UIFont *)font maxSize:(CGSize)maxSize;

/**如果长度超过指定长度(一个中文长度为2)，则多余的字符串用...代替**/
+ (NSString *)cutOff:(NSString *)str length:(int)length;

/**获取字符串的长度，一个中文长度为2**/
+ (NSUInteger) asciiLengthOfString: (NSString *) text;

/**解析url中的键值对***/
+ (NSDictionary *)parametersWithSeparator:(NSString *)separator delimiter:(NSString *)delimiter url:(NSString *)str;

+ (id)parseJSON:(NSString *)value;

+ (NSString *)toJSONString:(id)object;

/**
 * 获取唯一的UUID
 */
+ (NSString *)getUUID;
/**
 * 获取语音文件时长 用于班级圈
 */
+ (NSString *)getVoiceDuration:(NSString *)duration;

/**
 * 枚三位数用逗号隔开
 */
+ (NSString *)numberStrFormat1:(NSString *)num;

@end
