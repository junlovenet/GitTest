//
//  ReplyViewController.h
//  Travel
//
//  Created by 王颖 on 12-10-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReplyViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *lbTitle;
- (IBAction)onBack:(id)sender;
@property(nonatomic)NSInteger type;
@end
