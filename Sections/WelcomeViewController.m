//
//  WelcomeViewController.m
//  rscd
//
//  Created by bim on 16/8/12.
//  Copyright © 2016年 bim. All rights reserved.
//

#import "AppMacro.h"
#import "WelcomeViewController.h"
#import "UIDevice+Resolutions.h"
#import "MainController.h"

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

    UIDeviceResolution deviceResolution = [UIDevice currentResolution];
    if(deviceResolution == UIDevice_iPhone1And3And3GS || deviceResolution == UIDevice_iPhone4And4S || deviceResolution == UIDevice_iPhone5And5SAnd5C)
    {
        UIImage *img = [UIImage imageNamed:@"welcome640x960"];
        //iphone4s以下
        [imageView setImage:img];
    }else{
        UIImage *img = [UIImage imageNamed:@"welcome750x1334"];
        //iphone6
        [imageView setImage:img];
    }
    [self.view addSubview:imageView];
    
    [NSTimer scheduledTimerWithTimeInterval:1.2 target:self selector:@selector(handleTimer:) userInfo:nil repeats:NO];
}

//timer调用函数
-(void)handleTimer:(NSTimer *)timer
{
    MainController *mainController = [[MainController alloc] init];
    [self.navigationController pushViewController:mainController animated:YES];
}


@end
