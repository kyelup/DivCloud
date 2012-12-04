//
//  BackToMainSegue.m
//  DivClouds
//
//  Created by LI Haiyun on 11/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BackToMainSegue.h"

@implementation BackToMainSegue

- (void) perform {
    UIViewController *sourceViewController = (UIViewController *) self.sourceViewController;
    //UIViewController *destinationViewController = (UIViewController *) self.destinationViewController;
    
    
    //if success registered ,the goback to the main view
    if ([self.identifier isEqualToString:@"backToMainFromReg"]) {
        
        [sourceViewController.presentingViewController.presentingViewController dismissModalViewControllerAnimated:YES];
    }else
    {
        [sourceViewController dismissModalViewControllerAnimated:YES];
    }
    
    
    //    CATransition* transition = [CATransition animation];
    //    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //   // transition.type = kCATransitionReveal;
    //    transition.subtype = kCAGravityCenter;
    //    transition.duration = 2;
    //     transition.type = @"suckEffect";
    //    [sourceViewController.view.layer addAnimation:transition forKey:kCATransition];
    
    
    //    set this property to your viewController: modalTransitionStyle
    //    typedef enum { UIModalTransitionStyleCoverVertical = 0, 
    //        UIModalTransitionStyleFlipHorizontal,
    //        UIModalTransitionStyleCrossDissolve,  
    //        UIModalTransitionStylePartialCurl,} UIModalTransitionStyle;
    
    
    
    
    
}

@end
