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



- (void)dealloc
{
    
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
    NSLog(@"SaberViewController-viewDidLoad: ");
    

    
}

- (void)flipsideViewControllerDidFinish:(SaberOnViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)viewWillAppear:(BOOL)animated 
{ 
	[super viewWillAppear:animated];
   
    

	
} 

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
     
    
}




- (IBAction)startLaser:(id)sender {
    
    NSLog(@"startLaser!!");
    
    SaberOnViewController *controller = [[SaberOnViewController alloc] init];
    controller.delegate = self;   
    
    [self presentModalViewController:controller animated:YES];
    [controller release];
    
    
    
       
    //NSLog(@"view: %@",[[self view] description]);

}




@end
