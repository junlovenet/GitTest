//
//  AddTravelViewController.m
//  Travel
//
//  Created by home auto on 12-8-20.
//  Copyright (c) 2012年 st. All rights reserved.
//

#import "AddTravelViewController.h"
#import "AppDelegate.h"
#import "FootprintViewController.h"
@interface AddTravelViewController ()

@end

@implementation AddTravelViewController
 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;

}
-(void)viewDidAppear:(BOOL)animated{
    
   
}
- (void)viewDidUnload
{
     [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)onAdd:(id)sender {
    FootprintViewController *user=[[FootprintViewController alloc]initWithNibName:@"FootprintViewController" bundle:nil];
    [self.navigationController pushViewController:user animated:YES];
    [user release];
}
- (void)dealloc {
     [super dealloc];
}
@end
