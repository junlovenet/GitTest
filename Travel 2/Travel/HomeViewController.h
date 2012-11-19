//
//  HomeViewController.h
//  Travel
//
//  Created by 王颖 on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLWaterFlowView.h"

@interface HomeViewController : UIViewController<LLWaterFlowViewDelegate, UIScrollViewDelegate>
{
    CGPoint touchBeganPoint;
    BOOL homeViewIsOutOfStage;
    int _nCount ;
    LLWaterFlowView *flowView ;
    UIPageControl*pageControl;
    UIScrollView *scroImg;
    UIView*headView;
    BOOL pageControlUsed;
     NSMutableArray *viewControllers;
}
@property (nonatomic, retain)  UIScrollView *scroImg;

- (IBAction)onNav:(id)sender;
@end


