//
//  SaberViewController.h
//  SilentGalaxy
//
//  Created by Raúl Flores on 19/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaberOnViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface SaberViewController : UIViewController <SaberOnViewControllerDelegate,UIAccelerometerDelegate,AVAudioPlayerDelegate>{
    
    NSMutableArray *saberSoundsArray; 
    double min;
    double max;
    double negMin;
    double  const_minimum ;
    double  const_negativeMinimum;
    double const_maximum ;
    double const_negativeMaximum;
    UIAccelerometer *acelerometro;
    AVAudioPlayer *openDoor;
   
        
}

@property (retain, nonatomic) IBOutlet UIImageView *puertaView;
@property (nonatomic, retain)  NSMutableArray *saberSoundsArray;





-(void)startLaser;
- (void)startAnimation ;



@end
