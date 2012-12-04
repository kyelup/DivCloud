//
//  SettingMainViewController.m
//  DivClouds
//
//  Created by LI Haiyun on 11/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingMainViewController.h"
#import "CustomNavigationBar.h"

@interface SettingMainViewController ()

@end

@implementation SettingMainViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CustomNavigationBar* customNavigationBar = (CustomNavigationBar*)self.navigationController.navigationBar;    
    // Set the nav bar's background
    [customNavigationBar setBackgroundWith:[UIImage imageNamed:@"bg_blue_linebottom.png"]];
    
    UIImage *backImg=[UIImage imageNamed:@"btn_title_small.png"];
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
    [self performSegueWithIdentifier:@"settingToMain" sender:self];
}

@end
