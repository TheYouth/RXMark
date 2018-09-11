//
//  RXBaseDataBaseProvider.h
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXBaseDataProvider.h"
#import "RXDataBase.h"
//接口表示子类需要重写的
@protocol RXBaseDataBaseProvider<RXBaseDataProvider>

/**
 创建表

 @param db 表
 @return 是否成功
 */
- (BOOL)onCreateTable:(FMDatabase *)db;

/**
 更新表

 @param db 表
 @return 是否更新成功
 */
- (BOOL)onUpgradeTable:(FMDatabase *)db fromVersion:(NSInteger)fromVersion toVersion:(NSInteger)toVersion;

@end

@interface RXBaseDataBaseProvider : RXBaseDataProvider<RXBaseDataBaseProvider>

@property (nonatomic, readonly) FMDatabaseQueue *dbQueue;

- (void)buildTable:(RXDataBase *)dataBase;


@end
