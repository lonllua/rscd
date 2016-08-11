//
//  Toast.h
//  etoh22
//
//  Created by bim on 15/1/1.
//  Copyright (c) 2015年 winupon. All rights reserved.
//

#import <Foundation/Foundation.h>

//toast显示时间
#define TOAST_DURATION_LONG 3
#define TOAST_DURATION_SHORT 1.5

// Toast显示时间枚举
typedef enum {
    ToastDurationLong,
    ToastDurationShort
} ToastDuration;

//Toast显示位置枚举
typedef enum {
    ToastPositionMiddle,
    ToastPositionBottom
} ToastPosition;

@interface Toast : NSObject

/**
 * TOAST显示
 *
 * @param view 
 *          依附View
 * @param text
 *          需要显示的文本
 * @param duration
 *          持续时间
 * @param position
 *          显示的位置
 */
+ (void)makeText:(UIView *)view text:(NSString *)text duration:(ToastDuration)duration position:(ToastPosition)position;

/**
 * TOAST显示（默认显示在底部，时间短）
 *
 * @param view
 *          依附View
 * @param text
 *          需要显示的文本
 */
+ (void)makeText:(UIView *)view text:(NSString *)text;

/**
 * TOAST显示（默认时间短）
 *
 * @param view
 *          依附View
 * @param text
 *          需要显示的文本
 * @param position
 *          显示的位置
 */
+ (void) makeText:(UIView *)view text:(NSString *)text position:(ToastPosition)position;

/**
 * TOAST显示（默认显示在底部）
 *
 * @param view
 *          依附View
 * @param text
 *          需要显示的文本
 * @param duration
 *          持续时间
 */
+ (void)makeText:(UIView *)view text:(NSString *)text duration:(ToastDuration)duration;

/**
 * TOAST显示（默认显示在底部，时间短，依附在整个UI屏幕）
 *
 * @param text
 *          需要显示的文本
 */
+ (void)makeText:(NSString *)text;

/**
 * TOAST显示（默认时间短，依附在整个UI屏幕）
 *
 * @param text
 *          需要显示的文本
 * @param position
 *          显示的位置
 */

+ (void)makeText:(NSString *)text position:(ToastPosition)position;

/**
 * TOAST显示（默认显示在底部，依附在整个UI屏幕）
 *
 * @param text
 *          需要显示的文本
 * @param duration
 *          持续时间
 */
+ (void)makeText:(NSString *)text duration:(ToastDuration)duration;

@end
