//
//  PopUtils.m
//  etoh22
//
//  Created by bim on 15/5/21.
//  Copyright (c) 2015年 biming. All rights reserved.
//

#import "PopUtils.h"

@implementation PopUtils

/**
 * 获取PopUtils的实例
 */
+ (PopUtils *)sharePopUtils
{
    static PopUtils *popUtils;
    static dispatch_once_t pred = 0;//使用dispatch_once用来确保单例模式
    dispatch_once(&pred, ^{
        popUtils = [[PopUtils alloc] init];
    });
    return popUtils;
}

-(void)addPopAnimation1:(UIView *) view callback:(void(^)(POPAnimation *animation, BOOL finished)) callback
{
    POPSpringAnimation *buttonAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    buttonAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    buttonAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(3, 3)];
    buttonAnimation.springBounciness = 20;
    [view pop_addAnimation:buttonAnimation forKey:@"pop"];
    [buttonAnimation setCompletionBlock:callback];
}

-(void)addPopAnimation2:(UIView *) view callback:(void(^)(POPAnimation *animation, BOOL finished)) callback
{
    POPSpringAnimation *buttonAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    buttonAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    buttonAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
    buttonAnimation.springBounciness = 10;
    [view pop_addAnimation:buttonAnimation forKey:@"pop"];
    [buttonAnimation setCompletionBlock:callback];
}

-(void)addPopFadeOut:(UIView *) view callback:(void(^)(POPAnimation *animation, BOOL finished)) callback
{
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.fromValue = @(1.0);
    anim.toValue = @(0.0);
    [view pop_addAnimation:anim forKey:@"fadeOut"];
    [anim setCompletionBlock:callback];
}

-(void)addPopFadeIn:(UIView *) view callback:(void(^)(POPAnimation *animation, BOOL finished)) callback
{
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.fromValue = @(0.0);
    anim.toValue = @(1.0);
    [view pop_addAnimation:anim forKey:@"fadeIn"];
    [anim setCompletionBlock:callback];
}


@end
