//
//  YNAppDelegate.h
//  SegmentfaultCopycat
//
//  Created by hijack on 1/3/14.
//  Copyright (c) 2014 ___zzxhdzj___. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UMNavigationController;
@class YNSlideNavViewController;

@interface YNAppDelegate : UIResponder <UIApplicationDelegate>
-(void)initSlideNavigator;
@property (strong, nonatomic) UIWindow *window;
@property(nonatomic) YNSlideNavViewController *navigator;
@property(nonatomic, strong) UMNavigationController *newestNavigationController;


@end