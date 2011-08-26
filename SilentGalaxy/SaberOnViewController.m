//
//  SaberOnViewController.m
//  SilentGalaxy
//
//  Created by Raúl Flores on 23/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SaberOnViewController.h"
#import <AudioToolbox/AudioToolbox.h>







@implementation SaberOnViewController

@synthesize delegate=_delegate;
@synthesize acelerometro, saberOnView, saberSoundsArray, saberSoundsModel;

double const kminimum = 0.8;
double const knegativeMinimum = -0.8;
double const kmaximum = 1.3;
double const knegativeMaximum = -1.3;



- (void)dealloc
{
    
    
    [self.saberSoundsModel release]; 
    [self.saberSoundsArray release];
    [pulse release];
    [stopLaser release];
    [pasada1 release];
    [pasada2 release];
    [pasada3 release];
    [pasada4 release];
    [startLaser release];
    [self.acelerometro release];
    [self.saberOnView release];
    
    [super dealloc];
}




- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    //NSLog(@"viewDidLoad");
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.saberSoundsModel=nil;
    self.saberSoundsArray=nil;
    pulse=nil;
    stopLaser =nil;
    pasada1 =nil;
    pasada2 =nil;
    pasada3 =nil;
    pasada4 =nil;
    startLaser =nil;
    self.acelerometro =nil;
    self.saberOnView =nil;

    NSLog(@"viewDidUnload");
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)loadView {
    
    UIApplication *thisApp = [UIApplication sharedApplication];
    thisApp.idleTimerDisabled = YES;
    
	saberOnView = [[SaberOnView alloc] initWithFrame:CGRectZero];
	[saberOnView canBecomeFirstResponder];
	[saberOnView becomeFirstResponder];
    
    self.saberSoundsModel=[[SaberSoundsModel alloc] init];
    self.saberSoundsArray=self.saberSoundsModel.saberSoundsArray;
    
    
    
    
    [self createSounds];
    
    self.acelerometro = [UIAccelerometer sharedAccelerometer];
    
    [self.acelerometro setUpdateInterval:0.0416]; 
    
    [self.acelerometro setDelegate:self];
    
    //variables del acelerometro
    min=kminimum;
    max=kmaximum;
    negMin=knegativeMinimum;
   
   
	NSLog(@"monitoring accelerometer");
        
      
	
	self.view = saberOnView;
	//[saberOnView release];
    
    [[UIApplication sharedApplication] setStatusBarHidden: YES withAnimation: UIStatusBarAnimationNone];
    
    
   
    [startLaser play];

    [pulse play];
    
    
    
   
	
}

- (void)touchesBegan:(NSSet *)touches 
           withEvent:(UIEvent *)event 
{ 
    NSLog(@"stopLaser!!");
    [self done];
    
    
} 




- (void)done
{
    [pulse stop];
    [stopLaser play];
    [self.acelerometro setDelegate:nil];
    
    UIApplication *thisApp = [UIApplication sharedApplication];
    thisApp.idleTimerDisabled = NO;
    
    NSLog(@"not monitoring accelerometer");
    
    [self.delegate flipsideViewControllerDidFinish:self];
   
    
}

    
  
    - (void)accelerometer:(UIAccelerometer *)meter didAccelerate:(UIAcceleration *)accel
    {
        
       saberOnView.xShift = saberOnView.xShift * 0.8 + [accel x] * 20.0;
      
        
        
        // Redraw the view
        [self.view setNeedsDisplay];
        
               
        
        
               
        if (  accel.x > min && accel.x < kmaximum)
            
        {
            
            [pasada1 play];
            min=accel.x;
            negMin=knegativeMinimum;
            
        }
        
        if (  accel.x < negMin && accel.x > knegativeMaximum)
            
        {
            
            [pasada2 play];
            negMin=accel.x;
            min=kminimum;
        }
        
        if (  accel.y > min && accel.y < kmaximum)
            
        {
            
            [pasada3 play];
            min=accel.y;
            negMin=knegativeMinimum;
            max=kmaximum;
        }
        
        if (  accel.y < negMin && accel.y > knegativeMaximum)
            
        {
            
            [pasada4 play];
            negMin=accel.y;
            min=kminimum;
        }
        
        if (  accel.y > max)
            
        {
            int randomHit = 7 + arc4random() % 7;
            //NSLog(@"randomHit:%i",randomHit);
            
            
            [(AVAudioPlayer *)[saberSoundsArray objectAtIndex:randomHit]   play] ;
            max=accel.y;
            
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
            
        }



       
        

        //NSLog(@"accel.x:%f",accel.x);
        //NSLog(@"accel.y:%f",accel.y);
        //NSLog(@"accel.z:%f",accel.z);
        
        
    }
    
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
    
}


-(void) createSounds
{
    
    //sonido constante*************************
    pulse = (AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:0];
   
    pulse.numberOfLoops=-1;
    pulse.delegate=self;
    [pulse retain];
       
    //sonido entrada*************************
    
    startLaser=(AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:1];
    [startLaser retain];

    
    //sonido salida*************************
    stopLaser = (AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:2];
    [stopLaser retain];
    

    
    //sonido pasada1*************************
        
    pasada1 = (AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:3];
    [pasada1 retain];

    //sonido pasada2*************************
    pasada2 = (AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:4];
    [pasada2 retain];
    
    //sonido pasada3*************************
       
    pasada3 = (AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:5];
    [pasada3 retain];
    
    //sonido pasada4*************************
       
    
    pasada4 = (AVAudioPlayer *)[self.saberSoundsArray objectAtIndex:6];
    [pasada4 retain];

    



    
    
}    


-(void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
     //NSLog(@"audioPlayerBeginInterruption");
    [pulse stop];
    
}
-(void)audioPlayerEndInterruption:(AVAudioPlayer *)player
{
    //NSLog(@"audioPlayerEndInterruption");
    [pulse play];
}


@end
