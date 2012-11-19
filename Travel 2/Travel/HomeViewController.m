//
//  HomeViewController.m
//  Travel
//
//  Created by 王颖 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "AddTravelViewController.h"
#import "UrlImageButton.h"
#define kTriggerOffSet 100.0f

/////////////////////////////////////
@interface HomeViewController () 
@end
NSUInteger kNumberOfPages = 0;
/////////////////////////////////////
@implementation HomeViewController
@synthesize scroImg;
- (void)viewDidLoad {
    [super viewDidLoad];
     viewControllers=[[NSMutableArray alloc]init];
	_nCount = 1;
	flowView = [[LLWaterFlowView alloc] initWithFrame:CGRectMake(0, 44, 320, 436)];
	flowView.flowdelegate = self;
	flowView.backgroundColor = [UIColor blackColor];
	[self.view addSubview:flowView];	
//	[flowView setContentOffset:CGPointMake(0, 300)];
	UIButton*addBtn=[UIButton buttonWithType:UIButtonTypeContactAdd];
    addBtn.frame=CGRectMake(self.view.center.x, self.view.frame.size.height-150, 30, 30);
    [addBtn addTarget:self action:@selector(onAdd) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:addBtn];
    [self.navigationController.navigationBar setHidden:YES];
//    [self loadNav];
    headView=[[UIView alloc]initWithFrame:CGRectMake(0,0, 320, 130)];
    headView.tag=603;
    scroImg = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0, 320, 130)];
    
    self.scroImg.showsHorizontalScrollIndicator = NO;
    self.scroImg.showsVerticalScrollIndicator = NO;
    self.scroImg.scrollsToTop = NO;
    self.scroImg.delegate = self;
    [self.scroImg setBackgroundColor:[UIColor clearColor]];
    self.scroImg.pagingEnabled = YES;
    [headView addSubview:self.scroImg];
    
    pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    pageControl.center=CGPointMake(headView.center.x, 120);
    pageControl.currentPage = 0;
    [headView addSubview:pageControl];
    [flowView addSubview:headView];
    
    [viewControllers removeAllObjects];
    kNumberOfPages=3;
    for (unsigned i = 0; i < kNumberOfPages; i++)
    {
        [viewControllers addObject:[NSNull null]];
    }
    scroImg.contentSize = CGSizeMake(scroImg.frame.size.width * kNumberOfPages, scroImg.frame.size.height);
    pageControl.numberOfPages = 3;
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];

    
}
- (void)dealloc
{
    [pageControl release];
    [headView release];
    [scroImg release];
    [super dealloc];
}
//-(void)loadNav{
//    UINavigationBar *navBar = self.navigationController.navigationBar;
//    
//#define kSCNavBarImageTag 10
//    if ([navBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
//    { 
//        //if iOS 5.0 and later 
//        [navBar setBackgroundImage:[UIImage imageNamed:@"top.png"] forBarMetrics:UIBarMetricsDefault];
//    } 
//    else 
//    { 
//        UIImageView *imageView = (UIImageView *)[navBar viewWithTag:kSCNavBarImageTag];
//        if (imageView == nil) 
//        { 
//            imageView = [[UIImageView alloc] initWithImage: 
//                         [UIImage imageNamed:@"top.png"]];
//            [imageView setTag:kSCNavBarImageTag]; 
//            [navBar insertSubview:imageView atIndex:0];
//            [imageView release]; 
//        } 
//    } 
//
//}
-(void)onAdd{

    AddTravelViewController *user=[[AddTravelViewController alloc]initWithNibName:@"AddTravelViewController" bundle:nil];
    [self.navigationController pushViewController:user animated:YES];
    [user release];
}
- (void)press
{
	
	_nCount++;
	
	[flowView reloadData];
}

- (NSUInteger)numberOfColumnsInFlowView:(LLWaterFlowView *)flowView
{
	return 3;
}
- (NSInteger)flowView:(LLWaterFlowView *)flowView numberOfRowsInColumn:(NSInteger)column
{
	return  _nCount * 20;;
}
- (LLWaterFlowCell *)flowView:(LLWaterFlowView *)flowView_ cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"CellTag_Airport_weather";
	LLWaterFlowCell *cell = [flowView_ dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if(cell == nil)
	{
		cell  = [[[LLWaterFlowCell alloc] initWithIdentifier:CellIdentifier] autorelease];
		
		UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectZero];
		[cell addSubview:iv];
		iv.layer.borderColor = [[UIColor whiteColor] CGColor];
		iv.layer.borderWidth = 4;
		[iv release];
		iv.tag = 101;
		
		UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
		label.backgroundColor = [UIColor clearColor];
		[cell addSubview:label];
		label.textAlignment = UITextAlignmentCenter;
		label.font = [UIFont boldSystemFontOfSize:15];
		label.shadowOffset = CGSizeMake(0, 1);
		label.shadowColor = [UIColor redColor];
		label.textColor = [UIColor whiteColor];
		[label release];
		label.tag = 102;
	}
	
	else 
	{
		NSLog(@"此条是从重用列表中获取的。。。。。");
	}
    
	
	float hei = [self flowView:nil heightForRowAtIndexPath:indexPath];
	
	UIImageView *iv  = (UIImageView *)[cell viewWithTag:101];
	iv.frame = CGRectMake(5, 5, 100, hei - 10);
	iv.image = [UIImage imageNamed:[NSString stringWithFormat:@"img%d.png", (indexPath.row + indexPath.section + 1)  % 7 + 1]];
	
	UILabel *label = (UILabel *)[cell viewWithTag:102];
	label.frame = CGRectMake(3, 50, 100, hei - 10);
	label.text = @"天安门";
	
	return cell;
}
- (CGFloat)flowView:(LLWaterFlowView *)flowView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	float heigth= 0;
	switch ((indexPath.row + indexPath.section + 1)  % 7) {
		case 0:
			heigth = 147 + 10;
			break;
		case 1:
			heigth = 240 + 10;
			break;
		case 2:
			heigth = 200 + 10;
			break;
		case 3:
			heigth = 150 + 10;
			break;
		case 4:
			heigth = 147 + 10;
			break;
		case 5:
			heigth = 200 + 10;
			break;
            
		case 6:
			heigth = 100 + 10;
			break;
		case 7:
			heigth = 127 + 10;
			break;
            
		default:
			break;
	}
	
	heigth += (indexPath.section *2);
	
	return heigth;
}



#pragma mark -
#pragma UIScrollViewDelegate methods


 - (void)scrollViewDidScroll:(UIScrollView *)scrollView
 {
 CGPoint pt = scrollView.contentOffset;
 
 NSLog(@"scrollViewDidScroll = %@", NSStringFromCGPoint(scrollView.contentOffset));
 
 if(((pt.y + scrollView.frame.size.height	- scrollView.contentSize.height) > 0) && !scrollView.dragging)
 {
 
 NSLog(@"scrollViewDidScroll fjlaf; = %@", NSStringFromCGPoint(scrollView.contentOffset));
 
 _nCount++;
 
 [flowView reloadData];
 }
if (scrollView==scroImg) {
         if (pageControlUsed)
         {
             return;
         }
         CGFloat pageWidth = scrollView.frame.size.width;
         int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
         pageControl.currentPage =page;
         [self loadScrollViewWithPage:page - 1];
         [self loadScrollViewWithPage:page];
         [self loadScrollViewWithPage:page+1];
     }
 }


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
    
    
}

//加载首页三张图
- (void)loadScrollViewWithPage:(int)page{
    if (page < 0)
        return;
    if (page >= kNumberOfPages)
        return;
    // replace the placeholder if necessary
    UrlImageButton *controller = [viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null])
    {
        CGRect frame = scroImg.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller = [[UrlImageButton alloc]initWithFrame:frame];
        controller.tag=page;//将ID保存到Tag中
        
//        [controller addTarget:self action:@selector(onImgBtn:) forControlEvents:UIControlEventTouchUpInside];
        NSString*imgUrl=@"http://m1.img.libdd.com/farm2/230/B8B0E9408AFD8E057D80F44EEF4789E6_1280_957.jpg";
        [controller setImageFromUrl:NO withUrl:imgUrl];
        [viewControllers replaceObjectAtIndex:page withObject:controller];
        [scroImg addSubview:controller];
        [controller release];
    }
}
- (IBAction)onNav:(id)sender {
    if ([sender tag]==101) {
          [(AppDelegate *)[[UIApplication sharedApplication] delegate] onleft];
    }
    if ([sender tag]==102) {
          [(AppDelegate *)[[UIApplication sharedApplication] delegate] onright];
    }
}
@end
