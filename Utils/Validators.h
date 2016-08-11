//
//  Validators.h
//  etoh22
//
//  Created by bim on 15/1/4.
//  Copyright (c) 2015年 winupon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validators : NSObject

/**
 * 对象是1或者true的时候返回true
 *
 * @param obj
 *          判断对象
 */
+(BOOL)isTure:(id)obj;

/**
 * 判断字符串是否为空
 *
 * @param value
 *          字符串
 */
+ (BOOL)isEmpty:(NSString *)value;

+ (BOOL)isNotEmpty:(NSString *)value;

/**
 * 判断是否是空的数组
 *
 * @param array
 *          数组
 */
+ (BOOL)isEmptyArray:(NSArray *) array;

/**
 * 判断是否是空的字典序
 *
 * @param array
 *          数组
 */
+ (BOOL)isEmptyDictionary:(NSDictionary *) dictionary;

/**
 * 判断是否是空的对象：nil和NULL
 *
 * @param obj
 *          对象
 */
+ (BOOL)isEmptyObj:(id) obj;

/**
 * 断字符串是否是邮箱地址
 *
 * @param email
 *          邮箱地址
 */
+ (BOOL)isEmail:(NSString *)email;

/**
 * 判断字符串是否是手机号码
 *
 * @param phone
 *          手机号
 */
+ (BOOL)isMobilePhone:(NSString *)phone; // 手机号码的正则改为取配置？

/**
 * 判断字符串是否是中国移动号码
 *
 * @param phone
 *          手机号
 */
+ (BOOL)isChinaMobile:(NSString *)phone;

/**
 * 判断字符串是否是中国联通号码
 *
 * @param phone
 *          手机号
 */
+ (BOOL)isChinaUnicom:(NSString *)phone;

/**
 * 判断字符串是否是中国电信号码
 *
 * @param phone
 *          手机号
 */
+ (BOOL)isChinaTelecom:(NSString *)phone;

@end
