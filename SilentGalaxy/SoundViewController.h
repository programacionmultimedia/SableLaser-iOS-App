//
//  SoundViewController.h
//  SilentGalaxy
//
//  Created by Raúl Flores on 02/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>




@interface SoundViewController : UIViewController {
    
    
	    NSMutableArray *soundsArray;
        AVAudioPlayer *sound ;
    
}
@property (nonatomic, retain)  NSMutableArray *soundsArray;

- (IBAction)playSound:(id)sender;

@end
