//
//  PopUtils.h
//  etoh22
//
//  Created by bim on 15/5/21.
//  Copyright (c) 2015年 biming. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "POP.h"

@interface PopUtils : NSObject


/**
 * 获取ShareUtils的实例
 */
+ (PopUtils *)sharePopUtils;
/**
 *  点击特效1
 *
 *  @param callback
 */
-(void)addPopAnimation1:(UIView *) view callback:(void(^)(POPAnimation *animation, BOOL finished)) callback;


/**
 *  点击特效2
 *
 *  @param callback
 */
-(void)addPopAnimation2:(UIView *) view callback:(void(^)(POPAnimation *animation, BOOL finished)) callback;


/**淡出*/
-(void)addPopFadeOut:(UIView *) view callback:(void(^)(POPAnimation *animation, BOOL finished)) callback;
/**淡入*/
-(void)addPopFadeIn:(UIView *) view callback:(void(^)(POPAnimation *animation, BOOL finished)) callback;

@end
