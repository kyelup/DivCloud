//
//  FeedBackViewController.h
//  DivClouds
//
//  Created by LI Haiyun on 12/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomerViewController.h"

@interface FeedBackViewController : CustomerViewController<UIScrollViewDelegate>{
    
}
@property(nonatomic,weak) IBOutlet UIScrollView *uiScrollView;
@property(nonatomic,weak) IBOutlet UITextField *emailAddress;
@property(nonatomic,weak) IBOutlet UITextField *phoneNumber;
@property(nonatomic,weak) IBOutlet UITextView *feedbackMessage;
-(IBAction)finishButtonClick:(id)sender;
@end
