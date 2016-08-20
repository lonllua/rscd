//
//  RsSentenceDao.m
//  rscd
//
//  Created by bim on 16/8/11.
//  Copyright © 2016年 bim. All rights reserved.
//

#import "RsSentenceDao.h"
#import "Rs_word_sentence.h"
#import "Validators.h"

@implementation RsSentenceDao

+(NSMutableArray *) querySentenceListByWord:(NSString *) word
{
    if([Validators isEmpty:word]){
        return nil;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"word = %@",word];
    NSArray *rwsList = [Rs_word_sentence MR_findAllWithPredicate:predicate];
    
    NSMutableArray *resultArray = [NSMutableArray array];
    int n = (int)[rwsList count];
    for(int i=0; i<n; i++){
        RsWordSentence *rws = [RsSentenceDao convertBackFromTableMapping:rwsList[i]];
        [resultArray addObject:rws];
    }
    return resultArray;
}

+ (BOOL)addRsWordSentence:(RsWordSentence *)rws
{
    RsWordSentence *exsit = [RsSentenceDao queryRswordSentence:rws.sentence word:rws.word];
    if (exsit) {
        NSLog(@"已经存在例句：%@", rws.sentence);
        return YES;
    }
    
    [RsSentenceDao convertToTableMapping:rws];
    [BaseDao commit];
    return YES;
}

+(RsWordSentence *) queryRswordSentence:(NSString *)sentence word:(NSString *)word
{
    if([Validators isEmpty:sentence]){
        return nil;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"word = %@ and sentence = %@",word, sentence];
    Rs_word_sentence *r_w_s = [Rs_word_sentence MR_findFirstWithPredicate:predicate];
    if (r_w_s) {
        return [RsSentenceDao convertBackFromTableMapping:r_w_s];
    }
    
    return nil;
}

//////////////////////////////实体类和表对应Mapping的实体转换//////////////////////
/**
 * 实体－－》table
 */
+(Rs_word_sentence *)convertToTableMapping:(RsWordSentence
                                   *)rws
{
    Rs_word_sentence *r_w_s = [Rs_word_sentence MR_createEntity];
    r_w_s.word = rws.word;
    r_w_s.sentence = rws.sentence;
    r_w_s.chinese = rws.chinese;
    return r_w_s;
}

/**
 * table－－》实体
 */
+(RsWordSentence *)convertBackFromTableMapping:(Rs_word_sentence *)r_w_s
{
    RsWordSentence *rws = [[RsWordSentence alloc] init];
    rws.word = r_w_s.word;
    rws.sentence = r_w_s.sentence;
    rws.chinese = r_w_s.chinese;
    return rws;
}

@end
