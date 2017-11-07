//
//  AppDelegate.m
//  LoanApp
//
//  Created by 张超 on 2017/11/4.
//  Copyright © 2017年 张超. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "LoanViewController.h"
#import "MyViewController.h"
#import "MoreViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
//    设置tabs的根视图控制器
    HomeViewController *homeView = [[HomeViewController alloc]init];
    LoanViewController *loanView = [[LoanViewController alloc]init];
    MyViewController *myView = [[MyViewController alloc]init];
    MoreViewController *moreView = [[MoreViewController alloc]init];
    
//    设置tabs的根视图控制器
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeView];
    homeNav.navigationBar.translucent = NO;
    homeNav.navigationBar.barTintColor=[UIColor whiteColor];
    UINavigationController *loanNav = [[UINavigationController alloc]initWithRootViewController:loanView];
    loanNav.navigationBar.barTintColor=[UIColor whiteColor];
    UINavigationController *myNav = [[UINavigationController alloc]initWithRootViewController:myView];
    myNav.navigationBar.barTintColor=[UIColor whiteColor];
    UINavigationController *moreNav = [[UINavigationController alloc]initWithRootViewController:moreView];
    moreNav.navigationBar.barTintColor=[UIColor whiteColor];
    
    UITabBarItem *homeItem=[[UITabBarItem alloc]init];
    homeItem.selectedImage=[UIImage imageNamed:@"icon-home-active"];
    homeItem.image=[[UIImage imageNamed:@"icon-home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNav.tabBarItem = homeItem;
    
    UITabBarItem *loanItem = [[UITabBarItem alloc]initWithTitle:@"贷款" image:[UIImage imageNamed:@"icon-loan2"] selectedImage:[UIImage imageNamed:@"icon-loan-active"]];
    loanNav.tabBarItem = loanItem;
    UITabBarItem *myItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"icon-my"] selectedImage:[UIImage imageNamed:@"icon-my-active"]];
    myNav.tabBarItem = myItem;
    UITabBarItem *moreItem = [[UITabBarItem alloc]initWithTitle:@"更多" image:[UIImage imageNamed:@"icon-more"] selectedImage:[UIImage imageNamed:@"icon-more-active"]];
    moreNav.tabBarItem = moreItem;
    
    
//    设置tabs为程序根视图控制器
    NSArray *rootControllers = [[NSArray alloc]initWithObjects:homeNav,loanNav,myNav,moreNav, nil];
    UITabBarController *tabs = [[UITabBarController alloc]init];
    tabs.tabBar.barTintColor = [UIColor whiteColor];
//    [tabs setViewControllers:rootControllers animated:YES];
    
    [tabs setViewControllers:rootControllers animated:NO];
 
//    设置各根视图的tab样式
//    UITabBarItem *homeItem = [[UITabBarItem alloc]initWithTitle:@"主页" image:[UIImage imageNamed:@"icon-home"] selectedImage:[UIImage imageNamed:@"icon-home-active"]];
    
   
//    tabs.selectedIndex=1;
//    tabs.selectedViewController=[tabs.viewControllers objectAtIndex:0];
//    tabs.selectedIndex=0;
    self.window.rootViewController = tabs;
    [self.window isKeyWindow];
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"LoanApp"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
