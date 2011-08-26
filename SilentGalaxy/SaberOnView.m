//
//  SaberOnView.m
//  SilentGalaxy
//
//  Created by Raúl Flores on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SaberOnView.h"




@implementation SaberOnView

@synthesize xShift; 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //fdo********************************
        UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"fdo_Saber.png"]];
        self.backgroundColor = background;
        [background release];

        
        //sable*****************************
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"sable.png" ofType:nil];
		UIImage *img = [UIImage imageWithContentsOfFile:imagePath];
		image = CGImageRetain(img.CGImage);
        
        
        
       
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    // Drawing code
    // What rectangle am I filling?
	CGRect bounds = [self bounds];
	
	// Where is its center?
	CGPoint center;
	center.x = bounds.origin.x + bounds.size.width / 2.0;
	center.y = bounds.origin.y + bounds.size.height / 2.0;
    
	// Get the context being draw upon
	CGContextRef context = UIGraphicsGetCurrentContext();
		
    center.x += xShift; 
   
    
       
    //Define a rectangle
    //CGContextAddRect(context, CGRectMake(center.x - 50.0,center.y -300.0, 100.0, 600.0));     //X, Y, Width, Height
    //Draw it
    //CGContextFillPath(context);
 
    
    CGRect imageRect;
	imageRect.origin = CGPointMake(center.x - 71, center.y -240);
	imageRect.size = CGSizeMake(143.0, 480.0);
	
		// Draw the image
	CGContextDrawImage(context, imageRect, image);
	
     	
}



- (BOOL)canBecomeFirstResponder 
{ 
    return YES; 
} 



- (void)dealloc
{
    CGImageRelease(image);
    [super dealloc];
}

@end
