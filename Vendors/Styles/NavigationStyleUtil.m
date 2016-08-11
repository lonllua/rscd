//
//  NavigationStyleUtil.m
//  etoh22
//
//  Created by bim on 15/1/23.
//  Copyright (c) 2015年 winupon. All rights reserved.
//

#import "NavigationStyleUtil.h"
#import "AppMacro.h"
#import "AppFont.h"
#import "AppColor.h"
#import "UIColor+RGB.h"
#import "ButtonStyleUtil.h"
#import "LoginedUser.h"

@implementation NavigationStyleUtil

/**
 * 设置导航条item
 */
+(NavigationItemWraper *)m_InitNavigationItem:(UINavigationItem *)navigationItem type:(NavigationItemType)itemType
{
    NavigationItemWraper *navigationItemWraper = [[NavigationItemWraper alloc] init];
    
    //自定义标题最底层布局
    UIView  * navigationItemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVIGATION_HEIGHT)];
    navigationItemView.backgroundColor = [UIColor clearColor];
    navigationItemWraper.navigationItemView = navigationItemView;
    
    //标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(((SCREEN_WIDTH - 200) / 2) - 8, (NAVIGATION_HEIGHT - 30) / 2, 200, 30)];
    titleLabel.textColor = [UIColor colorWithString:FONT1_COLOR];
    titleLabel.font = [UIFont boldSystemFontOfSize:19];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [navigationItemView addSubview:titleLabel];
    navigationItemWraper.titleLabel = titleLabel;
    
    if(itemType == NavigationItemType_home){//主界面
        navigationItem.hidesBackButton = YES;//隐藏返回
    }
    else if(itemType == NavigationItemType_openGuide){
        titleLabel.textColor = [UIColor colorWithString:COLOR_333333];
        CGRect frame = titleLabel.frame;
        frame.origin.x -= 8;
        titleLabel.frame = frame;
        UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(6, (NAVIGATION_HEIGHT - 30) / 2, 32, 30)];
        [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
        [leftBtn setTitleColor:[UIColor colorWithString:COLOR_333333] forState:UIControlStateNormal];
        [leftBtn setTitle:@"返回" forState:UIControlStateHighlighted];
        [leftBtn setTitleColor:[UIColor colorWithString:COLOR_999999] forState:UIControlStateHighlighted];
        [leftBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
        [navigationItemView addSubview:leftBtn];
        navigationItemWraper.leftBtn = leftBtn;
        navigationItem.hidesBackButton = YES;//隐藏返回
    }else{
        navigationItem.hidesBackButton = NO;//
    }
    
    //添加到系统标题栏中去
    navigationItem.title = nil;
    navigationItem.titleView = navigationItemView;
    
    return navigationItemWraper;
}

/**
 * 四川和教育除主页外其他页面的导航样式
 *
 */
+(NavigationItemWraper *)m_InitNavigationItem2:(UINavigationItem *)navigationItem
{
    NavigationItemWraper *navigationItemWraper = [[NavigationItemWraper alloc] init];
    
    //自定义标题最底层布局
    UIView  *navigationItemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVIGATION_HEIGHT)];
    navigationItemView.backgroundColor = [UIColor clearColor];
    navigationItemWraper.navigationItemView = navigationItemView;
    
    //标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(((SCREEN_WIDTH - 200) / 2) - 8, (NAVIGATION_HEIGHT - 30) / 2, 200, 30)];
    titleLabel.textColor = [UIColor colorWithString:@"#333333"];
    titleLabel.font = [UIFont boldSystemFontOfSize:19];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [navigationItemView addSubview:titleLabel];
    navigationItemWraper.titleLabel = titleLabel;
    navigationItem.hidesBackButton = YES;//隐藏返回
    //添加到系统标题栏中去
    navigationItem.title = nil;
    navigationItem.titleView = navigationItemView;
    
    return navigationItemWraper;
}

+(void)pushViewController:(UINavigationController *)navigationController navigationItem:(UINavigationItem *)navigationItem viewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    navigationItem.backBarButtonItem = backItem;
    [navigationController pushViewController:viewController animated:animated];
}

@end
