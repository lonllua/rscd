//
//  NavigationStyleUtil.m
//  etoh22
//
//  Created by bim on 15/1/23.
//  Copyright (c) 2015年 biming. All rights reserved.
//

#import "NavigationStyleUtil.h"
#import "AppMacro.h"
#import "AppFont.h"
#import "AppColor.h"
#import "ButtonStyleUtil.h"

@implementation NavigationStyleUtil


+(NavigationItemWraper *)m_InitNavigationItem:(UINavigationItem *)navigationItem
{
    NavigationItemWraper *navigationItemWraper = [[NavigationItemWraper alloc] init];
    
    //自定义标题最底层布局
    UIView  *navigationItemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVIGATION_HEIGHT)];
    navigationItemView.backgroundColor = [UIColor clearColor];
    navigationItemWraper.navigationItemView = navigationItemView;
    
    //标题
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(((SCREEN_WIDTH - 200) / 2) - 8, (NAVIGATION_HEIGHT - 30) / 2, 200, 30)];
    titleLabel.textColor = [[AppColor sharedAppColor] colorWithString:@"#333333"];
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
