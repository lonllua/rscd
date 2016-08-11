//
//  NavigationItemWraper.h
//  etoh22
//
//  Created by bim on 15/1/23.
//  Copyright (c) 2015年 winupon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NavigationItemWraper : NSObject
{
    UIView  * navigationItemView;
    UILabel *titleLabel;
    UIButton *leftBtn;
    UIButton *rightBtn;
}

@property(nonatomic,retain)UIView  * navigationItemView;
@property(nonatomic,retain)UILabel  * titleLabel;
@property(nonatomic,retain)UIButton  * leftBtn;
@property(nonatomic,retain)UIButton  * rightBtn;

@end
