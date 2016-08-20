//
//  StringUtils.m
//  etoh22
//
//  Created by bim on 15/1/4.
//  Copyright (c) 2015年 biming. All rights reserved.
//

#import "StringUtils.h"
#import "AppMacro.h"
#import "Validators.h"
#import "DSLogger.h"

@implementation StringUtils

/**
 * 字符串分割
 *
 * @param str
 *          要分割的字符串
 * @param seprator
 *          分割符号
 */
+(NSArray *)split:(NSString *)str seprator:(NSString *)seprator
{
    if([Validators isEmpty:str] || [Validators isEmpty:seprator]){
        return nil;
    }
    
    NSArray *retArray = [str componentsSeparatedByString:seprator];
    return retArray;
}

/**
 * 字符串数据合成
 *
 * @param strs
 *          要合成的字符串数组
 * @param seprator
 *          分割符号
 */
+(NSString *)compose:(NSArray *)strs seprator:(NSString *)seprator
{
    NSString *retStr = @"";
    
    if([Validators isEmptyArray:strs]){
        return retStr;
    }
    
    int n = (int)[strs count];
    for(int i=0; i<n; i++){
        if(i > 0 && ![Validators isEmpty:seprator]){
            retStr = [retStr stringByAppendingString:seprator];
        }
        retStr = [retStr stringByAppendingString:strs[i]];
    }
    
    return retStr;
}

/**
 * 去掉字符串空格
 *
 * @param value
 *          字符串
 */
+ (NSString *)trim:(NSString *)value
{
    if (value == nil) {
        return nil;
    }
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [value stringByReplacingOccurrencesOfString:@"\u2006" withString:@""];
}

/**
 * 对象转成int
 *
 * @param value
 *          对象
 */
+ (NSInteger)toInteger:(id)value
{
    return [[StringUtils toString:value] integerValue];
}

/**
 * 对象转成String
 *
 * @param value
 *          对象
 */
+ (NSString *)toString:(id)value
{
    if (!value) {
        return @"";
    }
    return [NSString stringWithFormat:@"%@", value];
}

+ (NSString *)toStr:(NSInteger)value
{
    return [NSString stringWithFormat:@"%d", value];
}

/**
 * 对象转成String的true或者false
 *
 * @param value
 *          对象
 */
+ (NSString *)toStringTureOrFalse:(id)value
{
    NSString *valueStr = [StringUtils toString:value];
    if([@"true" isEqualToString:valueStr] || [@"1" isEqualToString:valueStr]){
        return @"true";
    }else{
        return @"false";
    }
}

/**
 * 两个字符串合并
 *
 * @param str1
 *          字符串1
 * @param str2
 *          字符串2
 */
+ (NSString *) merge:(NSString *)str1 :(NSString *)str2{
    return [str1 stringByAppendingString:str2];
}

/**
 * 两个字符串比较是否相等
 *
 * @param str1
 *          字符串1
 * @param str2
 *          字符串2
 */
+ (BOOL)isEqual:(NSString *)str1 to:(NSString *)str2
{
    return [str1 isEqualToString:str2];
}

+ (NSUInteger)length:(NSString *)value
{
    if ([Validators isEmpty:value]) {
        return 0;
    }
    int i,n = [value length],l = 0,a = 0,b = 0;
    unichar c;
    for(i = 0; i < n; i++){
        c = [value characterAtIndex:i];
        if(isblank(c)){
            b++;
        } else if (isascii(c)) {
            a++;
        } else {
            l++;
        }
    }
    if (a == 0 && l == 0) {
        return 0;
    }
    return l + (int)ceilf((float)(a + b) / 2.0);
}

+ (CGSize)getTextSize:(NSString *)content font:(UIFont *)font
{
    return [StringUtils getTextSize:content font:font maxSize:CGSizeZero];
}

+ (CGSize)getTextSize:(NSString *)content font:(UIFont *)font maxSize:(CGSize)maxSize
{
    if (!font) {
        font = [UIFont systemFontOfSize:17];
    }
    if (CGSizeEqualToSize(maxSize, CGSizeZero) == YES ) {
        maxSize = CGSizeMake(SCREEN_WIDTH,CONTENT_HEIGHT);
    }
    CGSize textSize = [content sizeWithFont:font constrainedToSize:maxSize lineBreakMode:NSLineBreakByWordWrapping];
    return textSize;
}

+ (NSString *)cutOff:(NSString *)str length:(int)length
{
    if (str == nil) {
        return nil;
    }
    
    NSUInteger asciiLength = [StringUtils asciiLengthOfString:str];
    if (asciiLength <= length) {
        return str;
    }
    
    
    NSUInteger len = 0;
    int maxLength = length + 3;
    for (NSUInteger i = 0; i < str.length; i++) {
        unichar uc = [str characterAtIndex: i];
        len += isascii(uc) ? 1 : 2;
        if (len <= maxLength + 1 && !isascii(uc)) {
            length -= 1;
        }
    }
    
    NSMutableString *str1 = [[NSMutableString alloc] initWithString:str];
    [str1 replaceCharactersInRange:NSMakeRange(length, [str length] - length) withString:@"..."];
    return [StringUtils toString:str1];
}

+ (NSUInteger) asciiLengthOfString: (NSString *) text
{
    NSUInteger asciiLength = 0;
    for (NSUInteger i = 0; i < text.length; i++) {
        unichar uc = [text characterAtIndex: i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    
    return asciiLength;
}

+ (NSDictionary *)parametersWithSeparator:(NSString *)separator delimiter:(NSString *)delimiter url:(NSString *)urlStr{
    NSRange range = [urlStr rangeOfString:@"?"];
    if (range.length == 0) {
        return nil;
    }
    
    NSString *params = [urlStr substringFromIndex:range.location+1];
    NSArray *parameterPairs =[params componentsSeparatedByString:delimiter];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:[parameterPairs count]];
    for (NSString *currentPair in parameterPairs) {
        NSRange range = [currentPair rangeOfString:separator];
        if(range.location == NSNotFound)
            continue;
        NSString *key = [currentPair substringToIndex:range.location];
        NSString *value =[currentPair substringFromIndex:range.location + 1];
        [parameters setObject:value forKey:key];
    }
    
    return parameters;
}

+ (id)parseJSON:(NSString *)value
{
    id object = nil;
    @try {
        NSData *data = [value dataUsingEncoding:NSUTF8StringEncoding];
        object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    }
    @catch (NSException *exception) {
        DSLog(@"%s [Line %d] JSON字符串转成对象出错，原因：%@",  __PRETTY_FUNCTION__, __LINE__, exception);
    }
    return object;
}

+ (NSString *)toJSONString:(id)object
{
    NSString *jsonStr = @"";
    @try {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:0 error:nil];
        jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    @catch (NSException *exception) {
        DSLog(@"%s [Line %d] 对象转成JSON字符串出错，原因：%@", __PRETTY_FUNCTION__, __LINE__, exception);
    }
    return jsonStr;
}

+ (NSString *)getUUID
{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    uuid = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return [uuid lowercaseString];
}
+ (NSString *)getVoiceDuration:(NSString *)duration
{
    if (duration == nil) {
        duration = @"0";
    }
    return [NSString stringWithFormat:@"%@''", duration];
}

+ (NSString *)numberStrFormat1:(NSString *)num
{
    int count = 0;
    long long int a = num.longLongValue;
    while (a != 0)    {
        count++;
        a /= 10;
    }
    
    NSMutableString *string = [NSMutableString stringWithString:num];
    NSMutableString *newstring = [NSMutableString string];
    while (count > 3) {
        count -= 3;
        NSRange rang = NSMakeRange(string.length - 3, 3);
        NSString *str = [string substringWithRange:rang];
        [newstring insertString:str atIndex:0];
        [newstring insertString:@"," atIndex:0];
        [string deleteCharactersInRange:rang];
    }
    
    [newstring insertString:string atIndex:0];
    return newstring;
}

@end
