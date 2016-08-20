//
//  AppColor.h
//  etoh22
//
//  Created by bim on 14/12/22.
//  Copyright (c) 2014年 biming. All rights reserved.
//

#import <Foundation/Foundation.h>

#define COLOR_WHITE @"#ffffff"
#define COLOR_BLACK @"#000000"

#define COLOR_BG1 @"#ffffff"
#define COLOR_BG2 @"#ededf3"
#define COLOR_SEL @"#d9d9d9"

#define COLOR_1DAAF2 @"#1DAAF2"
#define COLOR_20BF6F @"#20bf6f"
#define COLOR_B30103 @"#B30103"
#define COLOR_929292 @"#929292"
#define COLOR_06739d @"#06739d"
#define COLOR_03a9f5 @"#03a9f5"
#define COLOR_E2E2E2 @"#e2e2e2"
#define COLOR_797979 @"#797979"
#define COLOR_212121 @"#212121"
#define COLOR_232a30 @"#232a30"
#define COLOR_1AB0F5 @"#1AB0F5"

#define COLOR_999999 @"#999999"
#define COLOR_D1D1D1 @"#d1d1d1"
#define COLOR_D9D9D9 @"#D9D9D9"
#define COLOR_CC382C @"#cc382c"
#define COLOR_DCDCDC @"#dcdcdc"
#define COLOR_F0F0F0 @"#f0f0f0"
#define COLOR_D5392E @"#d5392e"
#define COLOR_353535 @"#353535"
#define COLOR_C8C7CC @"#c8c7cc"
#define COLOR_53B53E @"#53b53e"
#define COLOR_525252 @"#525252"
#define COLOR_ABABAB @"#ababab"
#define COLOR_00A0E9 @"#00a0e9"
#define COLOR_FFFFFF @"#ffffff"
#define COLOR_363636 @"#363636"
#define COLOR_C4C4C4 @"#c4c4c4"
#define COLOR_EFEFEF @"#efefef"
#define COLOR_E1E1E1 @"#e1e1e1"
#define COLOR_D7D7D7 @"#d7d7d7"
#define COLOR_5D5D5D @"#5d5d5d"
#define COLOR_DBDBDB @"#dbdbdb"
#define COLOR_CDCDCD @"#cdcdcd"
#define COLOR_C1C1C1 @"#c1c1c1"
#define COLOR_E4E4E4 @"#e4e4e4"
#define COLOR_E5E5E5 @"#e5e5e5"
#define COLOR_414141 @"#414141"
#define COLOR_40A608 @"#40a608"
#define COLOR_1E1E1E @"#1e1e1e"
#define COLOR_FFA19A @"#ffa19a"
#define COLOR_D1D0D0 @"#d1d0d0"
#define COLOR_F6F6F6 @"#f6f6f6"
#define COLOR_E5E5E5 @"#e5e5e5"
#define COLOR_F1F1F2 @"#f1f1f2"
#define COLOR_F1F1F1 @"#f1f1f1"
#define COLOR_D2D2D2 @"#d2d2d2"
#define COLOR_D6D6D6 @"#d6d6d6"
#define COLOR_E0E0E0 @"#e0e0e0"
#define COLOR_989898 @"#989898"
#define COLOR_FBFBFB @"#f2f2f2"
#define COLOR_FFCE22 @"#ffce22"
#define COLOR_D3D3D3 @"#d3d3d3"
#define COLOR_626262 @"#626262"
#define COLOR_6699CC @"#6699CC"
#define COLOR_E3E3E3 @"#e3e3e3"
#define COLOR_5FCC48 @"#5fcc48"
#define COLOR_EB4242 @"#eb4242"
#define COLOR_DDDDDD @"#dddddd"
#define COLOR_303030 @"#303030"
#define COLOR_F3F3F3 @"#f3f3f3"
#define COLOR_FDF1A2 @"#fdf1a2"
#define COLOR_2E3132 @"#2e3132"
#define COLOR_23950A @"#23950a"
#define COLOR_727272 @"#727272"
#define COLOR_767676 @"#767676"
#define COLOR_F39800 @"#f39800"
#define COLOR_D7331C @"#d7331c"
#define COLOR_FAE1B2 @"#fae1b2"
#define COLOR_959595 @"#959595"
#define COLOR_3FAC28 @"#3fac28"
#define COLOR_B3B3B3 @"#b3b3b3"
#define COLOR_EDEEF0 @"#edeef0"
#define COLOR_8D8D8D @"#8d8d8d"
#define COLOR_EFA091 @"#efa091"
#define COLOR_C7C7CC @"#c7c7cc"
#define COLOR_EBECEE @"#ebecee"
#define COLOR_8E8E8E @"#8e8e8e"
#define COLOR_F7F7F7 @"#f7f7f7"
#define COLOR_007AFF @"#007aff"
#define COLOR_EDEDF3 @"#ededf3"
#define COLOR_BDDEF4 @"#bddef4"
#define COLOR_425750 @"#425750"
#define COLOR_9B9B9B @"#9b9b9b"
#define COLOR_333333 @"#333333"
#define COLOR_5F897B @"#5f897b"
#define COLOR_DEDEDE @"#dedede"
#define COLOR_6B6B6B @"#6b6b6b"
#define COLOR_C8C8C8 @"#c8c8c8"
#define COLOR_546B63 @"#546b63"
#define COLOR_465F56 @"#465f56"
#define COLOR_5B5B5B @"#5b5b5b"
#define COLOR_F8F8F8 @"#f8f8f8"
#define COLOR_EDEDED @"#ededed"
#define COLOR_F5F5F5 @"#f5f5f5"
#define COLOR_6487A5 @"#6487a5"
#define COLOR_F2F2F2 @"#f2f2f2"
#define COLOR_F44C31 @"#f44c31"
#define COLOR_ADADAD @"#adadad"
@interface AppColor : NSObject

/**
 * 获取AppColor的实例
 */
+ (AppColor *)sharedAppColor;

/**
 * 根据16进制字符串获取对应的颜色
 */
- (UIColor *)colorWithString:(NSString *)colorString;

/**
 * 根据16进制字符串获取对应的图片
 */
- (UIImage *)imageWithString:(NSString *)colorString size:(CGSize)size;
@end
