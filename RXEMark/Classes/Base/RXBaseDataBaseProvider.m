//
//  RXBaseDataBaseProvider.m
//  RXEMark
//
//  Created by pingan on 2018/9/11.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXBaseDataBaseProvider.h"
#import "FMDB.h"
@implementation RXBaseDataBaseProvider

#pragma mark - Implemente EMBaseDataProvider

- (NSString *)name{
    NSAssert(NO, @"tableName should not be nil!");
    return nil;
}
- (NSInteger)version{
    return 1;
}
- (BOOL)onCreateTable:(FMDatabase *)db{
    NSAssert(NO, @"SEL(onCreateTable:) should be override");
    return NO;
}

- (BOOL)onUpgradeTable:(FMDatabase *)db fromVersion:(NSInteger)fromVersion toVersion:(NSInteger)toVersion{
    NSAssert(NO,@"SEL(onUpgradeTable: fromVersion: toVersion:) should be override");
    return NO;
}
- (FMDatabaseQueue *)dbQueue{
    NSAssert(NO,@"SEL(dbQueue) should be override");
    return nil;
}
#pragma mark - Public

- (void)buildTable:(RXDataBase *)dataBase{
    if ([NSThread isMainThread]) {
        NSLog(@"Don,t build table in main thread!");
    }
    if (0 == self.name.length) {
        return;
    }
    NSInteger version = [dataBase getVersionOfTable:self.name];
    NSInteger latestVersion = [self version];
    __block BOOL updatedVersion = NO;
    if (version == kEMInvalidVersion) {
        __weak __typeof(self) weakSelf = self;
        [dataBase.dbQueue inDatabase:^(FMDatabase *db) {
            updatedVersion = [weakSelf onUpgradeTable:db fromVersion:version toVersion:latestVersion];
        }];
    }else if (latestVersion > version){
        __weak __typeof(self) weakSelf = self;
        [dataBase.dbQueue inDatabase:^(FMDatabase *db) {
            updatedVersion = [weakSelf onUpgradeTable:db fromVersion:version toVersion:latestVersion];
        }];
    }
    if (updatedVersion) {
        [dataBase upadateVersion:latestVersion ofTableName:self.name];
    }
}
@end
