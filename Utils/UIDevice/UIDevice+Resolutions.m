//
//  UIDevice+Resolutions.m
//  etoh22
//
//  Created by xuan on 15/1/23.
//  Copyright (c) 2015年 winupon. All rights reserved.
//

#import "UIDevice+Resolutions.h"

@implementation UIDevice (Resolutions)

/**
 * 获取当前设备分辩率
 */
+ (UIDeviceResolution) currentResolution
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);
            if (result.height <= 480.0f){
                return UIDevice_iPhone1And3And3GS;
            }else if(result.height <= 960.0f){
                return UIDevice_iPhone4And4S;
            }else if(result.height <= 1136.0f){
                return UIDevice_iPhone5And5SAnd5C;
            }else if(result.height <= 1334.0f){
                return UIDevice_iPhone6;
            }else if(result.height <= 1920.0f){
                return UIDevice_iPhone6Plus;
            }else{
                return UIDevice_iPhone6Plus;
            }
        } else{
            return UIDevice_iPhone1And3And3GS;
        }
    } else{
        return (([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) ?UIDevice_iPad3 : UIDevice_iPad1And2);
    }
}

/**
 * 判断是否运行在IPhone上
 */
+ (BOOL)isRunningOniPhone
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}

@end
