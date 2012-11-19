//
//  SettingsViewController.h
//  Travel
//
//  Created by 王颖 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    NSArray *tableTitles;
}

- (void)setVisible:(BOOL)visible;

@end
