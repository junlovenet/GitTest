//
//  FootprintViewController.m
//  Travel
//
//  Created by home auto on 12-8-20.
//  Copyright (c) 2012年 st. All rights reserved.
//

#import "FootprintViewController.h"
#import "AddFootprintViewController.h"
@interface FootprintViewController ()

@end

@implementation FootprintViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}
- (IBAction)onAdd:(id)sender {
    AddFootprintViewController *user=[[AddFootprintViewController alloc]initWithNibName:@"AddFootprintViewController" bundle:nil];
    [self.navigationController pushViewController:user animated:YES];
    [user release];
}

- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
