//
//  AppUtils.h
//  etoh22
//
//  app相关的宏定义
//
//  Created by bim on 14/12/22.
//  Copyright (c) 2014年 winupon. All rights reserved.
//

#import <Foundation/Foundation.h>

//判断是否是pad
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否是iPhone5
#ifdef __OBJC__
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define UIAppDelegate \
((AppDelegate *)[UIApplication sharedApplication].delegate)
#endif


// 获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//导航栏的高对、tab按钮的高
#define NAVIGATION_HEIGHT 64
#define TAB_HEIGHT 49

// 子页面内容显示区域高度(除去导航栏高度)
#define CONTENT_HEIGHT (SCREEN_HEIGHT - NAVIGATION_HEIGHT)
// 主页面内容显示区域高度(除去导航栏和底部菜单栏高度)
#define MAIN_CONTENT_HEIGHT (SCREEN_HEIGHT - NAVIGATION_HEIGHT - TAB_HEIGHT)

// 系统版本
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define IS_IOS6 (SYSTEM_VERSION >= 6.0 && SYSTEM_VERSION < 7.0)
#define IS_IOS7 (SYSTEM_VERSION >= 7.0 && SYSTEM_VERSION < 8.0)
#define IS_IOS8 (SYSTEM_VERSION >= 8.0 && SYSTEM_VERSION < 9.0)
#define IS_IOS9 (SYSTEM_VERSION >= 9.0)

//IOS7之后状态栏合并到一起了
#define Compatibility_Top_Padding (IS_IOS6 ? 0 : 20)

#ifdef __IPHONE_6_0
# define LINE_BREAK_WORD_WRAP NSLineBreakByWordWrapping
#else
# define LINE_BREAK_WORD_WRAP UILineBreakModeWordWrap
#endif

// app版本、平台标志
#define APP_VERSION_KEY @"appVersion"
#define APP_VERSION @"1.0.0"
#define APP_PLATFORM_KEY @"appPlatform"
#define APP_PLATFORM @"ios"
#define SECURY_KEY @"securyKey"

@interface AppUtils : NSObject

+ (void)addObserver:(id)observer selector:(SEL)selector name:(NSString *)name;

+ (void)removeObserver:(id)observer name:(NSString *)name;

+ (void)postNotificationName:(NSString *)name;

+ (void)postNotificationName:(NSString *)name object:(id)object;

/**
 * 获取唯一的UUID
 */
+ (NSString *)getUUID;

/**
 * 延时执行
 */
+ (void)delay:(void(^)(void))completion delayTime:(NSTimeInterval)delayTime;

/**
 * 延时0.2秒执行
 */
+ (void)delay:(void (^)(void))completion;

/**
 * 字母索引数组
 */
+ (NSArray *)getLetterArray;

/**
 * 去掉字符串空格
 */
+ (NSString *)trim:(NSString *)value;
/**
 * 判断字符串是否为空
 */
+ (BOOL)isEmpty:(NSString *)value;
+ (BOOL)isNotEmpty:(NSString *)value;
/**
 * 获取字符个数，一个中文算一个长度，两个英文算一个长度
 */
+ (NSUInteger)length:(NSString *)value;
/**
 * 生成分割线
 */
+ (CALayer *)addSeparatorLine:(UIView *)view frame:(CGRect)frame color:(UIColor *)color;

@end
