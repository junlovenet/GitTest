//
//  AttentionViewController.m
//  Travel
//
//  Created by home auto on 12-8-20.
//  Copyright (c) 2012年 st. All rights reserved.
//

#import "AttentionViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "AttentionCell.h"
@interface AttentionViewController ()

@end

@implementation AttentionViewController

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
- (IBAction)onBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"AttentionCell" owner:self options:nil];
    AttentionCell*cell=nil;
    for (id obj in nib) {
        if ([obj isKindOfClass:[AttentionCell class]]) {
            cell = (AttentionCell *) obj;
        }
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
} 


@end
