//
//  RsWordDao.m
//  rscd
//
//  Created by bim on 16/8/11.
//  Copyright © 2016年 bim. All rights reserved.
//

#import "RsWordDao.h"
#import "Rs_word.h"
#import "Rsword.h"
#import "Validators.h"

@implementation RsWordDao

+(BOOL) removeAllData
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"word != '123'"];
    [Rs_word MR_deleteAllMatchingPredicate:predicate];
    [BaseDao commit];
    return true;
}


+(Rsword *) queryRswordByWord:(NSString *)word
{
    if([Validators isEmpty:word]){
        return nil;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"word = %@",word];
    NSArray *all = [Rs_word MR_findAll];
    NSLog(@"数据条数：%ld", [all count]);
    Rs_word *rs_word = [Rs_word MR_findFirstWithPredicate:predicate];
    if (rs_word) {
        return [RsWordDao convertBackFromTableMapping:rs_word];
    }
    
    return nil;
}


//-(BOOL)checkName:(NSString *)name{
//    
//    char *err;
//    NSString *sql = [NSString stringWithFormat:@"SELECT COUNT(*) FROM sqlite_master where type='table' and name='%@';",name];
//    const char *sql_stmt = [sql UTF8String];
//    if(sqlite3_exec(db, sql_stmt, NULL, NULL, &err) == 1){
//        return YES;
//    }else{
//        return NO;
//    }
//}

+ (BOOL)addRsword:(Rsword *)rsword
{
    if(!rsword) {
        return false;
    }
    
    Rsword *exsit = [RsWordDao queryRswordByWord:rsword.word];
    if (exsit) {
        NSLog(@"已经存在单词：%@", rsword.word);
        return YES;
    }
    [RsWordDao convertToTableMapping:rsword];
    [BaseDao commit];

    return true;
}


//////////////////////////////实体类和表对应Mapping的实体转换//////////////////////
/**
 * 实体－－》table
 */
+(Rs_word *)convertToTableMapping:(Rsword
                                    *)rsword
{
    Rs_word *rs_word = [Rs_word MR_createEntity];
    rs_word.word = rsword.word;
    rs_word.jinyici = rsword.jinyici;
    rs_word.bianxin = rsword.bianxin;
    rs_word.cixin = rsword.cixin;
    rs_word.shiyi = rsword.shiyi;
    return rs_word;
}

/**
 * table－－》实体
 */
+(Rsword *)convertBackFromTableMapping:(Rs_word *)rs_word
{
    Rsword *rsword = [[Rsword alloc] init];
    rsword.word = rs_word.word;
    rsword.jinyici = rs_word.jinyici;
    rsword.bianxin = rs_word.bianxin;
    rsword.cixin = rs_word.cixin;
    rsword.shiyi = rs_word.shiyi;
    return rsword;
}

@end
