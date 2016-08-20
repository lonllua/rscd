//
//  StyleUtils.m
//  etoh22
//
//  Created by bim on 14/12/30.
//  Copyright (c) 2014年 biming. All rights reserved.
//

#import "ButtonStyleUtil.h"
#import "StyleUtil.h"
#import "AppColor.h"
#import "AppMacro.h"
#import "Validators.h"

@implementation StyleUtil

+ (CGSize)getTextSize:(NSString *)content font:(UIFont *)font maxSize:(CGSize)maxSize
{
    if ([Validators isEmpty:content]) {
        return CGSizeZero;
    }
    
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:6.5];
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    CGRect rect = [content boundingRectWithSize:maxSize options:options attributes:attributes context:nil];
    return rect.size;
}

+ (CGSize)getTextSize:(NSString *)content font:(UIFont *)font
{
    return [StyleUtil getTextSize:content font:font maxSize:CGSizeZero];
}

+ (void)setTableViewCellStyle:(UITableViewCell *)cell
{
    UIView *selectedView = [[UIView alloc] init];
    selectedView.backgroundColor = [[AppColor sharedAppColor] colorWithString:COLOR_D9D9D9];
    cell.selectedBackgroundView = selectedView;
}

+ (void)setViewFrame:(UIView *)view left:(CGFloat)left top:(CGFloat)top width:(CGFloat)width height:(CGFloat)height{
    CGRect frame = view.frame;    
    if (left != -1) {
        frame.origin.x = left;
    }
    if (top != -1) {
        frame.origin.y = top;
    }
    if (width != -1) {
        frame.size.width = width;
    }
    if (height != -1) {
        frame.size.height = height;
    }
    view.frame = frame;
}

+ (void)setViewWidth:(UIView *)view width:(CGFloat)width{
    [StyleUtil setViewFrame:view left:-1 top:-1 width:width height:-1];
}

+ (void)setViewHeight:(UIView *)view height:(CGFloat)height{
    [StyleUtil setViewFrame:view left:-1 top:-1 width:-1 height:height];
}

+ (void)setViewTop:(UIView *)view top:(CGFloat)top{
    [StyleUtil setViewFrame:view left:-1 top:top width:-1 height:-1];
}

+ (void)setViewLeft:(UIView *)view left:(CGFloat)left{
    [StyleUtil setViewFrame:view left:left top:-1 width:-1 height:-1];
}

+ (void)setViewOrigin:(UIView *)view left:(CGFloat)left top:(CGFloat)top{
    [StyleUtil setViewFrame:view left:left top:top width:-1 height:-1];
}

+ (void)setViewSize:(UIView *)view width:(CGFloat)width height:(CGFloat)height{
    [StyleUtil setViewFrame:view left:-1 top:-1 width:width height:height];
}

+ (void)setContentSizeFrame:(UIScrollView *)scrollView width:(CGFloat)width height:(CGFloat)height
{
    CGSize size = scrollView.contentSize;
    if (width != -1) {
        size.width = width;
    }
    if (height != -1) {
        size.height = height;
    }
    scrollView.contentSize = size;
}

+ (void)setContentSizeHeight:(UIScrollView *)scrollView height:(CGFloat)height{
    [StyleUtil setContentSizeFrame:scrollView width:-1 height:height];
}

+ (void)setContentSizeWidth:(UIScrollView *)scrollView width:(CGFloat)width{
    [StyleUtil setContentSizeFrame:scrollView width:width height:-1];
}

+ (UIView *)drawLine:(UIView *)view frame:(CGRect)frame color:(UIColor *)color
{
    if (isPad && frame.size.height == 0.5) {
        frame.size.height = 1;
    }
    UIView *line = [[UIView alloc] initWithFrame:frame];
    if (color) {
        line.backgroundColor = color;
    }else{
        line.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_list_line"]];
    }
    [view addSubview:line];
    return line;
}

+ (UIView *)drawLine:(UIView *)view frame:(CGRect)frame
{
    return [self drawLine:view frame:frame color:nil];
}

+ (void)centerButtonContent:(UIButton *)button spacing:(int)spacing
{
    CGSize imageSize = button.imageView.frame.size;
    button.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, -(imageSize.height + spacing), 0);
    
    CGSize titleSize = [button.titleLabel.text sizeWithFont:button.titleLabel.font];
    button.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0, 0, -titleSize.width);
}

+ (UIBarButtonItem *)addBarButton:(UIViewController *)controller title:(NSString *)title action:(SEL)action position:(PositionType)position
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStyleBordered target:controller action:action];
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:18], UITextAttributeFont, nil];
    [barButton setTitleTextAttributes:attrs forState:UIControlStateNormal];
    if (position == PositionTypeLeft) {
        controller.navigationItem.leftBarButtonItem = barButton;
    } else {
        controller.navigationItem.rightBarButtonItem = barButton;
    }    
    return barButton;
}

// 添加分享按钮
+ (UIBarButtonItem *)addShareButton:(UIViewController *)controller position:(PositionType)position
{
    UIImage *shareImg = [UIImage imageNamed:@"icon_menu_yyfx"];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithImage:shareImg style:UIBarButtonItemStyleBordered target:controller action:nil];
    if (position == PositionTypeLeft) {
        controller.navigationItem.leftBarButtonItem = barButton;
    } else {
        controller.navigationItem.rightBarButtonItem = barButton;
    }
    return barButton;
}

+ (UIBarButtonItem *)addRefreshButton:(UIViewController *)controller position:(PositionType)position
{
    UIImage *shareImg = [UIImage imageNamed:@"btn_nav_refresh_normal"];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithImage:shareImg style:UIBarButtonItemStyleBordered target:controller action:nil];
    if (position == PositionTypeLeft) {
        controller.navigationItem.leftBarButtonItem = barButton;
    } else {
        controller.navigationItem.rightBarButtonItem = barButton;
    }
    return barButton;
}

+ (UIBarButtonItem *)addSettingButton:(UIViewController *)controller position:(PositionType)position
{
    UIImage *shareImg = [UIImage imageNamed:@"btn_nav_set_normal"];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithImage:shareImg style:UIBarButtonItemStyleBordered target:controller action:nil];
    if (position == PositionTypeLeft) {
        controller.navigationItem.leftBarButtonItem = barButton;
    } else {
        controller.navigationItem.rightBarButtonItem = barButton;
    }
    return barButton;
}

+ (void)setTableViewCellLineSelectedStyle:(UIView *)lineView, ...
{
    va_list args;
    va_start(args, lineView);
    if (lineView) {
        UIColor *lineColor = [[AppColor sharedAppColor] colorWithString:COLOR_C8C7CC];
        for (UIView *item = lineView; item != nil; item = va_arg(args, UIView *)) {
            item.backgroundColor = lineColor;
        }
    }
    va_end(args);
}


+ (CALayer *)addSeparatorLine:(UIView *)view frame:(CGRect)frame color:(UIColor *)color
{
    CALayer *separator = [[CALayer alloc] init];
    separator.frame = frame;
    AppColor *appColor = [AppColor sharedAppColor];
    UIColor *borderColor = color ? color : [appColor colorWithString:COLOR_C8C7CC];
    separator.borderColor = borderColor.CGColor;
    separator.borderWidth = frame.size.height;
    [view.layer addSublayer:separator];
    return separator;
}

+ (UIButton *)setSearchBarButtonStyle:(UISearchBar *)searchBar
{
    UIView *viewTop = IS_IOS7 ? searchBar.subviews[0] : searchBar;
    NSString *classString = IS_IOS7 ? @"UINavigationButton" : @"UIButton";
    UIButton *button = nil;
    for (UIView *subView in viewTop.subviews) {
        if ([subView isKindOfClass:NSClassFromString(classString)]) {
            button = (UIButton*)subView;
            break;
        }
    }
    searchBar.tintColor = [[AppColor sharedAppColor] colorWithString:COLOR_8E8E8E];
    searchBar.backgroundColor=[[AppColor sharedAppColor] colorWithString:COLOR_EDEDF3];
    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    if (button) {
        [button setTitle:@"取消" forState:UIControlStateNormal];
    }
    return button;
}

+ (void)setTextFieldNormalStyle:(UITextField *)textField, ... NS_REQUIRES_NIL_TERMINATION
{
    va_list args;
    va_start(args, textField);
    if (textField) {
        CGColorRef borderColor = [[AppColor sharedAppColor] colorWithString:COLOR_DCDCDC].CGColor;
        CGFloat radius = CGRectGetHeight(textField.frame) / 2;
        UIFont *font = [UIFont systemFontOfSize:15];
        for (UITextField *item = textField; item != nil; item = va_arg(args, UITextField *)) {
            item.layer.cornerRadius = radius;
            item.layer.borderWidth = 1;
            item.layer.borderColor = borderColor;
            item.font = font;
            item.borderStyle = UITextBorderStyleNone;
            item.autocapitalizationType = UITextAutocapitalizationTypeNone;
            item.autocorrectionType = UITextAutocorrectionTypeNo;
            item.clearButtonMode = UITextFieldViewModeWhileEditing;
            item.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 12, textField.frame.size.height)];;
            item.leftViewMode = UITextFieldViewModeAlways;
            item.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        }
    }
    va_end(args);
}

+ (void)setTextFieldHighlightedStyle:(UITextField *)textField
{
    AppColor *appColor = [AppColor sharedAppColor];
    textField.layer.borderColor = [appColor colorWithString:COLOR_53B53E].CGColor;
    textField.layer.borderWidth = 1;
}

+ (void)setViewFrame:(UIView *)view height:(CGFloat)height top:(CGFloat)top
{
    CGRect frame = view.frame;
    if (height != -1) {
        frame.size.height = height;
    }
    if (top != -1) {
        frame.origin.y = top;
    }
    view.frame = frame;
}

+ (UITableViewCell *)getEmptyTableCell:(NSString *)message color:(UIColor *)color
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.frame = CGRectMake(0, 0, SCREEN_WIDTH, 103);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (color) {
        cell.backgroundColor = color;
    }
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:cell.frame];
    messageLabel.text = message;
    messageLabel.font = [UIFont boldSystemFontOfSize:15];
    messageLabel.textColor = [[AppColor sharedAppColor] colorWithString:COLOR_999999];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.backgroundColor = [UIColor clearColor];
    [cell addSubview:messageLabel];
    return cell;
}

+ (UITableViewCell *)getEmptyTableCell:(NSString *)message
{
    return [StyleUtil getEmptyTableCell:message color:nil];
}

+ (void)setViewOrigin:(UIView *)view x:(CGFloat)x y:(CGFloat)y
{
    CGRect frame = view.frame;
    frame.origin.x = x;
    frame.origin.y = y;
    view.frame = frame;
}

@end
