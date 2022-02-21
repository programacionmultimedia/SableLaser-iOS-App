//
//  InfoViewController.h
//  SilentGalaxy
//
//  Created by Raúl Flores on 30/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>


@interface InfoViewController : UIViewController <MFMailComposeViewControllerDelegate,UIAccelerometerDelegate> {
    UIAccelerometer *acelerometro;
    
}
- (IBAction)mailAction:(id)sender;
- (IBAction)linkAction:(id)sender;

@end
