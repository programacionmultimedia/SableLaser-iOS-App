//
//  SaberViewController.m
//  SilentGalaxy
//
//  Created by Raúl Flores on 19/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SaberViewController.h"
#import "SaberOnViewController.h"


@implementation SaberViewController

@synthesize puertaView;
@synthesize saberSoundsArray=_saberSoundsArray;





- (void)dealloc
{
     
   
    //[self.saberSoundsArray release];
    self.saberSoundsArray = nil;
    [puertaView release];
    [openDoor release];
    
    [super dealloc];
}




- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
   
    
    
    //NSLog(@"saberSoundsArray: %@",[controller.saberSoundsArray description]);

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   
    
    acelerometro = [UIAccelerometer sharedAccelerometer];
    [acelerometro setUpdateInterval:0.0416]; 
    
    const_minimum = 0.8;
    const_negativeMinimum = -0.8;
    const_maximum = 1.3;
    const_negativeMaximum = -1.3;
    
    NSString *file = [NSString stringWithFormat:@"DOORELEC.wav"  ];
    
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],file]];
    
    
    
    openDoor = [[AVAudioPlayer alloc]  initWithContentsOfURL:url error:nil] ;

    
   

    
    
    
 
    //NSLog(@"saberSoundsArray: %@",[saberSoundsArray description]);
     NSLog(@"SaberViewController: viewDidLoad: ");

    
}

- (void)flipsideViewControllerDidFinish:(SaberOnViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
    
}

- (void)viewDidUnload
{
    NSLog(@"SaberViewController: viewDidUnload: ");
    
    self.saberSoundsArray = nil;
    [self setPuertaView:nil];
    openDoor=nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
        
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [acelerometro setDelegate:self];
     [self startAnimation];
    
     
    
}





-(void)startLaser
{
     
    [acelerometro setDelegate:nil];
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    NSLog(@"_saberSoundsArray count: %d",[_saberSoundsArray count]);
    
    SaberOnViewController *controller = [[SaberOnViewController alloc] init];
    
    [controller setDelegate:self];
    
    NSLog(@"self.saberSoundsArray retain Count: %i",[self.saberSoundsArray retainCount]);
    
    [controller setSaberSoundsArray: _saberSoundsArray];
    
    
    
    [self presentModalViewController:controller animated:YES];
    
    
    [controller release];
    
    
    
    
    //NSLog(@"view: %@",[[self view] description]);

    
    
    
}

//*****************************************************************


- (void)accelerometer:(UIAccelerometer *)meter didAccelerate:(UIAcceleration *)accel
{
    
    
      NSLog(@"monitoring accelerometer");
    
    
      
    
    
    if (  accel.x > min && accel.x < const_maximum)
        
    {
        
       
        min=accel.x;
        negMin=const_negativeMinimum;
        
    }
    
    if (  accel.x < negMin && accel.x > const_negativeMaximum)
        
    {
        
        
        negMin=accel.x;
        min=const_minimum;
    }
    
    if (  accel.y > min && accel.y < const_maximum)
        
    {
        
       
        min=accel.y;
        negMin=const_negativeMinimum;
        max=const_maximum;
    }
    
    if (  accel.y < negMin && accel.y > const_negativeMaximum)
        
    {
        
        
        negMin=accel.y;
        min=const_minimum;
    }
    
    if (  accel.y > max)
        
    {
             
        max=accel.y;
        
        [self startLaser];
        
    }
    
    
    
    //NSLog(@"accel.x:%f",accel.x);
    //NSLog(@"accel.y:%f",accel.y);
    //NSLog(@"accel.z:%f",accel.z);
    
    
}

- (void)startAnimation 
{
    CGRect startFrame = [puertaView frame];    
    [UIView beginAnimations:@"puertaView" context:NULL];
    [UIView setAnimationDuration:0.8];
    [puertaView setFrame:CGRectMake(startFrame.origin.x, startFrame.origin.y - 420, startFrame.size.width, startFrame.size.height)];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
    [UIView commitAnimations];
    [openDoor play];
}

- (void)animationDidStop:(NSString *)animID finished:(BOOL)didFinish context:(void *)context 
{
    if ( [animID isEqualToString:@"puertaView"] ) {
        // NSLog(@"puertaView animation finished.");
        
    }
       
}

-(void) viewDidDisappear:(BOOL)animated
{
   
    
    [puertaView setFrame:CGRectMake(puertaView.frame.origin.x , -20, puertaView.frame.size.width, puertaView.frame.size.height)];    
}






@end
