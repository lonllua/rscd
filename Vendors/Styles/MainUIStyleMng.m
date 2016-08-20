//
//  MainUIStyleMng.m
//  etoh22
//
//  Created by bim on 14/12/29.
//  Copyright (c) 2014年 biming. All rights reserved.
//

#import "MainUIStyleMng.h"
#import "AppColor.h"
#import "AppMacro.h"
#import "AppFont.h"

@implementation MainUIStyleMng

+(MainUIStyleMng *) sharedInstance
{
    static MainUIStyleMng *s_pMainUIStyleMng = nil;
    if(s_pMainUIStyleMng)
    {
        return s_pMainUIStyleMng;
    }
    
    s_pMainUIStyleMng = [MainUIStyleMng alloc];
    return s_pMainUIStyleMng;
}

- (UITabBarItem *)setTabBarItem:(UITabBarItem *)barItem image:(NSString *)image imageSel:(NSString *)imageSel normalAttrs:(NSDictionary *)normalAttrs selectedAttrs:(NSDictionary *)selectedAttrs
{
    [barItem setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [barItem setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];

    UIImage *img = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *imgSel = [[UIImage imageNamed:imageSel] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [barItem setImage:img];
    [barItem setSelectedImage:imgSel];
   
    return barItem;
}

-(void) setTabBarStyle:(UITabBar *)tabBar
{
    tabBar.backgroundColor = [UIColor whiteColor];
}

-(void) setNavigationBarStyle:(UINavigationBar *)navigationBar {
    //标题栏设置背景图片
    UIImage *headBgImg = [[UIImage imageNamed:@"head_nav_bg_2"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
    
    navigationBar.barStyle = UIBarStyleBlack;
    navigationBar.tintColor = [[AppColor sharedAppColor] colorWithString:@"#333333"];
    navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:19], NSFontAttributeName,
                                         [[AppColor sharedAppColor] colorWithString:@"#333333"], NSForegroundColorAttributeName, nil];
    [navigationBar setBackgroundImage:headBgImg forBarMetrics:UIBarMetricsDefault];

    // 隐藏返回图标的文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-300, 0) forBarMetrics:UIBarMetricsDefault];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

@end
