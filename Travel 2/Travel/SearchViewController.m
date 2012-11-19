//
//  SearchViewController.m
//  Travel
//
//  Created by home auto on 12-8-19.
//  Copyright (c) 2012年 st. All rights reserved.
//

#import "SearchViewController.h"
#import "UserInfoCell.h"
#import "UserCell.h"
#import "SearchTravelCell.h"
#import "AppDelegate.h"
@interface SearchViewController ()

@end

@implementation SearchViewController
@synthesize lbTitle;
@synthesize tab;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    index=0;
}
 
- (void)viewDidUnload
{
    [self setLbTitle:nil];
    [self setTab:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 50;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (index==0) {
        return 63;
    }
    if (index==1) {
        return 75;
    }
    else {
        return 55;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (index==0) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UserCell" owner:self options:nil];
        UserCell*cell=nil;
        for (id obj in nib) {
            if ([obj isKindOfClass:[UserCell class]]) {
                cell = (UserCell *) obj;
            }
        }
        return cell;

    }
    if (index==1) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UserInfoCell" owner:self options:nil];
        UserInfoCell*cell=nil;
        for (id obj in nib) {
            if ([obj isKindOfClass:[UserInfoCell class]]) {
                cell = (UserInfoCell *) obj;
            }
        }
        return cell;

    }
    else {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SearchTravelCell" owner:self options:nil];
        SearchTravelCell*cell=nil;
        for (id obj in nib) {
            if ([obj isKindOfClass:[SearchTravelCell class]]) {
                cell = (SearchTravelCell *) obj;
            }
        }
        return cell;
        

    }
   }

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
} 


- (void)dealloc {
    [lbTitle release];
    [tab release];
    [super dealloc];
}

- (IBAction)onNav:(id)sender {
    if ([sender tag]==101) {
        [(AppDelegate *)[[UIApplication sharedApplication] delegate] onleft];
    }
    if ([sender tag]==102) {
        [(AppDelegate *)[[UIApplication sharedApplication] delegate] onright];
    }   
}

- (IBAction)onClick:(id)sender {
    index=[sender tag];
    [self.tab reloadData];
}
@end
