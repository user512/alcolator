//
//  AppDelegate.m
//  Alcolator
//
//  Created by Tom Lee on 10/20/14.
//  Copyright (c) 2014 Tom Lee. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "WhiskeyViewController.h"


@implementation AppDelegate 

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    
    ViewController *viewController = [[ViewController alloc] init];
    self.window.rootViewController = viewController;
    
    
    //Override point for customization after application launch.
    
    //For Navgation page (Disabled for Tabbed Navigation)
    /*
     MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
     UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainMenuViewController];
     self.window.rootViewController = navigationController;
     */
    
    //Setting UITabBarController as root view controller
    ViewController *wineVC = [[ViewController alloc] init];
    WhiskeyViewController *whiskeyVC = [[WhiskeyViewController alloc] init];
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    tabBarVC.viewControllers = @[wineVC, whiskeyVC];
    
    tabBarVC.delegate = self; //I moved this code to here
    
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
    return YES;
    
    //tabBarVC.delegate = self; When it's here, it won't work
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;
{
    if(tabBarController.selectedIndex == 0)
    {
        NSLog(@"New view controller selected: [Wine]"); // Print into console
    }
    else if(tabBarController.selectedIndex == 1)
    {
        NSLog(@"New view controller selected: [Whiskey]"); // Print into console
    }
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
