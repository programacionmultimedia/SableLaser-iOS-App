//
//  SoundsModel.m
//  SilentGalaxy
//
//  Created by Raúl Flores on 18/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SoundsModel.h"
#import <AVFoundation/AVFoundation.h>


@implementation SoundsModel

@synthesize soundsArray, blasterSoundsArray;




-(id)init
{
    if ((self = [super init])) 
    {
        //sonidos de frases****************************************************
        
        filesArray = [NSArray arrayWithObjects:@"C3PO-1.WAV",
                      @"SOLO-1.WAV",
                      @"GE88.WAV",
                      @"OBIWAN-1.WAV",
                      nil];
        
        //NSLog(@"filesArray: %@",[filesArray description]);
        
        soundsArray = [NSMutableArray arrayWithObjects: nil];
        
        for (int i=0; i<[filesArray count]; i++) 
            
        {
            
            NSString *file = [NSString stringWithFormat:@"%@", [[filesArray objectAtIndex:i] description]  ];
            
            
            NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],file]];
            
            
            AVAudioPlayer *sound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            [sound prepareToPlay];
            
            [soundsArray addObject:sound];
            [sound release];
               
                
        }
        
        //sonidos de blasters****************************************************
        
        blasterFilesArray = [NSArray arrayWithObjects:@"b_leia.mp3",
                      @"b_hansolo.mp3",
                      nil];
        
        //NSLog(@"filesArray: %@",[filesArray description]);
        
        blasterSoundsArray = [NSMutableArray arrayWithObjects: nil];
        
        for (int i=0; i<[blasterFilesArray count]; i++) 
            
        {
            
            NSString *file = [NSString stringWithFormat:@"%@", [[blasterFilesArray objectAtIndex:i] description]  ];
            
            
            NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],file]];
            
            
            AVAudioPlayer *sound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            [sound prepareToPlay];
            
            [blasterSoundsArray addObject:sound];
            [sound release];
            
            
            
            
            
            
        }

        
        //NSLog(@"soundsArrayModel: %@",[soundsArray description]);
        
        //soundsArray = [NSArray arrayWithObjects:@"C3PO-1.mp3", nil];
    }
    
    return self;
    
}

- (void)dealloc {
    
    
	[self.soundsArray release]; 
    [self.blasterSoundsArray release]; 
	[filesArray release];
	
	[super dealloc];
}



@end
