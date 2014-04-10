//
//  AppDelegate.h
//  DailySpent
//
//  Created by Moises Quineche on 4/4/14.
//  Copyright (c) 2014 Moises Quineche. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly,strong,nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly,strong,nonatomic) NSManagedObjectModel *managedOBjectModel;
@property (readonly,strong,nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly,strong,nonatomic) NSManagedObject *spendObj;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
