//
//  RegionViewController.h
//  Travel
//
//  Created by 王颖 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegionViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    NSArray *tableTitles;
    NSInteger state;
}
@property (retain, nonatomic) IBOutlet UITableView *tab;

- (void)setVisible:(BOOL)visible;
- (IBAction)onClick:(id)sender;

@end
