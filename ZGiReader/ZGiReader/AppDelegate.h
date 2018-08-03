//
//  AppDelegate.h
//  ZGiReader
//
//  Created by 杨振国 on 2018/7/26.
//  Copyright © 2018年 aikutv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

