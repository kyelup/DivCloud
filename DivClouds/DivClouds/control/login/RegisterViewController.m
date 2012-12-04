//
//  RegisterViewController.m
//  DivClouds
//
//  Created by LI Haiyun on 11/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RegisterViewController.h"
#import "CustomNavigationBar.h"
#import "ConstantValue.h"
#import "AppDelegate.h"
@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize customerNavBar;
@synthesize customerNavItem;
@synthesize phoneNumberField;
@synthesize passwordField;
@synthesize confirmPasswordField;
@synthesize indicatorView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CustomNavigationBar* customNavigationBar = (CustomNavigationBar*)self.customerNavBar;    
    // Set the nav bar's background
    [customNavigationBar setBackgroundWith:[UIImage imageNamed:@"bg_blue_linebottom.png"]];
    
    UIImage *backImg=[UIImage imageNamed:@"btn_title_small.png"];
    
    [self.customerNavItem.leftBarButtonItem setBackgroundImage:backImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIImage *rightImg=[UIImage imageNamed:@"navigationBarSquareButton.png"];
    [self.customerNavItem.rightBarButtonItem setBackgroundImage:rightImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    phoneNumberField.delegate=self;
    passwordField.delegate=self;
    confirmPasswordField.delegate=self;
    [indicatorView stopAnimating];
    indicatorView.hidden=YES;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.tag==0){
        [phoneNumberField resignFirstResponder];
        [passwordField becomeFirstResponder];
        
        
    }
    else if(textField.tag==1){
        
        [passwordField resignFirstResponder];
        [confirmPasswordField becomeFirstResponder];
    }else if(textField.tag==2){
        [confirmPasswordField resignFirstResponder];
    }
    
    return TRUE;
}


-(IBAction)verifyUserRegister:(id)sender{
    NSString *phoneNumber=phoneNumberField.text;
    NSString *password=passwordField.text;
    NSString *confirmPassword=confirmPasswordField.text;
    [confirmPasswordField resignFirstResponder];
    [phoneNumberField resignFirstResponder];
    [passwordField resignFirstResponder];
    
    //check the form properties
    if ([phoneNumber length] == 0)
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:K_REGISTER_TITLE message:K_REGISTER_MESSAGE_EMPTY_USERNAME delegate:nil cancelButtonTitle:K_CAN_NOT_EMPTY_CONFIRM otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    
    if ([password length] == 0)
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:K_REGISTER_TITLE message:K_REGISTER_MESSAGE_EMPTY_PASSWORD delegate:nil cancelButtonTitle:K_CAN_NOT_EMPTY_CONFIRM otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    if ([confirmPassword length] == 0)
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:K_REGISTER_TITLE message:K_REGISTER_MESSAGE_EMPTY_CONFIRMPASSWORD delegate:nil cancelButtonTitle:K_CAN_NOT_EMPTY_CONFIRM otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    else {
        [indicatorView startAnimating];
        indicatorView.hidden=FALSE;
        [self performSelector:@selector(dissToMainView) withObject:nil afterDelay:4];
    }
    
    
}

-(void) dissToMainView{
    
    //check whether it's registed successfully.
    indicatorView.hidden=YES;
    [indicatorView stopAnimating];
    
    //check some exception when the register
    if(phoneNumberField.text.length<5){
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:K_REGISTER_TITLE message:K_REGISTER_MESSAGE_USER_EXIST delegate:nil cancelButtonTitle:K_CAN_NOT_EMPTY_CONFIRM otherButtonTitles:nil];
        [alert show];
        return;
        
    }else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:K_REGISTER_TITLE_SUCCESS message:K_REGISTER_MESSAGE_SUCCESS delegate:self cancelButtonTitle:@"取消" otherButtonTitles:K_CAN_NOT_EMPTY_CONFIRM,nil];
        alert.tag=11;
        [alert show];
    }
    
    
}

-(void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
  
    if (alertView.tag==11) {
        if (buttonIndex==0) {
            //dissmiss the view 
        }else {
            //back to the main view
            AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            delegate.isLogin=@"TRUE";
            delegate.userName=phoneNumberField.text;
            [self performSegueWithIdentifier:@"backToMainFromReg" sender:self];
        }
    }
}
@end
