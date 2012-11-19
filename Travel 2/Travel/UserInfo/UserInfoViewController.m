//
//  UserInfoViewController.m
//  Travel
//
//  Created by home auto on 12-8-19.
//  Copyright (c) 2012年 st. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoCell.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "AttentionViewController.h"
#import "TripViewController.h"
#import "CollectionViewController.h"
#import "FansViewController.h"
#import "ReplyViewController.h"
@interface UserInfoViewController ()

@end

@implementation UserInfoViewController
@synthesize headImg;
@synthesize btnView;
@synthesize btnView1;
@synthesize btnView2;
@synthesize btnView3;
@synthesize btnView4;
@synthesize coverImg;

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
    self.btnView.layer.masksToBounds=YES;      
    self.btnView.layer.borderWidth=1;      
    self.btnView.layer.borderColor=[[UIColor grayColor] CGColor];    
    
    self.btnView1.layer.masksToBounds=YES;      
    self.btnView1.layer.borderWidth=1;      
    self.btnView1.layer.borderColor=[[UIColor grayColor] CGColor];  
    
    self.btnView2.layer.masksToBounds=YES;      
    self.btnView2.layer.borderWidth=1;      
    self.btnView2.layer.borderColor=[[UIColor grayColor] CGColor];  
    
    self.btnView3.layer.masksToBounds=YES;      
    self.btnView3.layer.borderWidth=1;      
    self.btnView3.layer.borderColor=[[UIColor grayColor] CGColor];  
    
    self.btnView4.layer.masksToBounds=YES;      
    self.btnView4.layer.borderWidth=1;      
    self.btnView4.layer.borderColor=[[UIColor grayColor] CGColor];  

    self.headImg.layer.masksToBounds=YES;      
    self.headImg.layer.borderWidth=5;      
    self.headImg.layer.borderColor=[[UIColor whiteColor] CGColor];  
    self.navigationController.navigationBarHidden=YES;
}

-(void)viewDidAppear:(BOOL)animated{
    
    
}
- (void)viewDidUnload
{
    [self setCoverImg:nil];
    [self setHeadImg:nil];
    [self setBtnView:nil];
    [self setBtnView1:nil];
    [self setBtnView2:nil];
    [self setBtnView3:nil];
    [self setBtnView4:nil];
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

    return 75;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UserInfoCell" owner:self options:nil];
    UserInfoCell*cell=nil;
    for (id obj in nib) {
        if ([obj isKindOfClass:[UserInfoCell class]]) {
            cell = (UserInfoCell *) obj;
        }
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
} 
- (void)dealloc {
    [coverImg release];
    [headImg release];
    [btnView release];
    [btnView1 release];
    [btnView2 release];
    [btnView3 release];
    [btnView4 release];
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
    if ([sender tag]==0) {
        TripViewController *user=[[TripViewController alloc]initWithNibName:@"TripViewController" bundle:nil];
        [self.navigationController pushViewController:user animated:YES];
        [user release];
    }
    if ([sender tag]==1) {
        AttentionViewController *user=[[AttentionViewController alloc]initWithNibName:@"AttentionViewController" bundle:nil];
        [self.navigationController pushViewController:user animated:YES];
        [user release];
    }
    if ([sender tag]==2) {
        FansViewController *user=[[FansViewController alloc]initWithNibName:@"FansViewController" bundle:nil];
        [self.navigationController pushViewController:user animated:YES];
        [user release];
    }
    if ([sender tag]==3) {
        CollectionViewController *user=[[CollectionViewController alloc]initWithNibName:@"CollectionViewController" bundle:nil];
        [self.navigationController pushViewController:user animated:YES];
        [user release];
    }
    if ([sender tag]==5) {
        ReplyViewController*reply=[[ReplyViewController alloc] initWithNibName:@"ReplyViewController" bundle:nil];
        [self.navigationController pushViewController:reply animated:YES];
        reply.type=0;
        [reply release];
    }
    if ([sender tag]==6) {
        ReplyViewController*reply=[[ReplyViewController alloc] initWithNibName:@"ReplyViewController" bundle:nil];
        [self.navigationController pushViewController:reply animated:YES];
        reply.type=1;
        [reply release];
    }   
}
@end
