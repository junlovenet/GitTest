//
//  ServiceBase.h
//  Autohome
//
//  Created by auto mobile on 12-4-6.
//  Copyright (c) 2012年 autohome. All rights reserved.
//
/*!
 @header ServiceBase
 @abstract 数据传输基类2
 @author 王俊
 @version 2.0.0 2012/7/2 Creation
 */

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import "ASIHTTPRequestDelegate.h"
#import "ASIFormDataRequest.h"
#import "Constants.h"
enum ServiceHandle
{
	
    Etest
};

@protocol ServiceDelegate <NSObject>

@optional
/*!
 @method
 @abstract 开始传输数据
 @discussion 开始传输数据
 @param aHandle ServiceHandle枚举
 @result 返回结果 nil
 */
-(void)serviceStarted:(enum ServiceHandle) aHandle;
/*!
 @method
 @abstract 完成传输数据
 @discussion 完成传输数据
 @param aHandle ServiceHandle枚举
 @result 返回结果 nil
 */
-(void)serviceFinished:(enum ServiceHandle) aHandle;
/*!
 @method
 @abstract 传输数据失败
 @discussion 传输数据失败
 @param aHandle ServiceHandle枚举
 @result 返回结果 nil
 */
-(void)serviceFailed:(enum ServiceHandle) aHandle;
@end
/*!
 @class
 @abstract 数据传输基类2
 */
@interface ServiceBase : NSObject <ASIHTTPRequestDelegate>
{
	ASIFormDataRequest* request;
	enum ServiceHandle handle;
	
	id<ServiceDelegate> delegate;
	bool Add2Cache;
	NSString *responseString;
	
	NSInteger successFlag;
	NSString *returnMessage;
}
@property(nonatomic, assign) bool Add2Cache;
@property(nonatomic, retain) NSString *responseString;
@property(nonatomic, retain)ASIFormDataRequest* request;
@property(nonatomic, readonly)enum ServiceHandle handle;
@property(nonatomic, assign)id<ServiceDelegate> delegate;

@property(nonatomic, assign) NSInteger successFlag;
@property(nonatomic, retain) NSString *returnMessage;

-(void) InitCommonParamsWithURL:(NSString*)APIUrl;
/*!
 @method
 @abstract 取消发送请求
 @discussion 取消发送请求
 @result 返回结果 nil
 */
-(void)cancelRequest;
/*!
 @method
 @abstract 发送get请求
 @discussion 发送get请求
 @param postUrl 数据地址
 @result 返回结果 nil
 */
-(void)getData:(NSURL*)postUrl;
/*!
 @method
 @abstract 解析json
 @discussion 解析json
 @param strJSON 返回的json数据
 @result 返回结果 nil
 */
-(BOOL)parseJSON:(NSString*)strJSON;
/*!
 @method
 @abstract 发送post请求
 @discussion 发送post请求
 @param postUrl post数据地址
 @param dic 发送的字典数据
 @param imageArray 图片数组
 @result 返回结果 nil
 */
-(void)sendPost:(NSURL*)postUrl Dictinary:(NSMutableDictionary*)dic ImageArray: (NSMutableArray *)imageArray;
@end
