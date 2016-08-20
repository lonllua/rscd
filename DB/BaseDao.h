//
//  BaseDao.h
//  etoh22
//
//  Created by bim on 15/1/4.
//  Copyright (c) 2015年 biming. All rights reserved.
//

#import "CoreData+MagicalRecord.h"
// 默认分页大小
#define DEFAULT_PAGE_SIZE 20

@interface Page : NSObject

@property(nonatomic,retain) NSArray *result;
@property(nonatomic,readonly) BOOL hasMore;
@property(nonatomic,readonly) NSUInteger pageSize;

@property(nonatomic,readonly) NSUInteger fetchLimit;
@property(nonatomic,readonly) NSUInteger fetchOffset;

- (id)initWith:(NSUInteger)pageNo;

- (id)initWithPageSize:(NSUInteger)pageSize;

- (id)initWith:(NSUInteger)pageNo pageSize:(NSUInteger)pageSize;

@end

@interface BaseDao : NSObject

/**
 * 提交保存到数据库
 */
+ (void)commit;

- (BOOL)isEmpty:(NSArray *)values;

- (BOOL)isNotEmpty:(NSArray *)values;

@end
