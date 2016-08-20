//
//  RsWordDao.h
//  rscd
//
//  Created by bim on 16/8/11.
//  Copyright © 2016年 bim. All rights reserved.
//

#import "BaseDao.h"
#import "Rsword.h"

@interface RsWordDao : BaseDao

+(BOOL) removeAllData;

+(Rsword *) queryRswordByWord:(NSString *)word;

+ (BOOL)addRsword:(Rsword *)rsword;

@end
