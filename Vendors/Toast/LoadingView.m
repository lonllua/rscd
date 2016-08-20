//
//  LoadingView.m
//  etoh22
//
//  Created by bim on 15/1/6.
//  Copyright (c) 2015年 biming. All rights reserved.
//

#import "LoadingView.h"
#import "MBProgressHUD.h"
#import "AppColor.h"

MBProgressHUD *loadingHUDView;

@implementation LoadingView

/**
 * 显示加载框提示
 *
 * @param text
 *          提示文本
 */
+ (void)show:(NSString *)text
{
    if (loadingHUDView == nil) {
        UIView *view = [UIApplication sharedApplication].keyWindow;
        loadingHUDView = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
        loadingHUDView.labelFont = [UIFont boldSystemFontOfSize:15];
        loadingHUDView.labelColor = [[AppColor sharedAppColor] colorWithString:COLOR_E2E2E2];
        loadingHUDView.dimBackground = YES;
        [view addSubview:loadingHUDView];
    }
    loadingHUDView.labelText = text;
    [loadingHUDView show:YES];
}

/**
 * 显示加载框提示（默认提示文本是：加载中...）
 */
+ (void)show
{
    [LoadingView show:@"加载中..."];
}

/**
 * 隐藏加载框提示
 */
+ (void)dismiss
{
    if (loadingHUDView) {
        [loadingHUDView hide:YES];
        [loadingHUDView removeFromSuperview];
        loadingHUDView = nil;
    }
}

@end
