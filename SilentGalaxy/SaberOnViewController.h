//
//  SaberOnViewController.h
//  SilentGalaxy
//
//  Created by Raúl Flores on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import "SaberOnView.h"



@protocol SaberOnViewControllerDelegate;

@interface SaberOnViewController : UIViewController <UIAccelerometerDelegate, AVAudioPlayerDelegate>{
    
    AVAudioPlayer *pulse;
    AVAudioPlayer *startLaser;
    AVAudioPlayer *stopLaser;
    AVAudioPlayer *pasada1;
    AVAudioPlayer *pasada2;
    AVAudioPlayer *pasada3;
    AVAudioPlayer *pasada4;
   
    
   
    NSMutableArray *saberSoundsArray;
    UIAccelerometer *acelerometro;
    //SaberOnView *saberOnView;
    
    double min;
    double max;
    double negMin;
    
   
   
    
    
}


@property (nonatomic, assign) id <SaberOnViewControllerDelegate> delegate;


@property (nonatomic, retain) SaberOnView *saberOnView;
@property (nonatomic, retain)  NSMutableArray *saberSoundsArray;


- (void) done;
- (void) createSounds;


@end

@protocol SaberOnViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(SaberOnViewController *)controller;
@end
