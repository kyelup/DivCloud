//
//  LoginViewController.h
//  DivClouds
//
//  Created by LI Haiyun on 11/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerViewController.h"
@interface LoginViewController : CustomerViewController<UITextFieldDelegate>

@property(nonatomic,weak) IBOutlet UITextField *userNameField;
@property(nonatomic,weak) IBOutlet UITextField *passwordField;
@property(nonatomic,weak) IBOutlet UIActivityIndicatorView *indicatorView;
@property(nonatomic,weak) IBOutlet UILabel *unRegisterLabel;
@property(nonatomic,weak) IBOutlet UIButton *unRegisterButton;
@property(nonatomic,strong) NSString *whereParentView;

-(IBAction)verifyUserLogin:(id)sender;
-(void) dissMissForLogin;
-(IBAction)unRegisterButtonClick:(id)sender;

@end
