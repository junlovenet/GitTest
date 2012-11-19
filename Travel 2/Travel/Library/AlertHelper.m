//
//  AlertHelper.m
//  Librarys
//
//  Created by auto mobile on 12-3-1.
//  Copyright (c) 2012年 autohome. All rights reserved.
//

#import "AlertHelper.h"

@implementation AlertHelper

+(void)showMessage:(NSString *)msg title:(NSString*)tit cancelBtn:(NSString*)cancle target:(id)sender{
    if ((tit == nil) || (tit.length == 0)) {
        tit = @"温馨提示";
    }
    if ((cancle == nil) || (cancle.length == 0)) {
        cancle = @"知道了";
    }
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle: tit
                                                    message:msg 
                                                   delegate:sender 
                                          cancelButtonTitle: cancle
                                          otherButtonTitles:nil];
	[alert show];
	[alert release];
}

@end
