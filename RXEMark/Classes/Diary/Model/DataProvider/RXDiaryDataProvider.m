//
//  RXDiaryDataProvider.m
//  RXEMark
//
//  Created by pingan on 2018/9/14.
//  Copyright © 2018年 pingan. All rights reserved.
//

#import "RXDiaryDataProvider.h"
#import "FMDB.h"
#import "UIImage+Extern.h"
@implementation RXDiaryDataProvider

#pragma mark - Override

- (NSString *)name{
    return @"RXEmark_diary_list";
}
- (NSInteger)version{
    return 1;
}
- (BOOL)onCreateTable:(FMDatabase *)db{
    NSString *sql = @"CREAtE TABLE IF NOT EXISTS RXEmark_diary_list("
    @"diaryId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
    @"diaryDate                     TEXT, "
    @"diaryContent                  TEXT, "
    @"diaryImage                    BLOB "
    @");";
    BOOL result = [db executeUpdate:sql];
    if (result) {
        [db executeUpdate:@"CREAtE INDEX IF NOT EXISTS index_diaryId ON RXEmark_diary_list( diaryId );"];
    }
    return result;
}

#pragma mark - Public
- (NSArray<RXDiaryInfo *> *)selectDiaryInfosFromStart:(NSInteger)startIndex
                                           totalCount:(NSInteger)totalCount{
    __weak typeof(self) weakSelf = self;
     NSMutableArray *tmpArr = [NSMutableArray array];
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = nil;
        if (0 == startIndex) {
            result = [db executeQuery:@"SELECT * FROM RXEmark_diary_list ORDER BY diaryId DESC LIMIT ? ",@(totalCount)];
        } else {
            result = [db executeQuery:@"SELECT * FROM RXEmark_diary_list where diaryId < ? ORDER BY diaryId DESC LIMIT ? ",@(startIndex),@(totalCount)];
        }
        while (result.next) {
            RXDiaryInfo * diaryInfo = [weakSelf buildDiaryInfoWithResult:result];
            [tmpArr addObject:diaryInfo];
        }
        [result close];
    }];
    return tmpArr;
}
#pragma mark - Private
- (RXDiaryInfo *)buildDiaryInfoWithResult:(FMResultSet *)result{
    RXDiaryInfo *diaryInfo = [RXDiaryInfo new];
    diaryInfo.diaryId = [[result stringForColumn:@"diaryId"] integerValue];
    diaryInfo.diaryDate = [result stringForColumn:@"diaryDate"];
    diaryInfo.diaryContent = [result stringForColumn:@"diaryContent"];
    diaryInfo.diaryMiddleImage = [[UIImage imageWithData:[result dataForColumn:@"diaryImage"]]aspectResizeWithWidth:400];
    return diaryInfo;
}
- (UIImage *)selectImageWithDiaryId:(NSInteger)diaryId{
    __block UIImage *image = nil;
    [self.dbQueue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"SELECT * FROM RXMark_diary_list WHERE diaryId = ? ",@(diaryId)];
        while (result.next) {
            image = [UIImage imageWithData:[result dataForColumn:@"diaryImage"]];
        }
    }];
    return image;
}


@end
