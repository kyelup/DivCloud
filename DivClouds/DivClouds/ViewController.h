//
//  ViewController.h
//  DivClouds
//
//  Created by LI Haiyun on 11/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerViewController.h"

@interface ViewController : CustomerViewController<UIAlertViewDelegate>
@property(nonatomic,weak) IBOutlet UIBarButtonItem *loginItemButton;

-(IBAction) loginItemButtonClick:(id)sender;
-(IBAction)myProfile:(id)sender;
-(IBAction)settingButtonClick:(id)sender;




@end
