//
//  System.m
//  Usedcar
//
//  Created by 南晓斌 on 11-7-10.
//  Copyright 2011 autohome. All rights reserved.
//

#import "System.h"


@implementation System
static int isChecked;

+ (void) alertView:(UIAlertView *)alertview
clickedButtonAtIndex:(NSInteger)buttonIndex{
    isChecked=1;
}

+ (BOOL) checkNetwork{
	if (![System connectedToNetwork]) {
        if(isChecked!=1){
		UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:@"系统信息" 
															 message:@"程序需要链接外部网络。请检查网络设置。" 
															delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil] autorelease];
		
		[alertView show];
        }
		return NO;
	}
	
	return YES;
}


+ (BOOL) checkNetworConnectedByWifi{ 
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);    
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) 
    {
        //printf("Error. Could not recover network reachability flags\n");
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    
    //'yes' means the network is connected by wifi. 

    
    bool isConnectedbyWifi = ( (flags & kSCNetworkReachabilityFlagsIsWWAN) ==0);
    return (isReachable && !needsConnection && isConnectedbyWifi) ? YES : NO;
} 


+ (BOOL) checkNetworConnectedByGprs{ 
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);    
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) 
    {
        //printf("Error. Could not recover network reachability flags\n");
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    
    //'yes' means the network is connected by wifi. 
    
    
    bool isConnectedbyWifi = ( (flags & kSCNetworkReachabilityFlagsIsWWAN) ==0);
    return (isReachable && !needsConnection && !isConnectedbyWifi) ? YES : NO;
} 


+ (BOOL) connectedToNetwork{ 
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    
    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);    
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    
    if (!didRetrieveFlags) 
    {
        //printf("Error. Could not recover network reachability flags\n");
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
} 

+ (NSString *) getDocumentDirectory{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+(NSString *)EncodeGB2312Str:(NSString *)encodeStr{
    
	CFStringRef nonAlphaNumValidChars = CFSTR("![        DISCUZ_CODE_1        ]’()*+,-./:;=?@_~");        
	NSString *preprocessedString = (NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault, (CFStringRef)encodeStr, CFSTR(""), kCFStringEncodingGB_18030_2000);        
	NSString *newStr = [(NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)preprocessedString,NULL,nonAlphaNumValidChars,kCFStringEncodingGB_18030_2000) autorelease];
	[preprocessedString release];
    return newStr;   
}

+(NSURL *)appendUrl:(NSURL *)postUrl
{
	NSString * strUrl=[NSString stringWithFormat:@"%@",postUrl];
	NSString * statisticInfo=[self EncodeGB2312Str:[self getStatisticsInfo]];
	if ([strUrl rangeOfString:@"?"].length>0) {
		strUrl=[NSString stringWithFormat:@"%@&sj=%@",strUrl,statisticInfo];
	}else {
		strUrl=[NSString stringWithFormat:@"%@?sj=%@",strUrl,statisticInfo];
	}
	postUrl=[NSURL URLWithString:strUrl];
	return postUrl;
}

+(NSString *)getStatisticsInfo
{
	NSString * jsonStatistics;
	NSInteger strPid=0;
	NSString * strPv=@"0";
	NSString * strDt=@"0";
	NSString * strDid=@"0";
	NSString * strPf=@"0";
	NSString * strSid=@"0";
	NSString * strSv=@"0";
	NSInteger  strRw=0;
	NSInteger  strRh=0;
	NSString * strNt=@"0";
	NSString * strIp=@"0";
	NSString * strSp=@"0";
	NSString * strLo=@"0";
	NSString * strLa=@"0";
	NSString * strP=@"0";
	NSString * strC=@"0";
    NSString * strUID=@"";
    NSString * strUN=@"";
	NSUserDefaults * userDefaults=[NSUserDefaults standardUserDefaults];
	if ([[userDefaults objectForKey:@"STATISTICS_PID"] length]>0) {
		strPid=[[userDefaults objectForKey:@"STATISTICS_PID"] intValue];
	}
	if ([[userDefaults objectForKey:@"STATISTICS_PV"] length]>0) {
		strPv=[userDefaults objectForKey:@"STATISTICS_PV"];
	}
	if ([[userDefaults objectForKey:@"STATISTICS_DT"] length]>0) {
		strDt=[userDefaults objectForKey:@"STATISTICS_DT"];
	}
	if ([[userDefaults objectForKey:@"STATISTICS_DID"] length]>0) {
		strDid=[userDefaults objectForKey:@"STATISTICS_DID"];
	}
	if ([[userDefaults objectForKey:@"STATISTICS_PF"] length]>0) {
		strPf=[userDefaults objectForKey:@"STATISTICS_PF"];
	}
	if ([[userDefaults objectForKey:@"STATISTICS_SID"] length]>0) {
		strSid=[userDefaults objectForKey:@"STATISTICS_SID"];
	}
	
	if ([[userDefaults objectForKey:@"STATISTICS_SV"] length]>0) {
		strSv=[userDefaults objectForKey:@"STATISTICS_SV"];
	}
	if ([[userDefaults objectForKey:@"STATISTICS_RW"] length]>0) {
		strRw=[[userDefaults objectForKey:@"STATISTICS_RW"] intValue];
	}
	if ([[userDefaults objectForKey:@"STATISTICS_RH"] length]>0) {
		strRh=[[userDefaults objectForKey:@"STATISTICS_RH"] intValue];
	}
	if ([[userDefaults objectForKey:@"STATISTICS_NT"] length]>0) {
		strNt=[userDefaults objectForKey:@"STATISTICS_NT"];
	}
    strIp=@"";
    /*
	if ([[userDefaults objectForKey:@"STATISTICS_IP"] length]>0) {
		strIp=[userDefaults objectForKey:@"STATISTICS_IP"];
		
	}
     */
		strSp=@"0";
	if ([[userDefaults objectForKey:@"STATISTICS_SP"] length]>0) {
		strSp=[userDefaults objectForKey:@"STATISTICS_SP"];
	}
	
	if ([[userDefaults objectForKey:@"STATISTICS_LO"] length]>0) {
		strLo=[userDefaults objectForKey:@"STATISTICS_LO"];
	}
	if ([[userDefaults objectForKey:@"STATISTICS_LA"] length]>0) {
		strLa=[userDefaults objectForKey:@"STATISTICS_LA"];
	}
	if ([[userDefaults objectForKey:@"STATISTICS_P"] length]>0) {
		strP=[userDefaults objectForKey:@"STATISTICS_P"];
	}
	if ([[userDefaults objectForKey:@"STATISTICS_C"] length]>0) {
		strC=[userDefaults objectForKey:@"STATISTICS_C"];
	}
    if ([[userDefaults objectForKey:@"STATISTICS_UID"] length]>0) {
		strUN=[userDefaults objectForKey:@"STATISTICS_UID"];
	}
    if ([[userDefaults objectForKey:@"STATISTICS_UN"] length]>0) {
		strUN=[userDefaults objectForKey:@"STATISTICS_UN"];
	}
	jsonStatistics=[NSString stringWithFormat:@"{\"PID\":%d,\"PV\":\"%@\",\"DT\":\"%@\",\"DID\":\"%@\",\"PF\":%@,\"SID\":%@,\"SV\":\"%@\",\"RW\":%d,\"RH\":%d,\"NT\":\"%@\",\"IP\":\"%@\",\"P\":\"%@\",\"C\":\"%@\",\"SP\":%@,\"LO\":%@,\"LA\":%@,\"UID\":\"%@\",\"UN\":\"%@\"}"
					,strPid
					,strPv
					,strDt
					,strDid
					,strPf
					,strSid
					,strSv
					,strRw
					,strRh
					,strNt
					,strIp
					,strP
					,strC
					,strSp
					,strLo
					,strLa
                    ,strUID
                    ,strUN];
	[userDefaults setObject:jsonStatistics forKey:@"STATISTICS_AllInfo"];
	return jsonStatistics;
}

@end
