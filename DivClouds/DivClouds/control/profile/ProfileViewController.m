//
//  ProfileViewController.m
//  DivClouds
//
//  Created by LI Haiyun on 11/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfileViewController.h"
#import "CustomNavigationBar.h"
#import "MyDataCell.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CustomNavigationBar* customNavigationBar = (CustomNavigationBar*)self.navigationController.navigationBar;    
    // Set the nav bar's background
    [customNavigationBar setBackgroundWith:[UIImage imageNamed:@"bg_blue_linebottom.png"]];
    
    UIImage *backImg=[UIImage imageNamed:@"btn_title_small.png"];
    [self.navigationItem.leftBarButtonItem setBackgroundImage:backImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];

}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    int numberOfRows;
    if(section==0){
        numberOfRows=2;
    }else if(section==1){
        numberOfRows=1;
    }else if(section==2){
        numberOfRows=2;
    }else if(section==3){
        numberOfRows=4;
    }else if(section==4){
        numberOfRows=1;
    }
    else if(section==5){
        numberOfRows=4;
    }
    return numberOfRows;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    NSString *rowIDStr = [NSString stringWithFormat:@"%d", indexPath.row]; 
//    
//    
//    NSLog(@"-----------rowIDStr%@",rowIDStr);
//    NSString *CellIdentifier = [@"Cell" stringByAppendingFormat:rowIDStr];
//    NSLog(@"-----------CellIdentifier%@",CellIdentifier);
//    
//    
//    MyDataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyDataCell"];
//    cell.userNameLabel.text=@"test";
//    return cell;
    
    
    int numberOfRows;
    if(indexPath.section==0){
        numberOfRows=0;
    }else if(indexPath.section==1){
        numberOfRows=2;
    }else if(indexPath.section==2){
        numberOfRows=3;
    }else if(indexPath.section==3){
        numberOfRows=5;
    }else if(indexPath.section==4){
        numberOfRows=9;
    }
    else if(indexPath.section==5){
        numberOfRows=10;
    }

    int temp =numberOfRows+indexPath.row;
    NSLog(@"--------tempID$%i",indexPath.row);
    

    
    NSString *tempStr=[[NSNumber numberWithInt:temp] stringValue];  

     NSString *CellIdentifier = [@"Cell" stringByAppendingString:tempStr];
    NSLog(@"--------------cellidentifier%@",CellIdentifier);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;

    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    
    if (temp==0) {
        cell.textLabel.text=@"用户名:";
    }else if(temp==1){
         cell.textLabel.text=@"等级:";
    }else if(temp==2){
         cell.textLabel.text=@"密码修改";
    }else if(temp==3){
         cell.textLabel.text=@"现金账户";
    }else if(temp==4){
         cell.textLabel.text=@"游票";
    }else if(temp==5){
         cell.textLabel.text=@"机票订单";
    }else if(temp==6){
         cell.textLabel.text=@"酒店订单";
    }else if(temp==7){
         cell.textLabel.text=@"当地游订单";
    }else if(temp==8){
         cell.textLabel.text=@"高铁订单";
    }else if(temp==9){
         cell.textLabel.text=@"当地游产品购物车";
    }else if(temp==10){
         cell.textLabel.text=@"常住酒店";
    }else if(temp==11){
         cell.textLabel.text=@"常用联系人";
    }else if(temp==12){
         cell.textLabel.text=@"常用旅客信息";
    }else if(temp==13){
         cell.textLabel.text=@"常用地址";
    }
  
    //cell.textLabel.text=@"helloworld";
    // Configure the cell...
    
    return cell;
    

}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}



@end
