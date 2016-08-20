//
//  UIDevice+Resolutions.h
//  etoh22
//
//  Created by xuan on 15/1/23.
//  Copyright (c) 2015年 biming. All rights reserved.
//

#import <UIKit/UIKit.h>

enum {
    // iPhone 1,3,3GS 分辨率(320x480px)
    UIDevice_iPhone1And3And3GS      = 1,
    // iPhone 4,4S 分辨率(640x960px)
    UIDevice_iPhone4And4S            = 2,
    // iPhone 5 分辨率(640x1136px)
    UIDevice_iPhone5And5SAnd5C      = 3,
    // iPhone 6 分辨率(750x1334px)
    UIDevice_iPhone6                = 4,
    // iPhone 6Plus 分辨率(1080x1920px)
    UIDevice_iPhone6Plus            = 5,
    
    // iPad 1,2 分辨率(1024x768px)
    UIDevice_iPad1And2       = 10,
    // iPad 3 分辨率(2048x1536px)
    UIDevice_iPad3              = 11
}; typedef NSUInteger UIDeviceResolution;

@interface UIDevice (Resolutions)

/**
 * 获取当前设备分辩率
 */
+ (UIDeviceResolution) currentResolution;

/**
 * 判断是否运行在IPhone上
 */
+ (BOOL)isRunningOniPhone;

@end
