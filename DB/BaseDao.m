//
//  BaseDao.m
//  etoh22
//
//  Created by bim on 15/1/4.
//  Copyright (c) 2015年 biming. All rights reserved.
//

#import "BaseDao.h"
#import "Validators.h"

@implementation Page

- (id)init
{
    return [self initWithPageSize:DEFAULT_PAGE_SIZE];
}

- (id)initWith:(NSUInteger)pageNo
{
    return [self initWith:pageNo pageSize:DEFAULT_PAGE_SIZE];
}

- (id)initWithPageSize:(NSUInteger)pageSize
{
    self = [super init];
    if (self) {
        _pageSize = pageSize;
        _fetchLimit = self.pageSize + 1;
    }
    return self;
}

- (id)initWith:(NSUInteger)pageNo pageSize:(NSUInteger)pageSize
{
    self = [super init];
    if (self) {
        _pageSize = pageSize;
        _fetchLimit = pageSize + 1;
        _fetchOffset = pageNo * pageSize;
    }
    return self;
}

- (void)setResult:(NSMutableArray *)result
{
    if (result != nil && result.count > 0) {
        _hasMore = result.count > _pageSize;
        if (result.count > _pageSize) {
            [result removeLastObject];
        }
        _result = result;
    }
}

@end

@implementation BaseDao

/**
 * 提交保存到数据库
 */
+ (void)commit
{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (BOOL)isEmpty:(NSArray *)values
{
    return [Validators isEmptyArray:values];
}

- (BOOL)isNotEmpty:(NSArray *)values
{
    return ![self isEmpty:values];
}

@end
