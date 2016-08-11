//
//  DSLogger.h
//  etoh22
//
//  Created by bim on 14/12/31.
//  Copyright (c) 2014年 winupon. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR   1
#else
#define SIMULATOR   0
#endif

#ifndef __OPTIMIZE__
#define DSLog(fmt, ...)  do {                                            \
NSLog((@"%s[%d]\r[DEBUG] "fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__); \
} while(0)

#define DSLog_Info(fmt, ...)  do {                                            \
NSLog((@"%s[%d]\r[INFO] " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__); \
} while(0)

#define DSLog_Warn(fmt, ...)  do {                                            \
NSLog((@"%s[%d]\r[WARN] " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__); \
} while(0)

#define DSLog_Error(fmt, ...)  do {                                            \
NSLog((@"%s[%d]\r[ERROR] " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__); \
} while(0)
#else

#define DSLog(fmt, ...) {}
#define DSLog_Info(fmt, ...) {}
#define DSLog_Warn(fmt, ...) {}
#define DSLog_Error(fmt, ...)  do {                                            \
NSLog((@"%s[%d]\r[ERROR] " fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__); \
} while(0)

//#define NSLog(...) {}
#endif


@interface DSLogger : NSObject

+(void) RedirectNSLogToDocumentFolder;
+(void) StartLogCrashInfo;

@end
