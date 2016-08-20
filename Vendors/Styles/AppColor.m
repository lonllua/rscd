//
//  AppColor.m
//  etoh22
//
//  Created by bim on 14/12/22.
//  Copyright (c) 2014年 biming. All rights reserved.
//

#import "AppColor.h"

@interface AppColor()
{
    NSDictionary *data;//用来缓存获取过的颜色
}
@end

@implementation AppColor

- (id)init
{
    self = [super init];
    if (self) {
        data = [[NSMutableDictionary alloc] init];
    }
    return self;
}

/**
 * 获取AppColor的单例
 */
+ (AppColor *)sharedAppColor
{
    static AppColor *appColor;
    static dispatch_once_t pred = 0;//使用dispatch_once用来确保单例模式
    dispatch_once(&pred, ^{
        appColor = [[AppColor alloc] init];
    });
    return appColor;
}

/**
 * 根据16进制字符串获取对应的颜色
 */
- (UIColor *)colorWithString:(NSString *)colorString
{
    UIColor *color = data[colorString];
    if (color != nil) {
        return color;
    }
    if ([colorString hasPrefix:@"#"] && colorString.length == 7) {
        NSString *hexString = [NSString stringWithFormat:@"0x%@", [colorString substringFromIndex:1]];
        NSInteger hexValue = strtoul([hexString UTF8String], 0, 0);
        color = [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255
                                green:((float)((hexValue & 0xFF00) >> 8)) / 255
                                 blue:((float)(hexValue & 0xFF)) / 255
                                alpha:1.0];
        [data setValue:color forKey:colorString];
        return color;
    }
    //DSLog(@"color value is invild: %@", colorString);
    return [UIColor whiteColor];
    
}

/**
 * 根据16进制字符串获取对应的图片
 */
- (UIImage *)imageWithString:(NSString *)colorString size:(CGSize)size
{
    UIColor *color = [self colorWithString:colorString];
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end

