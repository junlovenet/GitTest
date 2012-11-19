//
//  RegionViewController.m
//  Travel
//
//  Created by 王颖 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RegionViewController.h"
#import "SearchViewController.h"
#import "DDMenuController.h"
#import "AppDelegate.h"
#import "SearchTravelCell.h"
#import "HomeViewController.h"
@interface RegionViewController ()

@end

@implementation RegionViewController
@synthesize tab;
- (void)viewDidLoad {
    self.navigationController.navigationBarHidden=YES;
    tableTitles = [NSArray arrayWithObjects:@"周围",@"北京",@"上海",nil];
    [tableTitles retain];
    state=0;
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [tableTitles release];
    tableTitles = nil;
    [self setTab:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [tableTitles release];
    [tab release];
    [super dealloc];
}

#pragma mark - Public

- (void)setVisible:(BOOL)visible {
    self.view.hidden = !visible;
}

- (IBAction)onClick:(id)sender {
    if ([sender tag]==1) {
  
        state=0;
    }
    else{
    
        state=1;
    }
    [tab reloadData];
}

#pragma mark - UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (state==0) {
        return tableTitles.count;
    }
    if (state==1) {
        return 10;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (state==0) {
        return 40;
    }
    return 75;
}
// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // ...
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //新增测试代码 右边改变中间界面内容
    DDMenuController *menuController = (DDMenuController*)((AppDelegate *)[[UIApplication sharedApplication] delegate]).menuController;
    HomeViewController *user=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:user];
    
    [menuController setRootController:navController animated:YES];     
    [user release];
}

#pragma mark - UITableView datasource

 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (state==0) {
        static NSString *CellIdentifier = @"RegionViewTableCell";
        UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        if ([tableTitles count]>indexPath.row) {
            cell.textLabel.text = [NSString stringWithFormat:@"       %@",[tableTitles objectAtIndex:indexPath.row]];
        }
        
        return cell;
    }
    else{
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

@end
