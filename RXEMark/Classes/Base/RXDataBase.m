//
//  RXDataBase.m
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXDataBase.h"
#import "FMDB.h"

NSInteger const kEMInvalidVersion = 0;

@interface RXDataBase()
@property (nonatomic) FMDatabaseQueue *dbQueue;

//数据库内表的版本号
@property (atomic, copy) NSDictionary <NSString*, NSNumber *> *tableVersionMap;


@end

@implementation RXDataBase

- (instancetype)initWithDBPath:(NSString *)path{
    if (self = [super init]) {
        _dbQueue = [FMDatabaseQueue databaseQueueWithPath:path];
        [self loadTableVersions];
    }
    return self;
}
- (void)loadTableVersions{
    __weak __typeof(self) weakSelf = self;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        BOOL isSuccessed = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS table_version ("
                            @"name TEXT PRIMARY KEY, "
                            @"version INTEGER DEAFULT 0);"];
        if (isSuccessed) {
            [db executeUpdate:@"CREATE INDEX IF NOT EXISTS index_name ON table_version(name);"];
        }
        FMResultSet *resultSet = [db executeQuery:@"SELECT * FROM table_version"];
        NSMutableDictionary *versionsDict = [NSMutableDictionary dictionary];
        while ([resultSet next]) {
            NSString *tableName = [resultSet stringForColumn:@"name"];
            NSInteger version = [resultSet intForColumn:@"version"];
            if (tableName.length > 0) {
                [versionsDict setObject:@(version) forKey:tableName];
            }
        }
        [resultSet close];
        weakSelf.tableVersionMap = versionsDict;
    }];
}
- (NSInteger)getVersionOfTable:(NSString *)tableName{
    NSNumber *versionNum = nil;
    if (nil == self.tableVersionMap) {
        return kEMInvalidVersion;
    }
    versionNum = [self.tableVersionMap objectForKey:tableName];
    if (nil == versionNum) {
        return kEMInvalidVersion;
    }
    return  [versionNum integerValue];
}
- (BOOL)upadateVersion:(NSInteger)version ofTableName:(NSString *)tableName{
    if (tableName.length == 0) {
        return NO;
    }
    NSAssert(version > 0, @"The version of table %@ should be bigger than 0!", tableName);
    NSInteger currVersion = [self getVersionOfTable:tableName];
    if (currVersion == version) {
        return NO;
    }
    __block BOOL isSuccessed = NO;
    __weak __typeof(self) weakSelf = self;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        isSuccessed = [db executeUpdate:@"INSERT OR REPLACE INTO table_versions (name,version) VALUES (?,?);",tableName,@(version)];
        if (isSuccessed) {
            NSMutableDictionary *versionDict = [NSMutableDictionary dictionary];
            [versionDict setObject:@(version) forKey:tableName];
            weakSelf.tableVersionMap = versionDict;
        }
    }];
    return isSuccessed;
}

@end
