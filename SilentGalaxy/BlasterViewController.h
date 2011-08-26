//
//  BlasterViewController.h
//  SilentGalaxy
//
//  Created by Raúl Flores on 25/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface BlasterViewController : UIViewController {
    
    NSMutableArray *blasterSoundsArray;
    AVAudioPlayer *sound ;
    
}
@property (nonatomic, retain)  NSMutableArray *blasterSoundsArray;
- (IBAction) playSound:(id)sender;

@end

