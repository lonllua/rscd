//
//  NavigationStyleUtil.h
//  etoh22
//
//  Created by bim on 15/1/23.
//  Copyright (c) 2015年 winupon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NavigationItemWraper.h"

typedef enum {
    /**主界面的导航条样式*/
    NavigationItemType_home,
    /**开通和教育的导航条样式*/
    NavigationItemType_openGuide,
    /**默认只有标题的*/
    NavigationItemType_default,
}NavigationItemType;

@interface NavigationStyleUtil : NSObject

/**
 * 设置导航条item
 */
+(NavigationItemWraper *)m_InitNavigationItem:(UINavigationItem *)navigationItem type:(NavigationItemType)itemType;

+(NavigationItemWraper *)m_InitNavigationItem2:(UINavigationItem *)navigationItem;

+(void)pushViewController:(UINavigationController *)navigationController navigationItem:(UINavigationItem *)navigationItem viewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
