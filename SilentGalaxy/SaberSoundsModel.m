//
//  SaberSoundsModel.m
//  SilentGalaxy
//
//  Created by Raúl Flores on 24/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SaberSoundsModel.h"
#import <AVFoundation/AVFoundation.h>


@implementation SaberSoundsModel
@synthesize saberSoundsArray;


-(id)init
{
    if ((self = [super init])) 
    {
        
        filesArray = [NSArray arrayWithObjects:@"sabramb1.wav",
                      @"ltsaberon01.wav",
                      @"ltsaberoff01.wav",
                      @"sabrswg1.wav",
                      @"sabrswg2.wav",
                      @"sabrswg6.mp3",
                      @"sabrswg4.mp3",
                      @"sabhit1.WAV",
                      @"sabhit2.WAV",
                      @"sabhit3.WAV",
                      @"ltsaberhit15.wav",
                      @"espadazo1.wav",
                      @"espadazo2.wav",
                      @"espadazo3.wav",
                      
                      nil];
        
        //NSLog(@"filesArray: %@",[filesArray description]);
        
        self.saberSoundsArray = [NSMutableArray arrayWithObjects: nil];
        
        for (int i=0; i<[filesArray count]; i++) 
            
        {
            
            NSString *file = [NSString stringWithFormat:@"%@", [[filesArray objectAtIndex:i] description]  ];
            
            
            NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],file]];
            
            
            AVAudioPlayer *sound = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
            [sound prepareToPlay];
            
            [self.saberSoundsArray addObject:sound];
            [sound release];
            
            
            
            
            
        }
        
        //NSLog(@"SaberSoundsArray: %@",[self.saberSoundsArray description]);
        
        //soundsArray = [NSArray arrayWithObjects:@"C3PO-1.mp3", nil];
    }
    
    return self;
    
}

- (void)dealloc {
    
    
	[self.saberSoundsArray release]; 
	[filesArray release];
	
	[super dealloc];
}


@end
