//
//  LoginViewController.m
//  DivClouds
//
//  Created by LI Haiyun on 11/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"
#import "CustomNavigationBar.h"
#import "ConstantValue.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize userNameField;
@synthesize passwordField;
@synthesize indicatorView;
@synthesize unRegisterLabel;
@synthesize unRegisterButton;
@synthesize whereParentView;




- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CustomNavigationBar* customNavigationBar = (CustomNavigationBar*)self.navigationController.navigationBar;    
    // Set the nav bar's background
    [customNavigationBar setBackgroundWith:[UIImage imageNamed:@"bg_blue_linebottom.png"]];
    
    UIImage *backImg=[UIImage imageNamed:@"btn_title_small.png"];
    [self.navigationItem.leftBarButtonItem setBackgroundImage:backImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //set the textField Delegate
    userNameField.delegate=self;
    passwordField.delegate=self;
    indicatorView.hidden=YES;
    
}

//implement the textfield delegate to make the keyboard not seen
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(textField.tag==0){
        [userNameField resignFirstResponder];
        [passwordField becomeFirstResponder];
    }
    if(textField.tag==1){
        
        [passwordField resignFirstResponder];
    }
    
    return TRUE;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


-(void) viewWillAppear:(BOOL)animated{
    if ([whereParentView isEqualToString:@"formMyProfile"]) {
        unRegisterButton.hidden=NO;
        unRegisterLabel.hidden=NO;
    }else {
        
        unRegisterButton.hidden=YES;
        unRegisterLabel.hidden=YES;
    }
}
-(IBAction)verifyUserLogin:(id)sender{
    
    NSString *userName=userNameField.text;
    NSString *password=passwordField.text;
    [passwordField resignFirstResponder];
    [userNameField resignFirstResponder];
    
    if ([userName length] == 0)
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:K_CAN_NOT_EMPTY message:K_CAN_NOT_EMPTY_WITH_ANYONE delegate:nil cancelButtonTitle:K_CAN_NOT_EMPTY_CONFIRM otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    
    if ([password length] == 0)
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:K_CAN_NOT_EMPTY message:K_CAN_NOT_EMPTY_WITH_ANYONE delegate:nil cancelButtonTitle:K_CAN_NOT_EMPTY_CONFIRM otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    else {
        [indicatorView startAnimating];
        indicatorView.hidden=FALSE;
        
        [self performSelector:@selector(dissMissForLogin) withObject:nil afterDelay:4];
    }
    
    
    
}
-(void) dissMissForLogin{
    
    indicatorView.hidden=YES;
    [indicatorView stopAnimating];
    if(userNameField.text.length<5){
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:K_CAN_LOGIN_ERROR message:K_INVALID_USERNAME_PASSWORD delegate:nil cancelButtonTitle:K_CAN_NOT_EMPTY_CONFIRM otherButtonTitles:nil];
        [alert show];
        return;
        
    }else {
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        delegate.isLogin=@"TRUE";
        delegate.userName=userNameField.text;
        [self performSegueWithIdentifier:@"backtoMain" sender:self];
    }
    
}

-(IBAction)unRegisterButtonClick:(id)sender{
    
}


@end
