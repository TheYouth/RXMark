//
//  RXDataBase.h
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSInteger const kEMInvalidVersion;

@class FMDatabase;
@class FMDatabaseQueue;
@interface RXDataBase : NSObject

@property (nonatomic, readonly) FMDatabaseQueue *dbQueue;
@property (nonatomic, copy) NSString *tag;

/**
 初始化
 @param path 数据库存储路径
 @return RXDataBase
 */
- (instancetype)initWithDBPath:(NSString *)path;

/**
 获取某个表的版本号
 @param tableName 表名
 @return 版本号，没有表则返回默认值 kEMInvalidVersion(0)
 */
- (NSInteger)getVersionOfTable:(NSString *)tableName;

/**
 更新某个表的版本号，正常的版本号应该是：version > 0

 @param version 版本号
 @param tableName 表名称
 @return 是否更新成功
 */
- (BOOL)upadateVersion:(NSInteger)version ofTableName:(NSString *)tableName;

@end
