//
//  SilentGalaxyAppDelegate.m
//  SilentGalaxy
//
//  Created by Raúl Flores on 02/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SilentGalaxyAppDelegate.h"
#import "SoundViewController.h"
#import "SoundsModel.h"
#import "BlasterViewController.h"


@implementation SilentGalaxyAppDelegate


@synthesize window=_window;

@synthesize tabBarController=_tabBarController;



@synthesize soundsArray=_soundsArray;
@synthesize blasterSoundsArray=_blasterSoundsArray;

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
    
    soundsModel=[[SoundsModel alloc ]init] ;
    [self setSoundsArray:[soundsModel soundsArray ]] ;
    [self setBlasterSoundsArray:[soundsModel blasterSoundsArray ]] ;
    
    self.window.rootViewController = self.tabBarController;
    //NSLog(@"tabbar%@",[[_tabBarController.viewControllers objectAtIndex:1] description]);
    
    SoundViewController *sonidosController=[_tabBarController.viewControllers objectAtIndex:1];
    BlasterViewController *blasterController=[_tabBarController.viewControllers objectAtIndex:2];
    
    //NSLog(@"soundsArray: %d",[self.soundsArray count]);
    
    
    
    [sonidosController setSoundsArray: self.soundsArray ];
    [blasterController setBlasterSoundsArray:self.blasterSoundsArray];
      
    //[[_tabBarController.viewControllers objectAtIndex:1] description];
   

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
    [_soundsArray release];
    [_blasterSoundsArray release];
    [soundsModel release];
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
