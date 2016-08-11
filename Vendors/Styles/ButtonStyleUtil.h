//
//  ButtonStyleUtil.h
//  etoh22
//
//  Created by bim on 15/1/1.
//  Copyright (c) 2015年 winupon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ButtonStyleUtil : NSObject

/**
 * 设置开通和教育按钮样式
 */
+ (void)setOpenBtnButtonStyle:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * 设置滚轮按钮样式
 */
+ (void)setPickerBarButtonStyle:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * 设置登录按钮样式
 */
+ (void)setLoginBtnButtonStyle:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * 设置查询学校列表按钮样式
 */
+ (void)setSearchSchoolBtnButtonStyle:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * 设置开通和教育上一步／下一步按钮样式
 */
+ (void)setStepBtnButtonStyle:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * 设置红色背景白色文字按钮样式
 */
+ (void)setRedBtnButtonStyle:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * 给按钮设置按下效果
 */
+(void)setPressImgToButton:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION;

// 查看详情按钮样式
+ (void)setButtonStyle2:(UIColor *)normalColor selColor:(UIColor *) selColor button :(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION;
/**
 * 修改图片透明度
 */
+(UIImage *)transparentImage:(UIImage *)image withAdjustedAlpha:(CGFloat) alpha;

/**
 * 修改图片颜色
 */
+(UIImage *)changeImageColor:(UIImage *) image tintColor:(UIColor *)tintColor;

+(UIButton *)addBackButton:(UIViewController *)viewControler;

/**
 * 图片旋转
 */
+(void)rotate180:(UIView*)view withDuration:(NSTimeInterval)duration;

/**
 * 设置播放按钮样式 用于班级圈
 */
+ (void)setPlayButtonStyle:(UIButton *)button;
/**
 * 设置赞按钮样式 用于班级圈
 */
+ (void)setPraiseButtonStyle:(UIButton *)button;
/**
 * 设置评论按钮样式 用于班级圈
 */
+ (void)setCommentButtonStyle:(UIButton *)button;
/**
 * 设置已赞的按钮样式 用于班级圈
 */
+ (void)setPraisedButtonStyle:(UIButton *)button;

/**
 * 设置播放停止按钮样式 用于班级圈
 */
+ (void)setStopButtonStyle:(UIButton *)button;
/**
 * 设置语音类型按钮样式  用于班级圈
 */
+ (void)setVoiceTypeButtonStyle:(UIButton *)button;
/**
 * 设置文字类型按钮样式  用于班级圈
 */
+ (void)setTextTypeButtonStyle:(UIButton *)button;

@end
