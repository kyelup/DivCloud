//
//  RegisterViewController.h
//  DivClouds
//
//  Created by LI Haiyun on 11/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomerViewController.h"

@interface RegisterViewController : UIViewController<UITextFieldDelegate,UIAlertViewDelegate>
@property(nonatomic,weak) IBOutlet UINavigationBar *customerNavBar;
@property(nonatomic,weak) IBOutlet UINavigationItem *customerNavItem;
@property(nonatomic,weak) IBOutlet UITextField *phoneNumberField;
@property(nonatomic,weak) IBOutlet UITextField *passwordField;
@property(nonatomic,weak) IBOutlet UITextField *confirmPasswordField;
@property(nonatomic,weak) IBOutlet UIActivityIndicatorView *indicatorView;
-(void) dissToMainView;
-(IBAction)verifyUserRegister:(id)sender;
@end
