//
//  SetUpViewController.m
//  Travel
//
//  Created by 王颖 on 12-10-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SetUpViewController.h"
#import "UserManagerViewController.h"
#import "AppDelegate.h"
@implementation SetUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden=YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

 
- (IBAction)onUser:(id)sender {
    UserManagerViewController*user=[[UserManagerViewController alloc]initWithNibName:@"UserManagerViewController" bundle:nil];
    [self.navigationController pushViewController:user animated:YES];
    [user release];
}

- (IBAction)onNav:(id)sender {
    if ([sender tag]==101) {
        [(AppDelegate *)[[UIApplication sharedApplication] delegate] onleft];
    }
    if ([sender tag]==102) {
        [(AppDelegate *)[[UIApplication sharedApplication] delegate] onright];
    }   

}
@end
