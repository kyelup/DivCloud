//
//  CustomerViewController.m
//  DivClouds
//
//  Created by LI Haiyun on 11/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomerViewController.h"
#import "CustomNavigationBar.h"

@interface CustomerViewController ()

@end

@implementation CustomerViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    CustomNavigationBar* customNavigationBar = (CustomNavigationBar*)self.navigationController.navigationBar;    
    // Set the nav bar's background
    [customNavigationBar setBackgroundWith:[UIImage imageNamed:@"bg_blue_linebottom_icon.png"]];


}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



@end
