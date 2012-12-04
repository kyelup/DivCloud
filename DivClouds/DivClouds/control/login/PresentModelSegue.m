//
//  PresentModelSegue.m
//  DivClouds
//
//  Created by LI Haiyun on 11/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PresentModelSegue.h"

@implementation PresentModelSegue

-(void) perform{
    UIViewController *sourceViewController = (UIViewController *) self.sourceViewController;
    UIViewController *destinationViewController = (UIViewController *) self.destinationViewController;
    
    sourceViewController.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [sourceViewController.navigationController presentModalViewController:destinationViewController animated:YES];
    
}
@end
