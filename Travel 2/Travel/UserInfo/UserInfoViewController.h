//
//  UserInfoViewController.h
//  Travel
//
//  Created by home auto on 12-8-19.
//  Copyright (c) 2012年 st. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UrlImageView.h"

@interface UserInfoViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (retain, nonatomic) IBOutlet UrlImageView *headImg;

@property (retain, nonatomic) IBOutlet UIView *btnView;
@property (retain, nonatomic) IBOutlet UIView *btnView1;
@property (retain, nonatomic) IBOutlet UIView *btnView2;
@property (retain, nonatomic) IBOutlet UIView *btnView3;
@property (retain, nonatomic) IBOutlet UIView *btnView4;

- (IBAction)onClick:(id)sender;

@property (retain, nonatomic) IBOutlet UrlImageView *coverImg;


- (IBAction)onNav:(id)sender;
@end
