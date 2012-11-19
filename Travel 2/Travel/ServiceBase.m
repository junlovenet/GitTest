//
//  ServiceBase.m
//  Autohome
//
//  Created by auto mobile on 12-4-6.
//  Copyright (c) 2012年 autohome. All rights reserved.
//

#import "ServiceBase.h"
#import "ASIFormDataRequest.h"
#import "Reachability.h"
#import "JSON.h"
#import "System.h"
#import "AlertHelper.h"
#import "Constants.h"

@implementation ServiceBase
@synthesize request;
@synthesize handle;
@synthesize delegate;
@synthesize responseString;
@synthesize Add2Cache;
@synthesize successFlag;
@synthesize returnMessage;
-(id)init
{
	if(self = [super init])
	{
		return self;
	}
	else {
		return nil;
	}
}
-(BOOL)parseJSON:(NSString*)strJSON{
	
    return NO;
}
-(void)parseHeader:(NSString*)strJSON
{
    NSDictionary * dic=[strJSON JSONValue];
	self.successFlag = [[dic valueForKey:@"success"] intValue];
	self.returnMessage = [dic valueForKey:@"message"];
}
#pragma mark ASIHTTPRequestDelegate
- (void)requestStarted:(ASIHTTPRequest *)aRequest
{
	if(delegate && [delegate respondsToSelector:@selector(serviceStarted:)])
	{
		[delegate serviceStarted:handle];
	}
}

- (void)requestFinished:(ASIHTTPRequest *)aRequest
{
    self.responseString = [aRequest responseString];
	[self parseHeader:self.responseString];
  
	if(responseString && self.successFlag && [self parseJSON:self.responseString])
	{
		if(delegate && [delegate respondsToSelector:@selector(serviceFinished:)])
		{
			[delegate serviceFinished:handle];
		}
	}else
    {
        if(delegate && [delegate respondsToSelector:@selector(serviceFailed:)])
        {
            [delegate serviceFailed:handle];
        }
    }
    //   [self.responseString release];
}

- (void)requestFailed:(ASIHTTPRequest *)aRequest
{
	if(delegate && [delegate respondsToSelector:@selector(serviceFailed:)])
	{
		[delegate serviceFailed:handle];
	}
	
	NSError* error = [aRequest error];
	if([error code] == ASIConnectionFailureErrorType)
	{
        [AlertHelper showMessage:NETWORK_BAD title:nil cancelBtn:nil target:self];
	}
	else if([error code] == ASIRequestTimedOutErrorType)
	{
		[AlertHelper showMessage:NETWORK_BAD title:nil cancelBtn:nil target:self];
	}
}

-(void) setRequest:(ASIFormDataRequest *)aRequest
{
	[request clearDelegatesAndCancel];
	[request release];
	request = aRequest;
	[aRequest retain];
}
-(void)cancelRequest{
	[request cancel];
}
-(void) InitCommonParamsWithURL:(NSString*)APIUrl
{
	NSURL* postUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",@"", APIUrl]];
	//self.request = [ASIFormDataRequest requestWithURL:postUrl];
    if (request != nil)
    {
        [request clearDelegatesAndCancel];
        [request release];
    }
    request=[[ASIFormDataRequest alloc]initWithURL:postUrl];
	[ASIFormDataRequest setShouldUpdateNetworkActivityIndicator:NO];
}

-(void)getData:(NSURL*)postUrl
{
//	if (![System connectedToNetwork]) 
//	{
//		return;
//	}
	postUrl=[System appendUrl:postUrl];
	//request = [ASIFormDataRequest requestWithURL:postUrl];
    if (request != nil)
    {
        [request clearDelegatesAndCancel];
        [request release];
    }
    request=[[ASIFormDataRequest alloc]initWithURL:postUrl];
	[ASIFormDataRequest setShouldUpdateNetworkActivityIndicator:NO];
	[request setDelegate:self];
	[request setRequestMethod:@"GET"];
    [request startAsynchronous];
}

-(void)sendPost:(NSURL*)postUrl Dictinary:(NSMutableDictionary*)dic ImageArray: (NSMutableArray *)imageArray {
	if (![System connectedToNetwork]) 
	{
		[AlertHelper showMessage:NETWORK_BAD title:nil cancelBtn:nil target:self];
		return;
	}	
	postUrl=[System appendUrl:postUrl];
    if (request != nil)
    {
        [request clearDelegatesAndCancel];
        [request release];
    }
    request=[[ASIFormDataRequest alloc]initWithURL:postUrl];
	//request = [ASIFormDataRequest requestWithURL:postUrl];
	[ASIFormDataRequest setShouldUpdateNetworkActivityIndicator:NO];
	[request setDelegate:self];
    
	for (NSString *key in [dic allKeys]) {
		[request addPostValue:[dic objectForKey:key] forKey:key];
		//[request ob
	}
	//NSMutableArray *temparray = [[[NSMutableArray alloc] init] autorelease];
	//temparray = imageArray;
	if ([imageArray count]>0) {
		int i=1;
		for (UIImage * img in imageArray) {
			NSData *imageData =UIImageJPEGRepresentation(img, 100);
			[request addData:imageData withFileName:[NSString stringWithFormat:@"image%d",i] andContentType:@"image/jpeg" forKey:[NSString stringWithFormat:@"image%d",i]];
			i=i+1;
		}
	}
	
	[request setRequestMethod:@"POST"];
	[request startAsynchronous];
    //	[temparray release];
}

-(void)dealloc
{
    [request clearDelegatesAndCancel];
    [request release];
	[responseString release];
	[returnMessage release];
	[super dealloc];
}
@end






