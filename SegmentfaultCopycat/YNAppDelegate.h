//
//  YNAppDelegate.h
//  SegmentfaultCopycat
//
//  Created by hijack on 1/3/14.
//  Copyright (c) 2014 ___zzxhdzj___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YNAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end