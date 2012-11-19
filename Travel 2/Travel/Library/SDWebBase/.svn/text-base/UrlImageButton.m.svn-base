//
//  UrlImageButton.m
//  test image
//
//  Created by Xuyan Yang on 8/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UrlImageButton.h"
#import "SDWebImageManager.h"
#import "NSURLAdditions.h"
#import <QuartzCore/QuartzCore.h>
@implementation UrlImageButton

@synthesize iconIndex;


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
		iconIndex = -1;

		isScale = NO;
	}
    return self;
}

- (void)dealloc {

	[super dealloc];
}


- (void)setImage:(BOOL)animated withUrl:(NSString *)iconUrl withIsBkg:(BOOL)isBkg
{       
	_animated = animated;
	_isBackgroundImage = isBkg;
	
	if(isBkg)
	{
		[self setBackgroundImage:[self getDefaultImage] forState:UIControlStateNormal];
	}
	else {
		[self setImage:[self getDefaultImage] forState:UIControlStateNormal];
	}

	NSURL* tempUrl = [NSURL URLWithString:iconUrl];
	
	NSURL* finallyUrl = nil;
	if([NSURL isWebURL:tempUrl])
	{
		finallyUrl = tempUrl;
	}
	else {
		//SingletonState* mySingle = [SingletonState sharedStateInstance];
		//finallyUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", mySingle.letaoConstants.imageHostName, iconUrl]];
		finallyUrl = tempUrl;
	}
	
	[self setImageWithURL:finallyUrl];
}	

- (void) setBackgroundImageFromUrl:(BOOL)animated withUrl:(NSString *)iconUrl
{       
	[self setImage:animated withUrl:iconUrl withIsBkg:YES];
}	

- (void) setImageFromUrl:(BOOL) animated withUrl:(NSString *)iconUrl
{       
	
	[self setImage:animated withUrl:iconUrl withIsBkg:NO];
}	

	
- (void)setImageWithURL:(NSURL *)url
{
	[self setImageWithURL:url placeholderImage:nil];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
	SDWebImageManager *manager = [SDWebImageManager sharedManager];
	
    // Remove in progress downloader from queue
    [manager cancelForDelegate:self];
	
 //   [self setImage:placeholder forState:UIControlStateNormal];
	
    if (url)
    {
        [manager downloadWithURL:url delegate:self];
    }
}

- (void)cancelCurrentImageLoad
{
	[[SDWebImageManager sharedManager] cancelForDelegate:self];
}

-(UIImage*) getDefaultImage
{
	CGSize frameSize = self.frame.size;
	if(frameSize.width ==96&&frameSize.height==63)
	{
		return [UIImage  imageNamed:@"96-63.png"];
	}
	else if(frameSize.width ==100&&frameSize.height==66){
		return [UIImage  imageNamed:@"100-66.png"];
	}
	else if(frameSize.width ==320&&frameSize.height==44){
		return [UIImage  imageNamed:@"320X44.png"];
	}
	else if(frameSize.width ==320&&frameSize.height==160){
		return [UIImage  imageNamed:@"focusimgBg.png"];
	}
	else if(frameSize.width ==94&&frameSize.height==70){
		return [UIImage  imageNamed:@"pinpai.png"];
	}else if(frameSize.width ==290&&frameSize.height==224){
		return [UIImage  imageNamed:@"bigBottomBg.png"];
	}
	else if(frameSize.width ==89&&frameSize.height==68){
		return [UIImage  imageNamed:@"thumnailBg.png"];
	}
    else if(frameSize.width ==92&&frameSize.height==74){
		return [UIImage  imageNamed:@"thumnailBg.png"];
	}
	return nil;

}



#pragma mark -

- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image
{
	if(_animated)
	{
		/*
	    [UIView beginAnimations:nil context:nil];
	    [UIView setAnimationDuration:0.5];
	    //[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self cache:YES];
		[UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self cache:YES];
	*/
	}
	
	if(_isBackgroundImage)
	{
	    [self setBackgroundImage:image forState:UIControlStateNormal];
	}
	else {
		[self setImage:image forState:UIControlStateNormal];
	}

	if(_animated)
	{
		//[UIView commitAnimations];
		CATransition *animation = [CATransition animation];
		[animation setDuration:0.9f];   
		[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
		[animation setType:kCATransitionFade];
		[animation setSubtype: kCATransitionFromBottom];
		[self.layer addAnimation:animation forKey:@"Reveal"];
	}
}

@end
