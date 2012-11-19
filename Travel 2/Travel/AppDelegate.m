//
//  AppDelegate.m
//  Travel
//
//  Created by 王颖 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "DDMenuController.h"

@implementation AppDelegate
@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize menuController = _menuController;
- (void)dealloc
{
    [_viewController release];
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];   
	// Override point for customization after application launch.
	
    self.viewController =   [[[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil] autorelease];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    
    DDMenuController *rootController = [[DDMenuController alloc] initWithRootViewController:navController];
  
    _menuController = rootController;
    
    SettingsViewController *leftController = [[SettingsViewController alloc] init];
    rootController.leftViewController = leftController;
	
	//添加右边的
    RegionViewController *rightController = [[RegionViewController alloc] init];
    rootController.rightViewController = rightController;
    
    self.window.rootViewController = rootController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	
    return YES;
    
    return YES;

}
-(void)onleft{
    [_menuController showLeftController:YES];
}
-(void)onright{

    [_menuController showRightController:YES];
}
- (void)makeHomeViewVIsble{
//    self.navController.view.hidden=!self.navController.view.hidden;
}
//- (void)makeLeftViewVisible {
//   self.leftViewController.view.hidden=NO;
//    self.rightViewController.view.hidden=YES;
//}
//
//- (void)makeRightViewVisible {
//    self.rightViewController.view.hidden=NO;
//   self.leftViewController.view.hidden=YES;
//}

@end
