//
//  YNAppDelegate.m
//  SegmentfaultCopycat
//
//  Created by hijack on 1/3/14.
//  Copyright (c) 2014 ___zzxhdzj___. All rights reserved.
//

#import "YNAppDelegate.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "UMNavigationController.h"
#import "UMTools.h"
#import "YNSlideNavViewController.h"
#import "UMViewController.h"

#define NAVIGATION_BAR_BTN_RECT         CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)

@implementation YNAppDelegate


- (void)initURLMapping {
    [[UMNavigationController config] setValuesForKeysWithDictionary:[[NSDictionary alloc] initWithObjectsAndKeys:
            @"YNQuestionListViewController", @"ynsf://questionlist", nil]];
}

- (void)initNavigators {
    self.newestNavigationController =
            [[UMNavigationController alloc]
                    initWithRootViewControllerURL:[[NSURL URLWithString:@"ynsf://questionlist"]
                            addParams:[NSDictionary dictionaryWithObjectsAndKeys:@"最新问题", @"title", @"listnewest", @"list", nil]
                    ]];
    UIButton *navBtn = [[UIButton alloc] initWithFrame:NAVIGATION_BAR_BTN_RECT];
    [navBtn setBackgroundImage:[UIImage imageNamed:@"nav_menu.png"] forState:UIControlStateNormal];
    [navBtn setBackgroundImage:[UIImage imageNamed:@"nav_menu.png"] forState:UIControlStateHighlighted];
    [navBtn addTarget:self.navigator action:@selector(slideButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    navBtn.showsTouchWhenHighlighted = YES;
    UIBarButtonItem *nBtnItem = [[UIBarButtonItem alloc] initWithCustomView:navBtn];
    self.newestNavigationController.title = @"最新问题";
    self.newestNavigationController.rootViewController.navigationItem.leftBarButtonItem = nBtnItem;
}

- (void)initSlideNavigator {
    self.navigator = nil;
    self.navigator = [[YNSlideNavViewController alloc] initWithItems:@[@[self.newestNavigationController],@[self.newestNavigationController]]];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [self initURLMapping];
    [self initNavigators];
    [self initSlideNavigator];
    [self.window addSubview:self.navigator.view];
    self.window.backgroundColor = [UIColor whiteColor];
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


#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end