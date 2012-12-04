//
//  ForgetPasswordViewController.h
//  DivClouds
//
//  Created by LI Haiyun on 11/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomerViewController.h"

@interface ForgetPasswordViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic,weak) IBOutlet UINavigationBar *customerNavBar;
@property(nonatomic,weak) IBOutlet UINavigationItem *customerNavItem;
@property(nonatomic,weak) IBOutlet UITextField *userNameField;
@property(nonatomic,weak) IBOutlet UITextField *phoneNumberField;
@property(nonatomic,weak) IBOutlet UIActivityIndicatorView *indicatorView;

-(IBAction)getPasswordByCode:(id)sender;
-(void) dissAlertView;
@end
