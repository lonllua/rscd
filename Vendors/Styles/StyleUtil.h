//
//  StyleUtils.h
//  etoh22
//
//  Created by bim on 14/12/30.
//  Copyright (c) 2014年 winupon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    PositionTypeLeft,
    PositionTypeRight
} PositionType;

@interface StyleUtil : NSObject

+ (CGSize)getTextSize:(NSString *)content font:(UIFont *)font maxSize:(CGSize)maxSize;
+ (CGSize)getTextSize:(NSString *)content font:(UIFont *)font;

/**
 * 设置表格单元样式
 */
+ (void)setTableViewCellStyle:(UITableViewCell *)cell;

/**
 * 设置视图类型样式
 */
+ (void)setViewFrame:(UIView *)view left:(CGFloat)left top:(CGFloat)top width:(CGFloat)width height:(CGFloat)height;

+ (void)setViewOrigin:(UIView *)view x:(CGFloat)x y:(CGFloat)y;

+ (void)setViewWidth:(UIView *)view width:(CGFloat)width;

+ (void)setViewHeight:(UIView *)view height:(CGFloat)height;

+ (void)setViewTop:(UIView *)view top:(CGFloat)top;

+ (void)setViewLeft:(UIView *)view left:(CGFloat)left;

+ (void)setViewOrigin:(UIView *)view left:(CGFloat)left top:(CGFloat)top ;

+ (void)setViewSize:(UIView *)view width:(CGFloat)width height:(CGFloat)height;

+ (void)setContentSizeFrame:(UIScrollView *)scrollView width:(CGFloat)width height:(CGFloat)height;

+ (void)setContentSizeHeight:(UIScrollView *)scrollView height:(CGFloat)height;

+ (void)setContentSizeWidth:(UIScrollView *)scrollView width:(CGFloat)width;

/*** 画线条*/
+ (UIView *)drawLine:(UIView *)view frame:(CGRect)frame color:(UIColor *)color;

/***默认#bg_list_line@2x.png*/
+ (UIView *)drawLine:(UIView *)view frame:(CGRect)frame;

/**
 * 增加导航按钮
 */
+ (UIBarButtonItem *)addBarButton:(UIViewController *)controller title:(NSString *)title action:(SEL)action position:(PositionType)position;

+ (UIBarButtonItem *)addShareButton:(UIViewController *)controller position:(PositionType)position;

+ (UIBarButtonItem *)addRefreshButton:(UIViewController *)controller position:(PositionType)position;

+ (UIBarButtonItem *)addSettingButton:(UIViewController *)controller position:(PositionType)position;
/**
 * 将按钮的图片和文字居中
 *
 * @param button
 * @param spacing 按钮和文字间距
 */
+ (void)centerButtonContent:(UIButton *)button spacing:(int)spacing;

+ (void)setTableViewCellLineSelectedStyle:(UIView *)lineView, ...;


+ (CALayer *)addSeparatorLine:(UIView *)view frame:(CGRect)frame color:(UIColor *)color;

/**
 * 设置搜索框中的取消按钮样式
 */
+ (UIButton *)setSearchBarButtonStyle:(UISearchBar *)searchBar;

/**
 * 设置文本框默认样式
 */
+ (void)setTextFieldNormalStyle:(UITextField *)textField, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * 设置文本框高亮样式
 */
+ (void)setTextFieldHighlightedStyle:(UITextField *)textField;

+ (void)setViewFrame:(UIView *)view height:(CGFloat)height top:(CGFloat)top;


@end
