//
//  NavigationStyleUtil.h
//  etoh22
//
//  Created by bim on 15/1/23.
//  Copyright (c) 2015年 biming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationItemWraper.h"

typedef enum {
    NavigationItemType_home,
    NavigationItemType_default

}NavigationItemType;

@interface NavigationStyleUtil : NSObject

+(NavigationItemWraper *)m_InitNavigationItem:(UINavigationItem *)navigationItem;

+(void)pushViewController:(UINavigationController *)navigationController navigationItem:(UINavigationItem *)navigationItem viewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
