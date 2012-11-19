//
//  AHWebLabel.h
//  AHLibrarys
//
//  Created by 王俊 on 12-11-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
//对齐方式
typedef enum
{
	AHTextAlignmentRight = kCTRightTextAlignment,
	AHTextAlignmentLeft = kCTLeftTextAlignment,
	AHTextAlignmentCenter = kCTCenterTextAlignment,
	RTTextAlignmentJustify = kCTJustifiedTextAlignment
} AHTextAlignment;

typedef enum
{
	AHTextLineBreakModeWordWrapping = kCTLineBreakByWordWrapping,
	AHTextLineBreakModeCharWrapping = kCTLineBreakByCharWrapping,
	AHTextLineBreakModeClip = kCTLineBreakByClipping,
}AHTextLineBreakMode;

@protocol AHWebLabelDelegate <NSObject>

- (void)ahLabel:(id)ahLabel didSelectLinkWithURL:(NSURL*)url;

@end

@interface AHWebLabel : UIView {
	NSString *_text;
	UIFont *font;
	UIColor *textColor;
	AHTextAlignment _textAlignment;
	AHTextLineBreakMode _lineBreakMode;
	NSString *_plainText;
	NSMutableArray *_textComponents;
	CGSize _optimumSize;
	CGFloat _lineSpacing;
	int currentSelectedButtonComponentIndex;
	NSDictionary *linkAttributes;
    NSDictionary *selectedLinkAttributes;
	id<AHWebLabelDelegate> delegate;
	CTFrameRef frame;
    CFRange visibleRange;
    NSString *paragraphReplacement;
}

@property (nonatomic, retain) UIColor *textColor;
@property (nonatomic, retain) UIFont *font;
@property (nonatomic, retain) NSDictionary *linkAttributes;
@property (nonatomic, retain) NSDictionary *selectedLinkAttributes;
@property (nonatomic, assign) id<AHWebLabelDelegate> delegate;
@property (nonatomic, copy) NSString *paragraphReplacement;

- (NSString*)text;
- (void)setText:(NSString*)text;

- (void)setTextAlignment:(AHTextAlignment)textAlignment;
- (void)setLineBreakMode:(AHTextLineBreakMode)lineBreakMode;

- (CGSize)optimumSize;
- (void)setLineSpacing:(CGFloat)lineSpacing;
- (NSString*)visibleText;

@end
