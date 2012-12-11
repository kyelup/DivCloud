//
//  ForgetPasswordViewController.m
//  DivClouds
//
//  Created by LI Haiyun on 11/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "CustomNavigationBar.h"
#import "ConstantValue.h"

@interface ForgetPasswordViewController ()

@end

@implementation ForgetPasswordViewController
@synthesize customerNavBar;
@synthesize customerNavItem;
@synthesize userNameField;
@synthesize phoneNumberField;
@synthesize indicatorView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CustomNavigationBar* customNavigationBar = (CustomNavigationBar*)self.customerNavBar;    
    // Set the nav bar's background
    [customNavigationBar setBackgroundWith:[UIImage imageNamed:@"bg_blue_linebottom.png"]];
    
    UIImage *backImg=[UIImage imageNamed:@"navigationBarBackButton.png"];
    [self.customerNavItem.leftBarButtonItem setBackgroundImage:backImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //set delegate
    userNameField.delegate=self;
    phoneNumberField.delegate=self;
    [indicatorView stopAnimating];
    indicatorView.hidden=YES;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

//implement the textfield delegate to make the keyboard not seen
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if(textField.tag==0){
        [userNameField resignFirstResponder];
        [phoneNumberField becomeFirstResponder];
    }
    if(textField.tag==1){
        
        [phoneNumberField resignFirstResponder];
    }
    
    return TRUE;
}

//imeplement the submit method
-(IBAction)getPasswordByCode:(id)sender{
    
    
    NSString *userName=userNameField.text;
    NSString *phoneNumber=phoneNumberField.text;
    [phoneNumberField resignFirstResponder];
    [userNameField resignFirstResponder];
    
    if ([userName length] == 0)
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:K_REGISTER_TITLE message:K_REGISTER_MESSAGE_EMPTY_USERNAME delegate:nil cancelButtonTitle:K_CAN_NOT_EMPTY_CONFIRM otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    
    if ([phoneNumber length] == 0)
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:K_CAN_NOT_EMPTY message:K_FIND_PASSWORD_MESSAGE_PHONE_EMPTY delegate:nil cancelButtonTitle:K_CAN_NOT_EMPTY_CONFIRM otherButtonTitles:nil];
        [alert show];
        return;
    }else {
        [indicatorView startAnimating];
        indicatorView.hidden=FALSE;
        [self performSelector:@selector(dissAlertView) withObject:nil afterDelay:4];
    }
    
}
-(void) dissAlertView{
    indicatorView.hidden=YES;
    [indicatorView stopAnimating];
    
    //check some exception when the register
    if(userNameField.text.length>5){
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:K_FIND_PASSWORD_TITLE_SUCCESS message:K_FIND_PASSWORD_SUCCESS_MESSAGE delegate:nil cancelButtonTitle:K_CAN_NOT_EMPTY_CONFIRM otherButtonTitles:nil];
        [alert show];
        
    }else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:K_FIND_PASSWORD_TITLE_FAILED message:K_FIND_PASSWORD_FAILED_MESSAGE delegate:nil cancelButtonTitle:K_CAN_NOT_EMPTY_CONFIRM otherButtonTitles:nil];
        [alert show];
        
    }
    
}


@end
