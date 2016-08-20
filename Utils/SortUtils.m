//
//  SortUtils.m
//  etoh22
//
//  Created by bim on 15/11/16.
//  Copyright © 2015年 biming. All rights reserved.
//
// 用于集合排序

#import "SortUtils.h"

@implementation SortUtils


+(void)sortByDescriptor:(NSMutableArray *)array descriptor:(NSString *)descriptor ascending:(BOOL)ascending
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:descriptor ascending:!ascending];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:&sortDescriptor count:1];
    [array sortUsingDescriptors:sortDescriptors];
}

@end
