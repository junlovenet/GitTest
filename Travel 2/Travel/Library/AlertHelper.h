//
//  AlertHelper.h
//  Librarys
//
//  Created by auto mobile on 12-3-1.
//  Copyright (c) 2012年 autohome. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlertHelper : NSObject

+(void)showMessage:(NSString *)msg title:(NSString*)tit cancelBtn:(NSString*)cancle target:(id)sender;

@end
