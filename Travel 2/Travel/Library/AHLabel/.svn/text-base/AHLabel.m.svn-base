//
//  AHLabel.m
//  AHLibrary
//
//  Created by 王俊 on 12-10-31.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AHLabel.h"
#import <CoreText/CoreText.h>
@implementation AHLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置一个可变数组
        resultAttributedString = [[NSMutableAttributedString alloc]init];
        resultArray=[[NSMutableArray alloc]init];
    }
    return self;
}

//设置lable的text 和样式 大小 颜色
-(void)setText:(NSString *)text WithFont:(UIFont *)font AndColor:(UIColor *)color{
    self.text = text;
    int len = [text length];
    NSMutableAttributedString *mutaString = [[NSMutableAttributedString alloc]initWithString:text];
    [mutaString addAttribute:(NSString *)(kCTForegroundColorAttributeName) value:(id)color.CGColor range:NSMakeRange(0, len)];
    CTFontRef ctFont2 = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize,NULL);
    [mutaString addAttribute:(NSString *)(kCTFontAttributeName) value:(__bridge id)ctFont2 range:NSMakeRange(0, len)];
    CFRelease(ctFont2);
    resultAttributedString = mutaString;
}

//设置一个字符串中 某个字符组成的数组的颜色样式的改变
-(void)setKeyWordTextArray:(NSArray *)keyWordArray WithFont:(UIFont *)font AndColor:(UIColor *)keyWordColor{
    NSMutableArray *rangeArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < [keyWordArray count]; i++) {
        NSString *keyString = [keyWordArray objectAtIndex:i];
        [resultArray removeAllObjects];
        [self getRangeListByString:self.text andkey:keyString];
        if (resultArray.count>0) {
            [rangeArray addObjectsFromArray:resultArray];
        }
    }
    [self setKeyWordRangeArray:rangeArray WithFont:font AndColor:keyWordColor];
}

//由外界去匹配key的位置 来设置字体样式
-(void)setKeyWordRangeArray:(NSArray*)keyRange WithFont:(UIFont *)font AndColor:(UIColor *)keyWordColor{
    for (NSValue *value in keyRange) {
        //改变字体样式的位置和长度
        NSRange keyRange = [value rangeValue];
        //改变字体颜色
        [resultAttributedString addAttribute:(NSString *)(kCTForegroundColorAttributeName) value:(id)keyWordColor.CGColor range:keyRange];
        //改变字体样式和大小
        CTFontRef ctFont1 = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize, NULL);
        [resultAttributedString addAttribute:(NSString *)(kCTFontAttributeName) value:(__bridge id)ctFont1 range:keyRange];
        CFRelease(ctFont1);
    }
}

//设置一个字符串中 某个字符串的颜色样式的改变
-(void)setKeyWordText:(NSString *)keyString WithFont:(UIFont *)font AndColor:(UIColor *)keyWordColor{
    NSRange keyRange = [self.text rangeOfString:keyString];
    //改变字体颜色
    [resultAttributedString addAttribute:(NSString *)(kCTForegroundColorAttributeName) value:(id)keyWordColor.CGColor range:keyRange];
    //改变字体样式和大小
    CTFontRef ctFont1 = CTFontCreateWithName((__bridge CFStringRef)font.fontName, font.pointSize, NULL);
    [resultAttributedString addAttribute:(NSString *)(kCTFontAttributeName) value:(__bridge id)ctFont1 range:keyRange];
    CFRelease(ctFont1);
}

//重绘
- (void)drawRect:(CGRect)rect
{
    if (self.text !=nil) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, 0.0, 0.0);
        CGContextScaleCTM(context, 1.0, -1.0);
        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge  CFAttributedStringRef)resultAttributedString);
        CGMutablePathRef pathRef = CGPathCreateMutable();
        CGPathAddRect(pathRef,NULL , CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height));
        CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), pathRef,NULL );
        CGContextTranslateCTM(context, 0, -self.bounds.size.height);
        CGContextSetTextPosition(context, 0, 0);
        CTFrameDraw(frame, context);
        CGContextRestoreGState(context);
        CGPathRelease(pathRef);
        CFRelease(framesetter);
        UIGraphicsPushContext(context);
    }
}

//递归调用该方法 找到key的多个位置
-(void)getRangeListByString:(NSString*)str andkey:(NSString*)key{
    NSRange range=[str rangeOfString:key];
    if (range.length>0) {
        NSValue *value = [NSValue valueWithRange:range];
        [resultArray addObject:value];
        NSMutableString*tempStr=[[NSMutableString alloc]init];
        for (int i=0; i<range.length; i++) {
            [tempStr appendString:@" "];
        }
        NSMutableString*string1=[[NSMutableString alloc]initWithString:str];
        [string1 replaceCharactersInRange:range withString:tempStr];
        [tempStr release];
        [self getRangeListByString:string1 andkey:key];
        [string1 release];
    }
}

- (void)dealloc
{
    [resultAttributedString release];
    [resultArray release];
    [super dealloc];
}
@end

