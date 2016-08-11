//
//  Rs_word_sentence.h
//  rscd
//
//  Created by bim on 16/8/11.
//  Copyright © 2016年 bim. All rights reserved.
//


#import <CoreData/CoreData.h>

@interface Rs_word_sentence : NSManagedObject

@property (nonatomic, retain) NSString * word;
@property (nonatomic, retain) NSString * sentence;
@property (nonatomic, retain) NSString * chinese;

@end
