//
//  Rs_word.h
//  rscd
//
//  Created by bim on 16/8/11.
//  Copyright © 2016年 bim. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Rs_word : NSManagedObject

@property (nonatomic, retain) NSString * word;
@property (nonatomic, retain) NSString * cixin;
@property (nonatomic, retain) NSString * bianxin;
@property (nonatomic, retain) NSNumber * jinyici;
@property (nonatomic, retain) NSNumber * shiyi;

@end
