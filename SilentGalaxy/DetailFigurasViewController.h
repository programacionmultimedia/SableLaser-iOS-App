//
//  DetailFigurasViewController.h
//  SilentGalaxy
//
//  Created by Raúl Flores on 02/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Possession;

@interface DetailFigurasViewController : UIViewController {
   
    Possession *_nombreFigura;
    UITextField *_titleField;
}

@property (retain) Possession *nombreFigura;
@property (retain) IBOutlet UILabel *titleLabel;
@end
