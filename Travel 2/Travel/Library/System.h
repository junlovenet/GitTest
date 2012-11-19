//
//  System.h
//  Usedcar
//
//  Created by 南晓斌 on 11-7-10.
//  Copyright 2011 autohome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#include <netdb.h>

@interface System : NSObject <UIAlertViewDelegate>{

}

//判断是否联网
+ (BOOL) checkNetwork;


//在联网已经成功的情况下，判断是不是通过wifi链接的。
+ (BOOL) checkNetworConnectedByWifi;

//在联网已经成功的情况下，判断是不是通过wifi链接的。
+ (BOOL) checkNetworConnectedByGprs;

+ (BOOL) connectedToNetwork; 

+ (NSString *) getDocumentDirectory;

//gb2312编码
+(NSString *)EncodeGB2312Str:(NSString *)encodeStr;


+(NSString *)getStatisticsInfo;

+(NSURL *)appendUrl:(NSURL *)postUrl;

@end
