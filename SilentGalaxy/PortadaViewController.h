//
//  PortadaViewController.h
//  SilentGalaxy
//
//  Created by Raúl Flores on 05/10/11.
//  Copyright 2011 Amedea. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PortadaViewController : UIViewController {
    
    UIImageView *sprite;
    UIImageView *anima1;
    UIImageView *anima2;
    UIImageView *anima3;
    BOOL firstTime;
   
}
@property (nonatomic, retain) IBOutlet UIImageView *anima1;
@property (nonatomic, retain) IBOutlet UIImageView *anima2;
@property (nonatomic, retain) IBOutlet UIImageView *anima3;
@property (retain, nonatomic) IBOutlet UIButton *visitanosButton;

@property (nonatomic, retain) IBOutlet UIImageView *sprite;
-(void)fadeOut:(UIView*)viewToDissolve withDuration:(NSTimeInterval)duration ;
- (void)startAnimation;
- (void)secondAnimation;
- (void)thirdAnimation ;
- (void)fourthAnimation ;
- (IBAction)visitarWeb:(id)sender;


@end
