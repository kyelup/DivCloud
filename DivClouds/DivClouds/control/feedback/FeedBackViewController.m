//
//  FeedBackViewController.m
//  DivClouds
//
//  Created by LI Haiyun on 12/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FeedBackViewController.h"
#import "CustomNavigationBar.h"

@interface FeedBackViewController ()

@end

@implementation FeedBackViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CustomNavigationBar* customNavigationBar = (CustomNavigationBar*)self.navigationController.navigationBar;    
    // Set the nav bar's background
    [customNavigationBar setBackgroundWith:[UIImage imageNamed:@"bg_blue_linebottom.png"]];
    
    UIImage *backImg=[UIImage imageNamed:@"navigationBarBackButton.png"];
    [self.navigationItem.leftBarButtonItem setBackgroundImage:backImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIImage *rightImg=[UIImage imageNamed:@"navigationBarSquareButton.png"];
    [self.navigationItem.rightBarButtonItem setBackgroundImage:rightImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(IBAction)finishButtonClick:(id)sender{
    UIBarButtonItem *barButtonItem=sender;
    
    if (barButtonItem.tag==0) {
        NSLog(@"--------0---------");
    }else {
        NSLog(@"--------else---------");
    }
    
    [self performSegueWithIdentifier:@"settingToMain" sender:self];
}


@end
