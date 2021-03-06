//
//  SilentGalaxyAppDelegate.m
//  SilentGalaxy
//
//  Created by Raúl Flores on 02/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SilentGalaxyAppDelegate.h"
#import "SaberSoundsModel.h"

#import "SaberViewController.h"



@implementation SilentGalaxyAppDelegate


@synthesize window=_window;

@synthesize tabBarController=_tabBarController;






-(id) init
{
    
    if ((self = [super init])) 
    {
        
      
        
        
        
    }
    
    return self;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    
   
       
    self.window.rootViewController = self.tabBarController;
    
     SaberViewController *saberController=[_tabBarController.viewControllers objectAtIndex:0];
    
     saberSoundsModel = [[SaberSoundsModel alloc] init];
     [saberController setSaberSoundsArray: [saberSoundsModel saberSoundsArray ]];
    
     [saberSoundsModel release];
    
   
         
   
    
      
    
 
       
   
    [self.window makeKeyAndVisible];
   
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    NSLog(@"appdelegate:applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    
}


- (void)dealloc
{
    
    [_window release];
    [_tabBarController release];
   
      [super dealloc];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
