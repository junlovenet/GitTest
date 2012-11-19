//
//  SettingsViewController.m
//  Travel
//
//  Created by 王颖 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"
#import "UserInfoViewController.h"
#import "SearchViewController.h"
#import "DDMenuController.h"
#import "AppDelegate.h"
#import "SetUpViewController.h"
#import "HomeViewController.h"
#import "OpinionViewController.h"
#import "PrivateLetterViewController.h"
@interface SettingsViewController ()

@end

@implementation SettingsViewController
- (void)viewDidLoad {
     self.navigationController.navigationBarHidden=YES;
    tableTitles = [NSArray arrayWithObjects:@"张三丰",@"主页",@"精选",@"设置",@"搜索",@"关于",@"意见反馈",@"私信",@"帮助",nil];
    [tableTitles retain];
    [super viewDidLoad];
}

- (void)viewDidUnload {
    [tableTitles release];
    tableTitles = nil;
    [super viewDidUnload];
}

- (void)dealloc {
    
    [tableTitles release];
    [super dealloc];
}

#pragma mark - Public

- (void)setVisible:(BOOL)visible {
    self.view.hidden = !visible;
}

#pragma mark - UITableView delegate

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // ...新增代码 触发中间界面显示新内容。
    DDMenuController *menuController = (DDMenuController*)((AppDelegate *)[[UIApplication sharedApplication] delegate]).menuController;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {
        UserInfoViewController *user=[[UserInfoViewController alloc]initWithNibName:@"UserInfoViewController" bundle:nil];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:user];
		[user release];
		[menuController setRootController:navController animated:YES];
    }
    if (indexPath.row==1) {
        HomeViewController*home=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:home];
		[home release];
		[menuController setRootController:navController animated:YES];
    }
    if (indexPath.row==3) {
        SetUpViewController*setUp=[[SetUpViewController alloc]initWithNibName:@"SetUpViewController" bundle:nil];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:setUp];
		[menuController setRootController:navController animated:YES];     
        [setUp release];
    }
    if (indexPath.row==4) {
        SearchViewController *user=[[SearchViewController alloc]initWithNibName:@"SearchViewController" bundle:nil];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:user];
		
		[menuController setRootController:navController animated:YES];     
        [user release];
    }
    if (indexPath.row==6) {
        OpinionViewController*opinion=[[OpinionViewController alloc]initWithNibName:@"OpinionViewController" bundle:nil];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:opinion];
		
		[menuController setRootController:navController animated:YES];     
        [opinion release];
    }
    if (indexPath.row==7) {
        PrivateLetterViewController*pri=[[PrivateLetterViewController alloc]initWithNibName:@"PrivateLetterViewController" bundle:nil];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:pri];
		
		[menuController setRootController:navController animated:YES];     
        [pri release];
    }

}

#pragma mark - UITableView datasource

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    return @"Ethan Gao";
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableTitles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"SettingsViewTableCell";
	UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
    if ([tableTitles count]>indexPath.row) {
        cell.textLabel.text = [tableTitles objectAtIndex:indexPath.row];
    }
	return cell;
}

@end
