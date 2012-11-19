//
//  SearchViewController.h
//  Travel
//
//  Created by home auto on 12-8-19.
//  Copyright (c) 2012年 st. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    
    NSInteger index;   
}
@property (retain, nonatomic) IBOutlet UILabel *lbTitle;
@property (retain, nonatomic) IBOutlet UITableView *tab;
- (IBAction)onNav:(id)sender;

- (IBAction)onClick:(id)sender;
@end
