//
//  Constants.h
//  Club
////
//  Created by haoxu on 11-11-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#ifndef Club_Constants_h
#define Club_Constants_h
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define API_DOMAIN (@"http://sp.autohome.com.cn/")


#define NO_NETWORK (@"汽车之家论坛需要链接网络才可使用，请按home键退出程序并设置您的网络链接")
#define NETWORK_BAD (@"你的网络好像有点问题，请重试")

#endif
