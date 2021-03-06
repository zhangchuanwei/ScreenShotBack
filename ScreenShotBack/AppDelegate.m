//
//  AppDelegate.m
//  ScreenShotBack
//
//  Created by 郑文明 on 16/5/10.
//  Copyright © 2016年 郑文明. All rights reserved.
//

#import "AppDelegate.h"
#import "UserGuiderViewController.h"

@implementation AppDelegate
-(void)configNavigationBar{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    NSDictionary *attributeDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17.0],NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    [UINavigationBar appearance].titleTextAttributes = attributeDic;
    [UINavigationBar appearance].translucent = YES;
    [UINavigationBar appearance].barTintColor = [UIColor orangeColor];
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
}

#pragma mark
#pragma mark loadRootVC
- (void)loadRootVC {
    if (![TheUserDefaults boolForKey:@"firstLaunch"]) {
        [TheUserDefaults setBool:YES forKey:@"firstLaunch"];
        [TheUserDefaults synchronize];
        self.window.rootViewController = [[UserGuiderViewController alloc]init];
    }else {
        self.window.rootViewController = self.tabBarViewController= [[TabBarViewController alloc] init];;
    }
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self loadRootVC];
    [self configNavigationBar];


    self.screenshotView = [[WMScreenShotView alloc] initWithFrame:CGRectMake(0, 0, self.window.frame.size.width, self.window.frame.size.height)];
    [self.window insertSubview:self.screenshotView atIndex:0];
    self.screenshotView.hidden = YES;
    [self.window makeKeyAndVisible];
    return YES;
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
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end
