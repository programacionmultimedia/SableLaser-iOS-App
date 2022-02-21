//
//  SilentGalaxyAppDelegate.h
//  SilentGalaxy
//
//  Created by Raúl Flores on 02/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SaberSoundsModel;


@interface SilentGalaxyAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

   
    SaberSoundsModel *saberSoundsModel;
    
    

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;









@end
