//
//  Toast.m
//  etoh22
//
//  Created by bim on 15/1/1.
//  Copyright (c) 2015年 winupon. All rights reserved.
//

#import "Toast.h"
#import "Validators.h"
#import "MBProgressHUD.h"

@implementation Toast

+ (void)makeText:(UIView *)view text:(NSString *)text
{
    [self makeText:view text:text duration:ToastDurationShort position:ToastPositionBottom];
}

+ (void) makeText:(UIView *)view text:(NSString *)text position:(ToastPosition)position
{
    [self makeText:view text:text duration:ToastDurationShort position:position];
}

+ (void)makeText:(UIView *)view text:(NSString *)text duration:(ToastDuration)duration
{
    [self makeText:view text:text duration:duration position:ToastPositionBottom];
}

+ (void)makeText:(UIView *)view text:(NSString *)text duration:(ToastDuration)duration position:(ToastPosition)position
{
    if ([Validators isEmpty:text]) {
        return;
    }
    
    [MBProgressHUD hideAllHUDsForView:view animated:NO];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.mode = MBProgressHUDModeText;
    hud.yOffset = position == ToastPositionMiddle ? -50 : 150;
    hud.detailsLabelText = text;
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    NSTimeInterval delay = duration == ToastDurationLong ? TOAST_DURATION_LONG : TOAST_DURATION_SHORT;
    [hud hide:YES afterDelay:delay];
}

+ (void)makeText:(NSString *)text
{
    [self makeText:text duration:ToastDurationShort];
}

+ (void)makeText:(NSString *)text position:(ToastPosition)position
{
    [self makeText:[UIApplication sharedApplication].keyWindow text:text duration:ToastDurationShort position:position];
}

+ (void)makeText:(NSString *)text duration:(ToastDuration)duration
{
    [self makeText:[UIApplication sharedApplication].keyWindow text:text duration:duration position:ToastPositionBottom];
}

@end
