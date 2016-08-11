//
//  Validators.m
//  etoh22
//
//  Created by bim on 15/1/4.
//  Copyright (c) 2015年 winupon. All rights reserved.
//

#import "Validators.h"
#import "StringUtils.h"

@implementation Validators

/**
 * 对象是1或者true的时候返回true
 *
 * @param obj
 *          判断对象
 */
+(BOOL)isTure:(id)obj
{
    NSString *isTureStr = [StringUtils toStringTureOrFalse:obj];
    return [@"true" isEqualToString:isTureStr];
}

/**
 * 判断字符串是否为空
 *
 * @param value
 *          字符串
 */
+ (BOOL)isEmpty:(NSString *)value
{
    return value == nil || [StringUtils trim:value].length == 0;
}

+ (BOOL)isNotEmpty:(NSString *)value
{
    return ![Validators isEmpty:value];
}

/**
 * 判断是否是空的数组
 *
 * @param array
 *          数组
 */
+ (BOOL)isEmptyArray:(NSArray *) array
{
    return array == NULL || array == nil || [array count] == 0;
}

/**
 * 判断是否是空的对象：nil和NULL
 *
 * @param obj
 *          对象
 */
+ (BOOL)isEmptyObj:(id) obj
{
    return (obj == nil || obj == NULL);
}

+ (BOOL)isEmptyDictionary:(NSDictionary *) dictionary
{
    return dictionary == NULL || dictionary == nil || [dictionary count] == 0;
}

+ (BOOL)isEmail:(NSString *)email
{
    NSString *reg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", reg];
    return [predicate evaluateWithObject:email];
}

+ (BOOL)isMobilePhone:(NSString *)phone
{
    NSString *reg = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", reg];
    return [predicate evaluateWithObject:phone];
}

+ (BOOL)isChinaMobile:(NSString *)phone{
    NSString *reg = @"^(1(3[4-9]|4[7]|5[012789]|7[8]|8[23478])\\d{8})|(0001\\d{8})$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", reg];
    return [predicate evaluateWithObject:phone];
}

+ (BOOL)isChinaTelecom:(NSString *)phone{
    NSString *reg = @"^(?!00|015|013)(0\\d{9,11})|(0003\\d{8})|(1(33|53|77|89|80|81)\\d{8})";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", reg];
    return [predicate evaluateWithObject:phone];
}

+ (BOOL)isChinaUnicom:(NSString *)phone{
    NSString *reg = @"^(1(3[0-2]|5[56]|7[6]|8[56])\\d{8})|(0002\\d{8})";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", reg];
    return [predicate evaluateWithObject:phone];
}

@end
