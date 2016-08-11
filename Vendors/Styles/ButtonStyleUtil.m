//
//  ButtonStyleUtil.m
//  etoh22  ce
//
//  Created by bim on 15/1/1.
//  Copyright (c) 2015年 winupon. All rights reserved.
//

#import "ButtonStyleUtil.h"
#import "AppColor.h"
#import "AppFont.h"
#import "CompatibilityUtil.h"
#import "ImageUtil.h"

@implementation ButtonStyleUtil

/**
 * 设置开通和教育按钮样式
 */
+ (void)setOpenBtnButtonStyle:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION
{
    va_list args;
    va_start(args, button);
    if (button) {
        CGFloat radius = 4;//圆角
        UIColor *bgColor = [UIColor whiteColor];//按钮背景颜色
        UIColor *textColor = [[AppColor sharedAppColor] colorWithString:COLOR_03a9f5];//字体颜色
        CGFloat textSize = 14.0;
        CGFloat alpha = 0.8;//按钮透明度
        UIImage *bgImageSel = [[AppColor sharedAppColor] imageWithString:COLOR_SEL size:button.frame.size];//按钮选中颜色
        
        for (UIButton *item = button; item != nil; item = va_arg(args, UIButton *)) {
            item.layer.cornerRadius = radius;
            item.layer.masksToBounds = YES;
            item.backgroundColor = bgColor;
            [item setTitleColor:textColor forState:UIControlStateNormal];
            item.titleLabel.font = [UIFont systemFontOfSize: textSize];
            item.alpha = alpha;
            [item setBackgroundImage:bgImageSel forState:UIControlStateHighlighted];
        }
    }
    va_end(args);

}

/**
 * 设置滚轮按钮样式
 */
+ (void)setPickerBarButtonStyle:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION
{
    va_list args;
    va_start(args, button);
    if (button) {
        CGFloat radius = 4;//圆角
        UIColor *bgColor = [UIColor whiteColor];//按钮背景颜色
        UIColor *textColor = [[AppColor sharedAppColor] colorWithString:COLOR_20BF6F];//字体颜色
        CGFloat textSize = 17.0;
        UIColor *textColorSel = [UIColor colorWithCGColor:CGColorCreateCopyWithAlpha(textColor.CGColor, 0.4)];//字体颜色
        for (UIButton *item = button; item != nil; item = va_arg(args, UIButton *)) {
            item.layer.cornerRadius = radius;
            item.layer.masksToBounds = YES;
            item.backgroundColor = bgColor;
            [item setTitleColor:textColor forState:UIControlStateNormal];
            [item setTitleColor:textColorSel forState:UIControlStateHighlighted];
            item.titleLabel.font = [UIFont systemFontOfSize: textSize];
        }
    }
    va_end(args);
    
}

/**
 * 设置登录按钮样式
 */
+ (void)setLoginBtnButtonStyle:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION{
    va_list args;
    va_start(args, button);
    if (button) {
        CGFloat radius = 4;//圆角
        UIColor *textColor = [[AppColor sharedAppColor] colorWithString:COLOR_WHITE];//字体颜色
        CGFloat textSize = FONT6_SIZE;
        
        UIImage *bgImageNormal = [UIImage imageNamed:@"btn_green86"];//按钮正常
        bgImageNormal = [bgImageNormal stretchableImageWithLeftCapWidth:floorf(bgImageNormal.size.width/2) topCapHeight:floorf(bgImageNormal.size.height/2)];
        
        UIImage *bgImageSel = [UIImage imageNamed:@"btn_green86_sel"];//按钮选中
        bgImageSel = [bgImageSel stretchableImageWithLeftCapWidth:floorf(bgImageSel.size.width/2) topCapHeight:floorf(bgImageSel.size.height/2)];
        
        UIFont *font = [UIFont systemFontOfSize:17];//字体大小
        
        for (UIButton *item = button; item != nil; item = va_arg(args, UIButton *)) {
            item.layer.cornerRadius = radius;
            item.layer.masksToBounds = YES;
            item.titleLabel.font = [UIFont systemFontOfSize:textSize];
            [item setTitleColor:textColor forState:UIControlStateNormal];
            [item setBackgroundImage:bgImageNormal forState:UIControlStateNormal];
            [item setBackgroundImage:bgImageSel forState:UIControlStateHighlighted];
            [[item titleLabel] setFont:font];
        }
    }
}

/**
 * 设置查询学校列表按钮样式
 */
+ (void)setSearchSchoolBtnButtonStyle:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION
{
    va_list args;
    va_start(args, button);
    if (button) {
        CGFloat radius = 4;//圆角
        UIColor *textColor = [[AppColor sharedAppColor] colorWithString:FONT3_COLOR];//字体颜色
        CGFloat textSize = FONT3_SIZE;
        
        UIImage *bgImageNormal = [UIImage imageNamed:@"btn_login_white02_normal"];//按钮正常
        bgImageNormal = [bgImageNormal stretchableImageWithLeftCapWidth:floorf(bgImageNormal.size.width/2) topCapHeight:floorf(bgImageNormal.size.height/2)];
        
        UIImage *bgImageSel = [UIImage imageNamed:@"btn_login_white02_sel"];//按钮选中
        bgImageSel = [bgImageSel stretchableImageWithLeftCapWidth:floorf(bgImageSel.size.width/2) topCapHeight:floorf(bgImageSel.size.height/2)];
        
        UIFont *font = [UIFont systemFontOfSize:FONT3_SIZE];//字体大小
        
        for (UIButton *item = button; item != nil; item = va_arg(args, UIButton *)) {
            item.layer.cornerRadius = radius;
            item.layer.masksToBounds = YES;
            item.titleLabel.font = [UIFont systemFontOfSize:textSize];
            [item setTitleColor:textColor forState:UIControlStateNormal];
            [item setBackgroundImage:bgImageNormal forState:UIControlStateNormal];
            [item setBackgroundImage:bgImageSel forState:UIControlStateHighlighted];
            [[item titleLabel] setFont:font];
        }
    }
    va_end(args);
}

/**
 * 设置开通和教育上一步／下一步按钮样式
 */
+ (void)setStepBtnButtonStyle:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION{
    va_list args;
    va_start(args, button);
    if (button) {
        CGFloat radius = 4;//圆角
        UIColor *textColor = [[AppColor sharedAppColor] colorWithString:FONT6_COLOR];//字体颜色
        CGFloat textSize = FONT6_SIZE;
        
        UIImage *bgImageNormal = [UIImage imageNamed:@"btn_green86"];//按钮正常
        bgImageNormal = [bgImageNormal stretchableImageWithLeftCapWidth:floorf(bgImageNormal.size.width/2) topCapHeight:floorf(bgImageNormal.size.height/2)];
        
        UIImage *bgImageSel = [UIImage imageNamed:@"btn_green86_sel"];//按钮选中
        bgImageSel = [bgImageSel stretchableImageWithLeftCapWidth:floorf(bgImageSel.size.width/2) topCapHeight:floorf(bgImageSel.size.height/2)];
        
        UIFont *font = [UIFont systemFontOfSize:17];//字体大小
        for (UIButton *item = button; item != nil; item = va_arg(args, UIButton *)) {
            item.layer.cornerRadius = radius;
            item.layer.masksToBounds = YES;
            item.titleLabel.font = [UIFont systemFontOfSize:textSize];
            [item setTitleColor:textColor forState:UIControlStateNormal];
            [item setBackgroundImage:bgImageNormal forState:UIControlStateNormal];
            [item setBackgroundImage:bgImageSel forState:UIControlStateHighlighted];
            [[item titleLabel] setFont:font];
        }
    }
    va_end(args);
}

/**
 * 设置查看详情按钮样式
 */
+ (void)setButtonStyle2:(UIColor *)normalColor selColor:(UIColor *) selColor button :(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION{
    va_list args;
    va_start(args, button);
    if (button) {
        CGFloat radius = 3;//圆角
        UIColor *textColor = [[AppColor sharedAppColor] colorWithString:FONT6_COLOR];//字体颜色
        CGFloat textSize = FONT6_SIZE;
        
        UIImage *bgImageNormal = [ImageUtil createImageWithColor:normalColor];//按钮正常
        bgImageNormal = [bgImageNormal stretchableImageWithLeftCapWidth:floorf(bgImageNormal.size.width/2) topCapHeight:floorf(bgImageNormal.size.height/2)];
        
        UIImage *bgImageSel = [ImageUtil createImageWithColor:selColor];//按钮选中
        bgImageSel = [bgImageSel stretchableImageWithLeftCapWidth:floorf(bgImageSel.size.width/2) topCapHeight:floorf(bgImageSel.size.height/2)];
        
        UIFont *font = [UIFont systemFontOfSize:11];//字体大小
        for (UIButton *item = button; item != nil; item = va_arg(args, UIButton *)) {
            item.layer.cornerRadius = radius;
            item.layer.masksToBounds = YES;
            item.titleLabel.font = [UIFont systemFontOfSize:textSize];
            [item setTitleColor:textColor forState:UIControlStateNormal];
            [item setBackgroundImage:bgImageNormal forState:UIControlStateNormal];
            [item setBackgroundImage:bgImageSel forState:UIControlStateHighlighted];
            [[item titleLabel] setFont:font];
        }
    }
    va_end(args);
}

/**
 * 设置红色背景白色文字按钮样式
 */
+ (void)setRedBtnButtonStyle:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION{
    va_list args;
    va_start(args, button);
    if (button) {
        CGFloat radius = 4;//圆角
        UIColor *textColor = [[AppColor sharedAppColor] colorWithString:FONT6_COLOR];//字体颜色
        CGFloat textSize = FONT6_SIZE;
        
        UIImage *bgImageNormal = [UIImage imageNamed:@"btn_red01_normal"];//按钮正常
        bgImageNormal = [bgImageNormal stretchableImageWithLeftCapWidth:floorf(bgImageNormal.size.width/2) topCapHeight:floorf(bgImageNormal.size.height/2)];
        
        UIImage *bgImageSel = [UIImage imageNamed:@"btn_red01_normal"];//按钮选中
        bgImageSel = [bgImageSel stretchableImageWithLeftCapWidth:floorf(bgImageSel.size.width/2) topCapHeight:floorf(bgImageSel.size.height/2)];
        
        UIFont *font = [UIFont systemFontOfSize:17];//字体大小
        for (UIButton *item = button; item != nil; item = va_arg(args, UIButton *)) {
            item.layer.cornerRadius = radius;
            item.layer.masksToBounds = YES;
            item.titleLabel.font = [UIFont systemFontOfSize:textSize];
            [item setTitleColor:textColor forState:UIControlStateNormal];
            [item setBackgroundImage:bgImageNormal forState:UIControlStateNormal];
            [item setBackgroundImage:bgImageSel forState:UIControlStateHighlighted];
            [[item titleLabel] setFont:font];
        }
    }
    va_end(args);
}

/**
 * 给按钮设置按下效果
 */
+(void)setPressImgToButton:(UIButton *)button, ... NS_REQUIRES_NIL_TERMINATION
{
    UIImage *pressImg = [[AppColor sharedAppColor] imageWithString:COLOR_SEL size:button.frame.size];//按下效果
    
    va_list args;
    va_start(args, button);
    for (UIButton *item = button; item != nil; item = va_arg(args, UIButton *)) {
        [item setBackgroundImage:pressImg forState:UIControlStateHighlighted];
    }
    va_end(args);
}

+(UIImage *)transparentImage:(UIImage *)image withAdjustedAlpha:(CGFloat) alpha {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    [image drawAtPoint:CGPointZero blendMode:kCGBlendModeCopy alpha:alpha];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+(UIImage *)changeImageColor:(UIImage *) image tintColor:(UIColor *)tintColor
{
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [image drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintedImage;
}

+ (UIButton *)addBackButton:(UIViewController *)viewControler
{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 40)];
    [backButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"nav_back_sel"] forState:UIControlStateHighlighted];
    [CompatibilityUtil setCustomBackButtonStyle:backButton];
    viewControler.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    return backButton;
}

+ (void)rotate180:(UIView*)view withDuration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration delay:0 options:0 animations: ^{
        view.transform = CGAffineTransformRotate(view.transform, -3.141593);
    } completion: ^(BOOL completed) {
        if (!completed) {
            [self rotate180:view withDuration:duration];
        }
    }];
}

+(void) setPlayFrequencyButtonStyle:(UIButton *)button
{
    CGRect frame = button.frame;
    if (frame.size.width == 0) {
        frame.size.width = 90;
        frame.size.height = 30;
        button.frame = frame;
    }
    if(frame.size.width == 90){
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -50, 0, 0)];
        button.layer.cornerRadius = 15;
    }else if(frame.size.width == 56){
        button.layer.cornerRadius = 9;
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0, 0)];
    }
    AppColor *appColor = [AppColor sharedAppColor];
    [button titleLabel].font = [UIFont boldSystemFontOfSize:15];
    [button setTitleColor:[appColor colorWithString:@"#5f897b"] forState:UIControlStateNormal];
    
}
+ (void)setPlayButtonStyle:(UIButton *)button
{
    [ButtonStyleUtil setPlayFrequencyButtonStyle:button];
}
+ (void)setPraiseButtonStyle:(UIButton *)button
{
    [ButtonStyleUtil setButtonStyle:button];
    [button setTitle:@"赞" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_favourite_gray"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_favourite_gray"] forState:UIControlStateHighlighted];
}
+ (void)setButtonStyle:(UIButton *)button
{
    CGRect frame = button.frame;
    if (frame.size.width == 0) {
        frame.size.width = 70;
        frame.size.height = 30;
        button.frame = frame;
    }
    AppColor *appColor = [AppColor sharedAppColor];
    [button titleLabel].font = [UIFont boldSystemFontOfSize:12];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 7, 0, 0)];
    [button setTitleColor:[appColor colorWithString:COLOR_FFFFFF] forState:UIControlStateNormal];
}
+ (void)setCommentButtonStyle:(UIButton *)button
{
    [ButtonStyleUtil setButtonStyle:button];
    [button setTitle:@"评论" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_class_comment_nor"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_class_comment_nor"] forState:UIControlStateHighlighted];
}
+ (void)setPraisedButtonStyle:(UIButton *)button
{
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_class_praise_nor"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"icon_class_praise_nor"] forState:UIControlStateHighlighted];
}
+ (void)setStopButtonStyle:(UIButton *)button
{
    [button setImage:[UIImage imageNamed:@"icon_end"] forState:UIControlStateNormal];
    
}
+ (void)setVoiceTypeButtonStyle:(UIButton *)button
{
    [button setImage:[UIImage imageNamed:@"btn_msg_voice"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"btn_msg_voice_sel"] forState:UIControlStateHighlighted];
}
+ (void)setTextTypeButtonStyle:(UIButton *)button
{
    [button setImage:[UIImage imageNamed:@"btn_msg_text"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"btn_msg_text_sel"] forState:UIControlStateHighlighted];
}

@end
