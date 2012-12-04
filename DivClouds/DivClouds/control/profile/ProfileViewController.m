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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    int numberOfRows;
    if(section==0){
        numberOfRows=3;
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
    return 10;
    
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
    
    
    
    
    static NSString *CellIdentifier = @"tbl1";
    MyDataCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[MyDataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;

    }
    cell.userNameLabel.text=@"testtsdsfds";

    //cell.textLabel.text=@"helloworld";
    // Configure the cell...
    
    return cell;

    
    
    
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
//    }
//    //cell.textLabel.text=@"高级用户";
    
    
    
//    int isDynamicCell=0;
//    
//    if(indexPath.section==0){
//        isDynamicCell=1;
//    }
//    if (isDynamicCell==1) {
//        MyDataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell8"];
//        if (cell == nil)
//        {
//            cell = [[MyDataCell alloc] initWithStyle:UITableViewStyleGrouped reuseIdentifier:CellIdentifier] ;
//            cell.userNameLabelValue.text=@"1121212";
//        }else {
//            cell.userNameLabelValue.text=@"1121212";
//            cell.textLabel.text=@"111111";
//        }
//        
//        
//        return cell;
//        
//        
//    }else {
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell8"];
//        if (cell == nil)
//        {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewStyleGrouped reuseIdentifier:CellIdentifier] ;
//        }
//       // cell.textLabel.text=@"高级账户";
//        
//        return cell;
//    }
//    
//    return nil;
    
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
