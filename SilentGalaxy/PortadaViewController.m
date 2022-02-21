//
//  PortadaViewController.m
//  SilentGalaxy
//
//  Created by Raúl Flores on 05/10/11.
//  Copyright 2011 Amedea. All rights reserved.
//

#import "PortadaViewController.h"


@implementation PortadaViewController
@synthesize anima1;
@synthesize anima2;
@synthesize anima3;
@synthesize visitanosButton;

@synthesize sprite;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [sprite release];
    [anima1 release];
    [anima2 release];
    [anima3 release];
    
    [visitanosButton release];
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    sprite.alpha  =1;
    anima3.alpha  =0;
    firstTime=TRUE;
    [self fadeOut : sprite withDuration: 1  ];
}

-(void) viewDidAppear:(BOOL)animated
{
    
    
    [self fourthAnimation];
    
}

-(void) viewDidDisappear:(BOOL)animated
{
    
    [visitanosButton setFrame:CGRectMake(visitanosButton.frame.origin.x , 378, visitanosButton.frame.size.width, visitanosButton.frame.size.height)];    
}


- (void)viewDidUnload
{
    [self setSprite:nil];
    [self setAnima1:nil];
    [self setAnima2:nil];
    [self setAnima3:nil];
  
    [self setVisitanosButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)fadeOut:(UIView*)viewToDissolve withDuration:(NSTimeInterval)duration 
{
	[UIView beginAnimations: @"Fade Out" context:nil];
	 [UIView setAnimationDelegate:self];
	// wait for time before begin
	//[UIView setAnimationDelay:wait];
	
	// druation of animation
	[UIView setAnimationDuration:duration];
	viewToDissolve.alpha = 0.0;
	[UIView commitAnimations];
}

- (void)startAnimation 
{
    CGRect startFrame = [anima1 frame];    
    [UIView beginAnimations:@"anima1" context:NULL];
    [UIView setAnimationDuration:0.6];
    [anima1 setFrame:CGRectMake(startFrame.origin.x + 80, startFrame.origin.y, startFrame.size.width, startFrame.size.height)];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
    [UIView commitAnimations];
}

- (void)secondAnimation 
{
    CGRect startFrame = [anima2 frame];    
    [UIView beginAnimations:@"anima2" context:NULL];
    [UIView setAnimationDuration:0.6];
    [anima2 setFrame:CGRectMake(startFrame.origin.x -320, startFrame.origin.y, startFrame.size.width, startFrame.size.height)];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
    [UIView commitAnimations];
}

- (void)thirdAnimation 
{
    [UIView beginAnimations: @"anima3" context:nil];
    [UIView setAnimationDelegate:self];
	// wait for time before begin
	//[UIView setAnimationDelay:wait];
	
	// druation of animation
	[UIView setAnimationDuration:0.6];
	anima3.alpha = 1.0;
	[UIView commitAnimations];

}

- (void)fourthAnimation 
{
    
    CGRect startFrame = [visitanosButton frame];    
    [UIView beginAnimations:@"anima4" context:NULL];
    // wait for time before begin
    if (firstTime) {
        [UIView setAnimationDelay:2.4];
    }
        
	
    [UIView setAnimationDuration:0.6];
    [visitanosButton setFrame:CGRectMake(startFrame.origin.x , startFrame.origin.y-100, startFrame.size.width, startFrame.size.height)];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
    [UIView commitAnimations];

    
}



- (void)animationDidStop:(NSString *)animID finished:(BOOL)didFinish context:(void *)context 
{
    if ( [animID isEqualToString:@"Fade Out"] ) {
       // NSLog(@"Fade Out animation finished.");
        [self startAnimation];
    }
    else if ( [animID isEqualToString:@"anima1"] ) {
       
         [self secondAnimation];
    }
    else if ( [animID isEqualToString:@"anima2"] ) {
        
        [self thirdAnimation];
    }
    else if ( [animID isEqualToString:@"anima4"] ) {
        
       
            
            firstTime=FALSE;
       
    }

   


    

   
}


- (IBAction)visitarWeb:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://www.silentgalaxy.es"];
    [[UIApplication sharedApplication] openURL:url];
}
@end
