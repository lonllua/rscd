//
//  MainController.m
//  rscd
//
//  Created by bim on 16/8/11.
//  Copyright © 2016年 bim. All rights reserved.
//

#import "AppMacro.h"
#import "AppColor.h"
#import "NavigationItemWraper.h"
#import "NavigationStyleUtil.h"
#import "MainController.h"
#import "MainUIStyleMng.h"

#import "RsWordDao.h"
#import "RsSentenceDao.h"

@interface MainController ()
{
    AppColor *appColor;
    NSInteger currentIndex;//指示当前处于第几个tab页面
    NavigationItemWraper *navigationItemWraper;//标题控件打包
    NSString *appName;
}

@end

@implementation MainController

-(void) viewDidLoad
{
    [super viewDidLoad];
    [self initNavigationBar];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UITextField *wordField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    [self.view addSubview:wordField];
    [wordField setPlaceholder:@"请输入单词，如：göra"];
    
    Rsword *resultWord = [RsWordDao queryRswordByWord:@"gor"];
    NSLog(@"结果1是：%@", resultWord.word);
}

/**
 * 初始化导航条
 **/
-(void)initNavigationBar {
    navigationItemWraper = [NavigationStyleUtil m_InitNavigationItem:self.navigationItem];
    navigationItemWraper.titleLabel.text = @"瑞士语词典";
    [[MainUIStyleMng sharedInstance] setNavigationBarStyle:[UINavigationBar appearance]];
}

@end
