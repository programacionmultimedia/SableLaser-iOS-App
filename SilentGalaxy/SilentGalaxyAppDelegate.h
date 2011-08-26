//
//  SilentGalaxyAppDelegate.h
//  SilentGalaxy
//
//  Created by Raúl Flores on 02/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SoundsModel;


@interface SilentGalaxyAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

   
    SoundsModel *soundsModel;
    NSMutableArray *soundsArray;
    NSMutableArray *blasterSoundsArray;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;


@property (nonatomic, retain)  NSMutableArray *soundsArray;
@property (nonatomic, retain)  NSMutableArray *blasterSoundsArray;





@end
