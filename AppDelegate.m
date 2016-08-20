//
//  AppDelegate.m
//  rscd
//
//  Created by bim on 16/8/11.
//  Copyright © 2016年 bim. All rights reserved.
//

#import "AppMacro.h"
#import "AppDelegate.h"
#import "MainController.h"
#import "WelcomeViewController.h"
#import "MagicalRecord.h"
#import "MagicalRecord+Setup.h"
#import "MagicalRecord+Options.h"

@interface AppDelegate(){
    /**欢迎界面*/
    WelcomeViewController *welcomeViewController;
}

@end

@implementation AppDelegate

static UINavigationController *navController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initMagicalRecord];
    [self initWelcomeWindow];
    return YES;
}

//欢迎界面
-(void)initWelcomeWindow
{
    WelcomeViewController *controller = welcomeViewController;
    if (!controller) {
        controller = [[WelcomeViewController alloc] init];
        welcomeViewController = controller;
    }
    [self initWindow:controller];
}


/**
 * 把主界面放到导航控制器中
 */
- (void)initWindow:(UIViewController *)controller
{
    navController = [[UINavigationController alloc] init];
    if (IS_IOS6) {
        // 修复导航栏高度问题
        navController.navigationBar.clipsToBounds = YES;
    }
    [navController setNavigationBarHidden:NO];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = navController;
    [navController setViewControllers:[NSArray arrayWithObject:controller]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}

- (void)initMagicalRecord
{
    //初始化数据库 下面的顺序可能需要调整
//    NSString *dbURL = [[NSBundle mainBundle] pathForResource:@"BMDB" ofType:@"sqlite"];
//    [MagicalRecord setupCoreDataStackWithStoreNamed:dbURL];
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *targetPath=[docPath stringByAppendingPathComponent:@"BMDB.sqlite"];
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:targetPath];
    [MagicalRecord setupAutoMigratingCoreDataStack];
    [MagicalRecord setShouldAutoCreateDefaultPersistentStoreCoordinator:YES];
    [MagicalRecord setShouldDeleteStoreOnModelMismatch:YES];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
