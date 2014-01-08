//
//  YNQuestionListViewController.m
//  SegmentfaultCopycat
//
//  Created by hijack on 1/8/14.
//  Copyright (c) 2014 ___zzxhdzj___. All rights reserved.
//

#import "YNQuestionListViewController.h"
#import "YNAppDelegate.h"

@interface YNQuestionListViewController ()

@end

@implementation YNQuestionListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = [self.params objectForKey:@"title"];
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:@"侧栏导航"
                                                                style:UIBarButtonItemStylePlain
                                                               target:[(YNAppDelegate *) [[UIApplication sharedApplication] delegate] navigator]
                                                               action:@selector(slideButtonClicked)];
    self.navigationItem.leftBarButtonItem = btnItem;
}


@end
