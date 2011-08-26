//
//  BlasterViewController.m
//  SilentGalaxy
//
//  Created by Raúl Flores on 25/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BlasterViewController.h"


@implementation BlasterViewController

@synthesize blasterSoundsArray;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    [super viewDidLoad];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload
{
    
    [super viewDidUnload];
    NSLog(@"viewDidUnload");
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)viewWillDisappear:(BOOL)animated
{
    
    NSLog(@"viewWillDisappear:"); 
    if ( sound != nil) 
    {
        
        [sound stop];
        [sound setCurrentTime:0];
        
        
    }    
    
    
    
    
}



- (IBAction)playSound:(id)sender {
    
    
    //NSLog(@"soundsArrayController: %d",i);
    
    
    
    if ( sound != nil) 
    {
        
        [sound stop];
        [sound setCurrentTime:0];
        
        
    }    
    
    
    sound =[self.blasterSoundsArray objectAtIndex:[sender tag]];
    
    
    //NSLog(@"soundsArray: %@",[[self.soundsArray objectAtIndex:[sender tag]] description]);
    
    [sound play];
    
    
    
    
}


- (void)dealloc
{
    [self.blasterSoundsArray release];
    [sound release];
    
    [super dealloc];
}


@end
