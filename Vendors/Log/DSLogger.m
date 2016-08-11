//
//  DSLogger.m
//  etoh22
//
//  Created by bim on 14/12/31.
//  Copyright (c) 2014年 winupon. All rights reserved.
//

#import "DSLogger.h"

@implementation DSLogger

static void HandleRootException( NSException* exception )
{
    NSString* name = [ exception name ];
    NSString* reason = [ exception reason ];
    NSArray* symbols = [ exception callStackSymbols ]; // 异常发生时的调用栈
    NSMutableString* strSymbols = [[ NSMutableString alloc ] init]; // 将调用栈拼成输出日志的字符串
    for ( NSString* item in symbols )
    {
        [ strSymbols appendString: item ];
        [ strSymbols appendString: @"\r\n" ];
    }
    
    // 写日志，级别为ERROR
    NSLog(@"%s[%d]\r\nError: [Uncaught Exception]\r\nName: %@\r\nReason: %@\r\n[Symbols Start]\r\n%@[Symbols End]",__FUNCTION__, __LINE__, name, reason, strSymbols );
    
    // 这儿必须Hold住当前线程，等待日志线程将日志成功输出，当前线程再继续运行
    //blockingFlushLogs( __FUNCTION__ );
    
    // 写一个文件，记录此时此刻发生了异常。这个挺有用的哦
    //NSDictionary* dict = [ NSDictionary dictionaryWithObjectsAndKeys:currentCinLogFileName(), @"LogFile",                // 当前日志文件名称currentCinLogFileFullPath(), @"LogFileFullPath",    // 当前日志文件全路径[ NSDate date ], @"TimeStamp",                        // 异常发生的时刻nil ];
    // NSString* path = [ NSString stringWithFormat: @"%@/Documents/", NSHomeDirectory() ];
    //NSString* lastExceptionLog = [ NSString stringWithFormat: @"%@LastExceptionLog.txt", path ];
    //[ dict writeToFile: lastExceptionLog atomically: YES ];
}

+ (void)RedirectNSLogToDocumentFolder
{
    NSString *strLogDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    
    strLogDirectory = [NSString stringWithFormat:@"%@%@%@",strLogDirectory,@"/",@"log"];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:strLogDirectory]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:strLogDirectory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    NSDateFormatter *dateformat=[[NSDateFormatter  alloc]init];
    [dateformat setDateFormat:@"yyyy_MM_dd_HH_mm_ss"];
    NSString *fileName = [dateformat stringFromDate:[NSDate date]];
    fileName =[NSString stringWithFormat:@"etoh_%@.log",fileName];
    
    NSString *logFilePath = [strLogDirectory stringByAppendingPathComponent:fileName];
    freopen([logFilePath cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);
}

+(void) StartLogCrashInfo
{
    NSSetUncaughtExceptionHandler(HandleRootException);
}


@end

