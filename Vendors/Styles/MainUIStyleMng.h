//
//  MainUIStyleMng.h
//  etoh22
//
//  Created by bim on 14/12/29.
//  Copyright (c) 2014年 winupon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavigationItemWraper.h"

@interface MainUIStyleMng : NSObject

/**
 * 单例模式
 */
+(MainUIStyleMng *) sharedInstance;

/**
 * 设置item
 */
- (UITabBarItem *)setTabBarItem:(UITabBarItem *)barItem image:(NSString *)image imageSel:(NSString *)imageSel normalAttrs:(NSDictionary *)normalAttrs selectedAttrs:(NSDictionary *)selectedAttrs;

/**
 * 设置tabBar样式
 */
-(void) setTabBarStyle:(UITabBar *)tabBar;

/**
 * 首页导航条样式设置（绿色）
 */
-(void) setNavigationBarStyle:(UINavigationBar *)navigationBar;

/**
 * 其他页面导航条样式设置（灰色）
 */
-(void) setNavigationBarStyle2:(UINavigationBar *)navigationBar;

@end