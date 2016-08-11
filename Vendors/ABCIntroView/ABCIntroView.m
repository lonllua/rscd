//
//  IntroView.m
//  DrawPad
//
//  Created by Adam Cooper on 2/4/15.
//  Copyright (c) 2015 Adam Cooper. All rights reserved.
//

#import "ABCIntroView.h"
#import "AppMacro.h"
#import "AppColor.h"
#import "UIDevice+Resolutions.h"
#import "Toast.h"
#import "StringUtils.h"

@interface ABCIntroView () <UIScrollViewDelegate>
@property (strong, nonatomic)  UIScrollView *scrollView;
@property (strong, nonatomic)  UIPageControl *pageControl;
@property UIView *holeView;
@property UIView *circleView;
@property UIButton *doneButton;
@property UIButton *loginButton;

@end

@implementation ABCIntroView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.frame];
        self.scrollView.backgroundColor = [UIColor whiteColor];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.bounces = NO;
        self.scrollView.showsVerticalScrollIndicator = FALSE;
        self.scrollView.showsHorizontalScrollIndicator = FALSE;
        [self addSubview:self.scrollView];
        
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height*.95, self.frame.size.width, 10)];
        self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:1.000];
        self.pageControl.pageIndicatorTintColor = [UIColor colorWithRed:0.153 green:0.533 blue:0.796 alpha:0.4000];;
        [self addSubview:self.pageControl];
        
        [self createViewOne];
        [self createViewTwo];
        [self createViewThree];
        
        self.pageControl.numberOfPages = 3;
        self.scrollView.contentSize = CGSizeMake(self.frame.size.width*3, self.scrollView.frame.size.height);
        
        //This is the starting point of the ScrollView
        CGPoint scrollPoint = CGPointMake(0, 0);
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
    return self;
}

- (void)onFinishedIntroButtonPressed:(id)sender {
    [self.delegate onDoneButtonPressed];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = CGRectGetWidth(self.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    self.pageControl.currentPage = roundf(pageFraction);
    if (pageFraction >= 2) {
        [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(onFinishedIntroButtonPressed:) userInfo:nil repeats:NO];
    }
}


-(void)createViewOne{
    UIView *view = [[UIView alloc] initWithFrame:self.frame];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, SCREEN_HEIGHT)];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [imageview setImage:[UIImage imageNamed:@"img_guide_01"]];
    
    [view addSubview:imageview];
    self.scrollView.delegate = self;
    [self.scrollView addSubview:view];
}

-(void)createViewTwo{
    
    CGFloat originWidth = self.frame.size.width;
    CGFloat originHeight = SCREEN_HEIGHT;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(originWidth, 0, originWidth, originHeight)];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, originWidth, originHeight)];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [imageview setImage:[UIImage imageNamed:@"img_guide_02"]];
    [view addSubview:imageview];
    self.scrollView.delegate = self;
    [self.scrollView addSubview:view];
    
}

-(void)createViewThree{
    
    CGFloat originWidth = self.frame.size.width;
    CGFloat originHeight = SCREEN_HEIGHT;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(originWidth*2, 0, originWidth, originHeight)];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, originWidth, originHeight)];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [imageview setImage:[UIImage imageNamed:@"img_guide_02"]];
    [view addSubview:imageview];
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    [imageview setImage:[UIImage imageNamed:@"img_guide_03"]];    [view addSubview:imageview];
    
    self.scrollView.delegate = self;
    [self.scrollView addSubview:view];
    
}

@end