//
//  SoundsModel.h
//  SilentGalaxy
//
//  Created by Raúl Flores on 18/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SoundsModel : NSObject {
    
    NSMutableArray *soundsArray;
    NSMutableArray *blasterSoundsArray;
    NSArray *filesArray;
    NSArray *blasterFilesArray;
    
}

@property (retain) NSMutableArray *soundsArray;
@property (retain) NSMutableArray *blasterSoundsArray;
@end
