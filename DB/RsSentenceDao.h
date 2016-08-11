//
//  RsSentenceDao.h
//  rscd
//
//  Created by bim on 16/8/11.
//  Copyright © 2016年 bim. All rights reserved.
//

#import "BaseDao.h"

@interface RsSentenceDao : BaseDao

+(NSMutableArray *) querySentenceListByWord:(NSString *) word;

@end
