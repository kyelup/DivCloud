//
//  MyDataCell.h
//  DivClouds
//
//  Created by LI Haiyun on 11/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyDataCell : UITableViewCell
@property(nonatomic,weak) IBOutlet UILabel *userNameLabel;
@property(nonatomic,weak) IBOutlet UILabel *myLevelLabel;
@property(nonatomic,weak) IBOutlet UILabel *userNameLabelValue;
@property(nonatomic,weak) IBOutlet UILabel *myLevelLabelValue;

@end
