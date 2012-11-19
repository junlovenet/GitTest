//
//  AHLabel.h
//  AHLibrary
//
//  Created by 王俊 on 12-10-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AHLabel : UILabel
{
    NSMutableAttributedString *resultAttributedString;
    NSMutableArray* resultArray;
}

-(void)setKeyWordTextArray:(NSArray *)keyWordArray WithFont:(UIFont *)font AndColor:(UIColor *)keyWordColor;
-(void)setText:(NSString *)text WithFont:(UIFont *)font AndColor:(UIColor *)color;
-(void)setKeyWordText:(NSString *)keyString WithFont:(UIFont *)font AndColor:(UIColor *)keyWordColor;
-(void)getRangeListByString:(NSString*)str andkey:(NSString*)key;
-(void)setKeyWordRangeArray:(NSArray*)keyRange WithFont:(UIFont *)font AndColor:(UIColor *)keyWordColor;
@end
