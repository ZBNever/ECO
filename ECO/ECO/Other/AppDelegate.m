//
//  AppDelegate.m
//  ECO
//
//  Created by Never on 2017/9/29.
//  Copyright © 2017年 Never. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewControllerA.h"
#import "ViewControllerB.h"
#import "ViewControllerC.h"
#import "ViewControllerD.h"
#import "ViewControllerE.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //实例化5个控制器
    ViewControllerA *ctlA = [ViewControllerA new];
    UINavigationController *navA = [[UINavigationController alloc] initWithRootViewController:ctlA];
    
    ViewControllerB *ctlB = [ViewControllerB new];
    ViewControllerC *ctlC = [ViewControllerC new];
    ViewControllerD *ctlD = [ViewControllerD new];
    ViewControllerE *ctlE = [ViewControllerE new];
    
    //设置背景色和标题
    ctlA.view.backgroundColor = [UIColor whiteColor];
    navA.title = @"红色";
    ctlB.view.backgroundColor = [UIColor greenColor];
    ctlB.title = @"绿色";
    ctlC.view.backgroundColor = [UIColor purpleColor];
    ctlC.title = @"紫色";
    ctlD.view.backgroundColor = [UIColor yellowColor];
    ctlD.title = @"黄色";
    ctlE.view.backgroundColor = [UIColor blueColor];
    ctlE.title = @"蓝色";
    
    //实例化一个UITabbarController
    UITabBarController *tabCtl = [UITabBarController new];
    
    //设置管理的控制器数组
    tabCtl.viewControllers = @[navA,ctlB,ctlC,ctlD,ctlE];
    
    //设置默认选中某个控制器
    tabCtl.selectedIndex = 0;
    
    //设置根视图控制器
    self.window.rootViewController = tabCtl;
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
