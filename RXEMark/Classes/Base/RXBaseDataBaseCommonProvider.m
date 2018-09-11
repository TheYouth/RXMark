//
//  RXBaseDataBaseCommonProvider.m
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXBaseDataBaseCommonProvider.h"
#import "RXFileUtil.h"
#import "RXDataBase.h"
@interface RXBaseDataBaseCommonProvider()

@property (nonatomic, strong) RXDataBase  *dateBase;

@end

@implementation RXBaseDataBaseCommonProvider

- (instancetype)init
{
    if (self = [super init]) {
        _dateBase = [[self class] getDefaultDataBase];
        [self buildTable:_dateBase];
    }
    return self;
}
- (FMDatabaseQueue *)dbQueue{
    return self.dateBase.dbQueue;
}
+ (RXDataBase *)getDefaultDataBase
{
    static RXDataBase *sDataBase;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        NSString * dbPath = [[RXFileUtil dataRootPath] stringByAppendingPathComponent:@"RXEMark.dat"];
        sDataBase = [[RXDataBase alloc] initWithDBPath:dbPath];
        sDataBase.tag = @"common";
    });
    return sDataBase;
}


@end
