//
//  AppDelegate.h
//  OurTimes
//
//  Created by 洪坤展 on 2015/9/24.
//  Copyright © 2015年 Hong Kun Zhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "FMDatabase.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) FMDatabase *db;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

