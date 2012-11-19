//
//  AppDelegate.h
//  Travel
//
//  Created by 王颖 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"
#import "RegionViewController.h"
#import "HomeViewController.h"
@class ViewController;
@class DDMenuController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

{

    UINavigationController *navigationController;
}

@property (retain, nonatomic) DDMenuController *menuController;
@property (retain, nonatomic) HomeViewController *viewController;
-(void)onleft;
-(void)onright;
@end
