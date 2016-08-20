//
//  AppUtils.m
//  etoh22
//
//  Created by bim on 14/12/22.
//  Copyright (c) 2014年 biming. All rights reserved.
//

#import "AppMacro.h"
#import "Toast.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "AppColor.h"

@implementation AppUtils

+ (void)addObserver:(id)observer selector:(SEL)selector name:(NSString *)name
{
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:name object:nil];
}

+ (void)removeObserver:(id)observer name:(NSString *)name
{
    [[NSNotificationCenter defaultCenter] removeObserver:observer name:name object:nil];
}

+ (void)postNotificationName:(NSString *)name
{
    [self postNotificationName:name object:nil];
}

+ (void)postNotificationName:(NSString *)name object:(id)object
{
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object];
}

+ (NSString *)getUUID
{
    NSString *uuid = [[NSUUID UUID] UUIDString];
    uuid = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return [uuid lowercaseString];
}

+ (void)delay:(void (^)(void))completion delayTime:(NSTimeInterval)delayTime
{
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, delayTime * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), completion);
}

+ (void)delay:(void (^)(void))completion
{
    [AppUtils delay:completion delayTime:0.2];
}

+ (void)back:(UIViewController *)from to:(Class)to
{
    NSArray *controllers = from.navigationController.viewControllers;
    int count = (int)controllers.count;
    UIViewController *controller = nil;
    for (int i = count - 1; i >= 0; i--) {
        controller = controllers[i];
        if ([controller isKindOfClass:to]) {
            [from.navigationController popToViewController:controller animated:YES];
            break;
        }
    }
}

+ (NSArray *)getLetterArray
{
    return [NSArray arrayWithObjects:@"✩", @"#", @"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
}

+ (BOOL)isEmpty:(NSString *)value
{
    return value == nil || [AppUtils trim:value].length == 0;
}

+ (BOOL)isNotEmpty:(NSString *)value
{
    return ![AppUtils isEmpty:value];
}

+ (NSString *)trim:(NSString *)value
{
    if (value == nil) {
        return nil;
    }
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [value stringByReplacingOccurrencesOfString:@"\u2006" withString:@""];
}

+ (NSUInteger)length:(NSString *)value
{
    if ([AppUtils isEmpty:value]) {
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
    NSInteger total = l + (int)ceilf((float)(a + b) / 2.0);
    return total;
}

+ (CALayer *)addSeparatorLine:(UIView *)view frame:(CGRect)frame color:(UIColor *)color
{
    CALayer *separator = [[CALayer alloc] init];
    separator.frame = frame;
    AppColor *appColor = [AppColor sharedAppColor];
    UIColor *borderColor = color ? color : [appColor colorWithString:COLOR_C8C7CC];
    separator.borderColor = borderColor.CGColor;
    separator.borderWidth = frame.size.height;
    [view.layer addSublayer:separator];
    return separator;
}


@end
