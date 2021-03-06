//
//  AppDelegate.m
//  urlsession
//
//  Created by apple on 2016/11/14.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewController11.h"
#import "ViewController12.h"
#import "MainPageViewController.h"
#import "ContactsViewController.h"
#import <Contacts/Contacts.h>
#import "PhotoViewController.h"
#import "LocationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    
    // get contact authority
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    
    if (status == CNAuthorizationStatusNotDetermined) {
        // create address list object
        CNContactStore *contactStore = [[CNContactStore alloc] init];
        
        // request for authorization
        [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (error) {
                NSLog(@"%@", error);
            }
            
            if (granted) {
                NSLog(@"Get authorization success.");
            } else {
                NSLog(@"Get authorization failure.");
            }
        }];
    }
    
//    MainPageViewController *vc = [[MainPageViewController alloc] init];
//    ContactsViewController *vc = [ContactsViewController new];
//    PhotoViewController *vc = [PhotoViewController new];
    LocationViewController *vc = [LocationViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
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
}


@end
