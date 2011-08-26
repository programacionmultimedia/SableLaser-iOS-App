//
//  FigurasTableViewController.h
//  SilentGalaxy
//
//  Created by Raúl Flores on 02/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailFigurasViewController;


@interface FigurasTableViewController : UITableViewController {
    
    NSMutableArray *_figuras;
    DetailFigurasViewController *_detailController;
}

@property (retain) NSMutableArray *figuras;
@property (retain)  DetailFigurasViewController *detailController;

@end
