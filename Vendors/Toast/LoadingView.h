//
//  LoadingView.h
//  etoh22
//
//  Created by bim on 15/1/6.
//  Copyright (c) 2015年 biming. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoadingView : NSObject

/**
 * 显示加载框提示
 *
 * @param text
 *          提示文本
 */
+ (void)show:(NSString *)text;

/**
 * 显示加载框提示（默认提示文本是：加载中...）
 */
+ (void)show;

/**
 * 隐藏加载框提示
 */
+ (void)dismiss;
@end
