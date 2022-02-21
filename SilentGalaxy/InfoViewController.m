//
//  InfoViewController.m
//  SilentGalaxy
//
//  Created by Raúl Flores on 30/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InfoViewController.h"




@implementation InfoViewController

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
    acelerometro = [UIAccelerometer sharedAccelerometer];
    }
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [acelerometro setDelegate:nil];
 
    
    
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
     acelerometro=nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)mailAction:(id)sender {
    
    MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
    
    mail.mailComposeDelegate = self;
    
    if ([MFMailComposeViewController canSendMail]) {
        
        //Setting up the Subject, recipients, and message body.
        
        [mail setToRecipients:[NSArray arrayWithObjects:@"silentshadow@silentgalaxy.es",nil]];
        
        [mail setSubject:@"Contacto desde iphone-app"];
        
        [mail setMessageBody:@"Contacto desde iphone:" isHTML:NO];
        
        //Present the mail view controller
        
        [self presentModalViewController:mail animated:YES];
        
    }
    else 
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Status:" message:@"El dispositivo no está configurado para enviar emails" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        
        [alert show];
        [alert release];
    }
    
    //release the mail
    
    [mail release];
    
}



- (IBAction)linkAction:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://www.silentgalaxy.es"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error

{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Status:" message:@"" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    
    switch (result) {
        case MFMailComposeResultCancelled:
            alert.message = @"Mensaje cancelado";
            break;
        case MFMailComposeResultSaved:
            alert.message = @"Mensaje salvado";
            break;
        case MFMailComposeResultSent:
            alert.message = @"Mensaje enviado";
            break;
        case MFMailComposeResultFailed:
            alert.message = @"Fallo en el envío";
            break;
        default:
            alert.message = @"El mensaje no ha sido enviado";
            break;
    }
    
    [self dismissModalViewControllerAnimated:YES];
    
    
        
        [alert show];
        
        [alert release];
        
    
    
}
@end
