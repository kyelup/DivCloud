//
//  ViewController.m
//  DivClouds
//
//  Created by LI Haiyun on 11/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CustomNavigationBar.h"
#import "CustomerViewController.h"
#import "AppDelegate.h"
#import "ConstantValue.h"
#import "LoginViewController.h"

@interface ViewController (){
    //this parameter is used for how to view in the LoginViewController
    int unRegisterID;
    
}

@end

@implementation ViewController
@synthesize loginItemButton;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *rightImg=[UIImage imageNamed:@"navigationBarSquareButton.png"];
    [loginItemButton setBackgroundImage:rightImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    unRegisterID=0;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
}

//implements viewWillAppear method
-(void) viewWillAppear:(BOOL)animated{
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([delegate.isLogin isEqualToString:@"TRUE"]) {
        [loginItemButton setTitle:delegate.userName];
    }else {
        [loginItemButton setTitle:@"会员登录"];
    }
}
-(void) viewWillDisappear:(BOOL)animated{
    //reset unused parameter
    unRegisterID=0;
    
}
-(IBAction) loginItemButtonClick:(id)sender{
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ([delegate.isLogin isEqualToString:@"TRUE"]) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"" message:K_LOUT_OUT_MESSAGE delegate:self cancelButtonTitle:K_LOUT_OUT_BUTTON_TITLE_CANCEL otherButtonTitles:K_LOUT_OUT_BUTTON_TITLE_CONFIRM,nil];
        
        [alert show];
        
    }else {
        [self performSegueWithIdentifier:@"MainToLogin" sender:self];
    }
}

-(void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    
    if (buttonIndex==0) {
        //dissmiss the view 
    }else {
        //back to the main view
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        delegate.isLogin=@"FASLE";
        delegate.userName=@"";
        [self viewWillAppear:YES];
    }
}

-(IBAction)myProfile:(id)sender{
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if ([delegate.isLogin isEqualToString:@"TRUE"]) {
        [self performSegueWithIdentifier:@"MainToProfile" sender:self];
    }else {
        unRegisterID=1;
        [self performSegueWithIdentifier:@"MainToLogin" sender:self];
    }
    
    
    
}

-(IBAction)settingButtonClick:(id)sender{
     [self performSegueWithIdentifier:@"MainToSetting" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //to check when to the login page ,if it's not from loginItembutton ,then will show unregisterButton and Label
    if (unRegisterID==1) {
        UINavigationController *loginViewController = (UINavigationController *)segue.destinationViewController;
        [[loginViewController.viewControllers objectAtIndex:0] setValue:@"formMyProfile" forKey:@"whereParentView"];
    }
    
}


@end
